//! Data Layer
/// data -> data sources
export 'data/data_sources/orders_local_data_source.dart';

/// data -> models
export 'data/models/order_model.dart';

/// data -> repositories
export 'data/repositories/orders_repository_implementation.dart';

//! Domain Layer
/// domain -> entities
export 'domain/entities/order_entity.dart';
export 'domain/entities/orders_analysis_data_entity.dart';
export 'domain/entities/orders_graph_statistics_entity.dart';

/// domain -> repositories
export 'domain/repositories/orders_repository.dart';

/// domain -> use cases
export 'domain/use_cases/get_orders.dart';
export 'domain/use_cases/get_orders_analysis.dart';
export 'domain/use_cases/get_orders_graph.dart';

//! Presentation Layer
/// presentation -> core -> blocs
export 'presentation/core/blocs/orders_analysis_bloc/orders_analysis_bloc.dart';
export 'presentation/core/blocs/orders_graph_bloc/orders_graph_bloc.dart';

/// presentation -> core -> view models
export 'presentation/core/view_models/orders_graph_view_model.dart';

/// presentation -> screens
export 'presentation/screens/orders_analysis_screen.dart';
export 'presentation/screens/orders_graph_screen.dart';

/// presentation -> widgets
export 'presentation/widgets/orders_header_widget.dart';

/// presentation -> widgets -> orders analysis widgets
export 'presentation/widgets/orders_analysis_widgets/order_analysis_card_widget.dart';
export 'presentation/widgets/orders_analysis_widgets/orders_analysis_body_widget.dart';

/// presentation -> widgets -> orders graph widgets
export 'presentation/widgets/orders_graph_widgets/orders_graph_body_widget.dart';
