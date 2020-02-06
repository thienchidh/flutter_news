import 'package:flutter_news/redux/middleware/news_middleware.dart';
import 'package:flutter_news/redux/reducer/app_reducer.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

final Store<AppState> store = Store<AppState>(
  appReducer,
  initialState: AppState.init(),
  middleware: [
    NewsMiddleWare(),
    LoggingMiddleware.printer(),
  ],
);
