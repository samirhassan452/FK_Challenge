import 'package:flapkap_challenge/app/app.dart' show App;
import 'package:flapkap_challenge/app/utility/utility_exports.dart'
    show SimpleBlocObserver;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocOverrides;

import 'app/utility/shared_local_services/injection_container.dart' as di;

void main() {
  di.init();
  // to observe bloc events & states
  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: SimpleBlocObserver(),
  );
}
