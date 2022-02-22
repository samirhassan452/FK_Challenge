import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocObserver, BlocBase, Bloc, Transition;
import 'package:flapkap_challenge/app/utility/utility_exports.dart' show Log;

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    'onCreate => bloc created ${bloc.state}'.log();
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    'onEvent $event'.log();
  }

  @override
  onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    'onTransition $transition'.log();
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    'onError $error'.log();
    super.onError(bloc, error, stackTrace);
  }
}
