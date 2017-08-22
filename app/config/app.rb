require 'sinatra'
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/namespace'
require 'haml'

module Site
  class App < Sinatra::Base
    register Sinatra::Flash, Sinatra::Namespace
    # Add any global helpers here. For example, helpers used in the layout file
    # Example:
    #   helpers LayoutHelper, URLHelper

    configure do
      set :root, File.join(File.dirname(__FILE__), '..')
      set :haml, layout_options: { views: File.join(App.root, 'views', 'layouts') }
      set :public_folder, Proc.new { File.join(root, '..', 'public') }
      enable :sessions
    end

  end
end
