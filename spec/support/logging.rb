def change_log(stream)
  ActiveRecord::Base.logger = Logger.new(stream)
  ActiveRecord::Base.clear_active_connections!
end

def show_log
  change_log(STDOUT)
  if block_given?
    yield
    hide_log
  else
    "Logging to STDOUT"
  end
end

def hide_log
  change_log(nil)
end

def enable_trace( event_regex = /^(call|return)/, class_regex = /AwesomePrint|IRB|Wirble|RubyLex|RubyToken/ )
  puts "Enabling method tracing with event regex #{event_regex.inspect} and class exclusion regex #{class_regex.inspect}"

  set_trace_func Proc.new{|event, file, line, id, binding, classname|
    printf "[%8s] %30s %30s (%s:%-2d)\n", event, id, classname, file.to_s.match(/.{1,80}$/).to_s, line if
      event          =~ event_regex and
      classname.to_s !~ class_regex
  }
  return
end

def disable_trace
  puts "Disabling method tracing"

  set_trace_func nil
end

def trace_block(*args)
  enable_trace(*args)
  yield
  disable_trace
end

