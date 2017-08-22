module Site
  module Controllers
    class Index < App
      set :views, File.join(App.root, 'views', 'pages', 'index')

      show = lambda do
        haml :show
      end

      namespace '/' do
        get &show
      end
    end
  end
end