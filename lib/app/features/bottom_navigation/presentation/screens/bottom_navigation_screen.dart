import 'package:flapkap_challenge/app/features/bottom_navigation/bottom_navigation_exports.dart'
    show
        BottomNavigationBarCardWidget,
        BottomNavigationMapping,
        BottomNavigationModel,
        BottomNavigationStreamService,
        BottomNavigationViewModel;
import 'package:flapkap_challenge/app/features/orders/orders_exports.dart'
    show
        GetOrdersAnalysisRequested,
        GetOrdersGraphRequested,
        OrdersAnalysisBloc,
        OrdersGraphBloc;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show AppColors, CustomPopUpsWidgets, defaultConfiguration, sl;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocProvider, MultiBlocProvider;

class BottomNavigationScreen extends StatefulWidget {
  final int? bottomTabIndex;
  const BottomNavigationScreen({
    Key? key,
    this.bottomTabIndex = 0,
  }) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  late List<BottomNavigationModel> _listOfBottomNavigations;
  late BottomNavigationStreamService _bottomNavigationStreamService;
  late BottomNavigationViewModel _bottomNavigationViewModel;

  @override
  void initState() {
    super.initState();

    _listOfBottomNavigations =
        BottomNavigationModel.getListOfBottomNavigationsFromListOfJsons(
      defaultConfiguration["BottomNavigations"],
    );
    _bottomNavigationStreamService = BottomNavigationStreamService(
      _listOfBottomNavigations,
      defaultItemIndex: widget.bottomTabIndex!,
    );
    _bottomNavigationViewModel = BottomNavigationViewModel();
  }

  @override
  void dispose() {
    _bottomNavigationStreamService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrdersAnalysisBloc>(
          create: (_) =>
              sl<OrdersAnalysisBloc>()..add(GetOrdersAnalysisRequested()),
        ),
        BlocProvider<OrdersGraphBloc>(
          create: (_) => sl<OrdersGraphBloc>()..add(GetOrdersGraphRequested()),
        ),
      ],
      child: WillPopScope(
        onWillPop: () async => CustomPopUpsWidgets.showCloseAppMessageDialog(),
        child: StreamBuilder<BottomNavigationModel>(
          initialData: _bottomNavigationStreamService.defaultItem,
          stream: _bottomNavigationStreamService.itemStream,
          builder: (_, snapshot) => Scaffold(
            body: BottomNavigationMapping.mapStringKeyToScreen(
              snapshot.data!.key,
              arguments: _bottomNavigationViewModel
                  .getScreenBasedArguments(snapshot.data!.key),
            ),
            // wrap container to builder widget to ignore this problem:
            // Scaffold.of() called with a context that does not contain a Scaffold
            bottomNavigationBar: Builder(
              builder: (_) => Container(
                color: AppColors.white,
                width: size.width,
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _listOfBottomNavigations
                      .map((item) => BottomNavigationBarCardWidget(
                            bottomNavigationModel: item,
                            cardHeight:
                                size.width / _listOfBottomNavigations.length,
                            currentItemId: snapshot.data!.id,
                            onPickItem: _bottomNavigationStreamService.pickItem,
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
