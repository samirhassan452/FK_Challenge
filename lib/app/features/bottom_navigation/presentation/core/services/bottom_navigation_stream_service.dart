import 'dart:async' show StreamController;

import 'package:flapkap_challenge/app/features/bottom_navigation/bottom_navigation_exports.dart'
    show BottomNavigationModel;

class BottomNavigationStreamService {
  late StreamController<BottomNavigationModel> _bottomNavigationController;
  late BottomNavigationModel defaultItem;
  late List<BottomNavigationModel> _listOfBottomNavigations;

  BottomNavigationStreamService(
      List<BottomNavigationModel> listOfBottomNavigations,
      {int defaultItemIndex = 0}) {
    _bottomNavigationController = StreamController.broadcast();
    // this.defaultItem = listOfBottomNavigations.first;
    defaultItem = listOfBottomNavigations.elementAt(defaultItemIndex);
    _listOfBottomNavigations = listOfBottomNavigations;
  }

  Stream<BottomNavigationModel> get itemStream =>
      _bottomNavigationController.stream;

  void pickItem(int itemIndex) {
    _bottomNavigationController.sink.add(
      _listOfBottomNavigations.elementAt(itemIndex),
    );
  }

  void close() {
    _bottomNavigationController.close(); // ?. if not null perform close()
  }
}
