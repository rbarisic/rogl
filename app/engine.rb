require 'colorize'
require 'gosu'

def putv(string) #put verbosely
    puts "#{string}" if ARGV.include?('--verbose')
end

def putb(string) #put benchmark-info
    puts "#{string}" if ARGV.include?('--benchmark')
end

def require_all(path, message: nil)
    puts message
    Dir[File.dirname(__FILE__) + "/#{path}/*.rb"].each do |file|
        begin
            require file
            putv "#{file} loaded.".colorize(:green)
        rescue => e
            putv "*WARNING* #{file} could not be loaded!".colorize(:red)
            putv "*WARNING* ---> Reason: ".colorize(:red) + "#{e}"
        end
    end
end

require_all('lib', message: 'Loading Engine')
require_all('config', message: 'Loading Configuration')
require_all('./assets/entities', message: 'Loading Entities')
#
# NOT WORKING WITH OPAL // STATIC REQUIRE INSTEAD
#===================================

# window = Engine::Window.new
# window.entities
# window.show