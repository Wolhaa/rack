require_relative 'time'

class App
  def call(env)
    req = Rack::Request.new(env)

    if req.path_info == '/time'
      time(req.params)
    else
      [404, headers, ['URL Not Found']]
    end
  end

  private

  def time(params)
    time = TimeParser.new(params)
    body = [time.result.join("\n") + "\n\n"]

    time.success? ? [200, headers, body] : [400, headers, body]
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end
end
