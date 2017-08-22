require_relative 'app/main'
# Require any other applications
# example:
#   require_relative 'admin/main'

routes = Rack::URLMap.new(
                         '/' => Site::Main
                         # Mount your other apps here
                         # Example:
                         #   '/admin' => Admin::Main
)

Rack::Handler::Thin.run(routes, Port: 9292) do |server|
  server.ssl = true
  server.ssl_options = {
      :cert_chain_file => ENV['SSL_CERT'],
      :private_key_file => ENV['SSL_PK'],
      :verify_peer => false
  }
  server.threaded = true
end

