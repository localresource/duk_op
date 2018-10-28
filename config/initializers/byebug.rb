unless defined?(Rails::Console) || ENV['NO_REMOTE_BYEBUG'] || !Rails.env.development?
  require 'byebug'
  require 'byebug/core'
  begin
    Byebug.start_server("0.0.0.0")
    Rails.logger.info "Debugger listening on port: #{Byebug.actual_port}"
  rescue => e
  end
end
