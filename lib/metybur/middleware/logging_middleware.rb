class Metybur::LoggingMiddleware
  def initialize
    @logger = Logger.new(Metybur::CONFIG[:log_stream])
    @logger.level = Metybur::CONFIG[:log_level]
  end

  def open(event)
    @logger.debug 'connection open'
    event
  end

  def message(event)
    @logger.debug "received message #{event.data}"
    event
  end

  def error(event)
    @logger.error "received error message #{event.message}"
    event
  end

  def close(event)
    @logger.debug "connection closed (code #{event.code}). #{event.reason}"
    event
  end
end
