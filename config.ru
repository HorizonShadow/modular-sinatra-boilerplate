require_relative 'app/main'
# Require any other applications
# example:
#   require_relative 'admin/main'

use Rack::SSL
use Rack::Deflater
use Rack::Static,
    urls: %w[/img /js /fonts /css],
    root: 'public'

map('/') { run Site::Main }

Rack::Handler::Thin.run(to_app, Port: 9292) do |server|
  server.ssl = true
  server.ssl_options = {
    cert_chain_file: ENV['SSL_CERT'],
    private_key_file: ENV['SSL_PK'],
    verify_peer: false
  }
  server.threaded = true
end
