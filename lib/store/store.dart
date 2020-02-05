import 'package:flutter_news/reducer/app_reducer.dart';
import 'package:flutter_news/state/app_state.dart';
import 'package:redux/redux.dart';

final store = Store<AppState>(
  appReducer,
  initialState: AppState.init(),
  middleware: [],
);
