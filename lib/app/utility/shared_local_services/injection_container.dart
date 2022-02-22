import 'package:flapkap_challenge/app/features/orders/orders_exports.dart'
    show
        GetOrders,
        OrdersAnalysisBloc,
        OrdersGraphBloc,
        OrdersLocalDataSource,
        OrdersLocalDataSourceImplementation,
        OrdersRepository,
        OrdersRepositoryImplementation;
import 'package:get_it/get_it.dart' show GetIt;

// sl -> service locator
final sl = GetIt.instance;

void init() {
  //! Features
  // Bloc
  sl.registerFactory(() => OrdersAnalysisBloc(getOrders: sl()));
  sl.registerFactory(() => OrdersGraphBloc(getOrders: sl()));

  // Use cases
  sl.registerLazySingleton(() => GetOrders(ordersRepository: sl()));

  // repository
  // because OrdersRepository is abstract class, so we cannot inistanciate from it
  // so we will create instance from it's implementation
  sl.registerLazySingleton<OrdersRepository>(
    () => OrdersRepositoryImplementation(localDataSource: sl()),
  );

  // data sources
  sl.registerLazySingleton<OrdersLocalDataSource>(
    () => OrdersLocalDataSourceImplementation(),
  );
}
