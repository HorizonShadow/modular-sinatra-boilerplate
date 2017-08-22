require_relative 'config/helpers'
require_relative 'config/models'
require_relative 'config/app'
require_relative 'config/controllers'

require 'rack/ssl'

module Site
  class Main < Sinatra::Base
    use Rack::SSL
    use Rack::Deflater
    use Rack::Static,
        urls: %w(/img /js /fonts /css),
        root: 'public'

    use Controllers::Index
  end
end