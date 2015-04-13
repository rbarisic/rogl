require 'gosu'
require './assets/settings'

def require_all(path, message: nil)
    puts message
    Dir[File.dirname(__FILE__) + "/#{path}/*.rb"].each do |file|
        begin
            require file
            puts "#{file} loaded."
        rescue
            puts "oh no"
        end
    end
end

require_all('./lib', message: 'Loading Engine')
require_all('./assets/entities', message: 'Loading Entities')

window = Engine::Window.new
window.show