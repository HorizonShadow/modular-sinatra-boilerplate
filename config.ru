require_relative 'app/main'
# Require any other applications
# example:
#   require_relative 'admin/main'

map('/') { run Site::Main }

