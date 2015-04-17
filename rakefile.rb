# Rakefile
require 'opal'

desc "Build our app to build.js"
task :build do
  Opal.append_path "app"
  File.binwrite "build.js", Opal::Builder.build("engine").to_s
end