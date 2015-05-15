require './engine.rb'
$project_name = 'Isotest'
$window = Engine::Window.new(false) # no fullscreen

@col = Gosu::Color.argb(0xff333333)

$window.entities << Engine::Entities::Player.new($tile_width,$tile_height,$tile_width,$tile_height,@col,
	image: "assets/img/cursor_highlight.png")

$window.show