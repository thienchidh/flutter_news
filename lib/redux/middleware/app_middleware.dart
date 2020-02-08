import 'package:flutter_news/redux/middleware/news_middleware.dart';
import 'package:flutter_news/redux/middleware/video_middleware.dart';
import 'package:flutter_news/redux/state/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

final List<Middleware<AppState>> appMiddleware = [
  ...newsMiddleware,
  ...videoMiddleware,
  LoggingMiddleware.printer(),
];
