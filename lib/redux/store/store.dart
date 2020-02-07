import 'package:flutter_news/redux/middleware/app_middleware.dart';
import 'package:flutter_news/redux/reducer/app_reducer.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:redux/redux.dart';

final Store<AppState> store = Store<AppState>(
  appReducer,
  initialState: AppState.init(),
  middleware: appMiddleware,
);
