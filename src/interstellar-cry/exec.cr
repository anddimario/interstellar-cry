include IO
require "http/server"

module Exec
  class Microservice
    def run(info : Array, headers, params)
      command = info[2].to_s
      if params
        command = "#{info[2]} '#{headers}' '#{params}'"
      end
      if info[1] == "JOB"
        Process.new(command, shell: true)
        return "done"
      else
        io = Memory.new
        Process.run(command, shell: true, output: io)
        return io
      end
    end
  end
end
