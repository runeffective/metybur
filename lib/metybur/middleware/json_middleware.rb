class Metybur::JSONMiddleware
  def open(event)
    event
  end

  def message(event)
    JSON.parse(event.data, symbolize_names: true)
  end

  def error(event)
    {
      message: event.message
    }
  end

  def close(event)
    event
  end
end
