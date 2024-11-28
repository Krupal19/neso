import 'package:talker_flutter/talker_flutter.dart';

abstract class AppUtility {

  static final logger = TalkerFlutter.init();

  static void log(dynamic message, {String? tag}) {
    switch (tag) {
      case 'error':
        logger.error(message);
        break;
      case 'warning':
        logger.warning(message);
        break;
      case 'info':
        logger.info(message);
        break;
      case 'debug':
        logger.debug(message);
        break;
      case 'critical':
        logger.critical(message);
        break;
      default:
        logger.verbose(message);
        break;
    }
  }
}
