package logger

func (l *Logger) InfoServerRequest(method, urlPath, requestTime string) {
	l.logger.Info("", "method", method, "url", urlPath, "time", requestTime)
}
