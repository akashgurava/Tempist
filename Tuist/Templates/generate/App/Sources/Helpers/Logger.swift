import OSLog

/// Category for logger.
///
/// This can be used to filter the logs easily.
internal enum LogCategory: String {
    /// Messages to log related to app startup.
    case startup = "STARTUP"

    /// Messages to log related to app startup.
    case buildView = "BUILD_VIEW"
}

/// Logger for the application.
internal enum AppLogger {
    /// Group of loggers.
    private static let logger: [LogCategory: Logger] = [
        .startup: Logger(
            subsystem: kAppIdentifier, category: LogCategory.startup.rawValue
        ),
        .buildView: Logger(
            subsystem: kAppIdentifier, category: LogCategory.buildView.rawValue
        ),
    ]

    /// Log application start.
    static func logAppInitStart() {
        let logger = logger[force: .startup]
        logger.info("Application Init starting.")
    }

    /// Log application startup end.
    static func logAppInitSuccess() {
        let logger = logger[force: .startup]
        logger.info("Application Init success.")
    }

    /// Log application startup end.
    static func logViewBuilding(_ viewName: String, msg: String? = nil) {
        let logger = logger[force: .buildView]
        if let msg = msg {
            logger.debug("View: \(viewName). \(msg)")
        } else {
            logger.debug("View: \(viewName).")
        }
    }
}
