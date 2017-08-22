require_relative 'config/helpers'
require_relative 'config/models'
require_relative 'config/app'
require_relative 'config/controllers'

require 'rack/ssl'

module Site
  class Main < Sinatra::Base
    use Controllers::Index
  end
end