require "./interstellar-cry/*"
require "redis"
require "http/server"

module MyCrystalTest
  server = HTTP::Server.new(8080) do |context|
    redis = Redis.new
    vhost = redis.hget "interstellar:vhost", "#{context.request.host_with_port}:#{context.request.path}"
    if vhost
      info = vhost.split(/ /)
      if info[0] == "MAINTENANCE"
        context.response.content_type = info[3].to_s
        context.response.status_code = 503
      else
        params = ""
        if context.request.query
          params = context.request.query
        end
        if context.request.body
          params = context.request.body.not_nil!.gets_to_end
        end
        if info[4] != "null"
          if info[4] != context.request.headers["apiKey"]
            context.response.content_type = info[3].to_s
            context.response.print "Not authorized"
          else
            service = Exec::Microservice.new
            result = service.run info, context.request.headers, params
            context.response.content_type = info[3].to_s
            context.response.print result.to_s
          end
        else
          service = Exec::Microservice.new
          result = service.run info, context.request.headers, params
          context.response.content_type = info[3].to_s
          context.response.print result.to_s
        end
      end
    end
  end

  puts "Listening on http://127.0.0.1:8080"
  server.listen
end
