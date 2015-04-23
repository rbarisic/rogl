require 'rspec'
require './engine'

RSpec.describe Engine::GUI::Window do
    $window = Engine::Window.new(false)
    let(:gui_window) { Engine::GUI::Window.new(79,32,133,265,Gosu::Color.new(255,255,255),border: { size: 4, color: Gosu::Color.new(127,255,255,255) }) }

    it "should have all necessary variables" do
        gui_window = Engine::GUI::Window.new(79,32,133,265,Gosu::Color.new(255,255,255),border: { size: 4, color: Gosu::Color.new(127,255,255,255) })
    end

    it "should assign the proper values" do
        expect(gui_window.x).to eq(79)
        expect(gui_window.y).to eq(32)
        expect(gui_window.width).to eq(133)
        expect(gui_window.height).to eq(265) 
        expect(gui_window.border[:size]).to eq(4) 
        expect(gui_window.border[:color]).to eq(Gosu::Color.new(127,255,255,255)) 
    end

    it 'should respond to the #update method' do
        expect(gui_window).to respond_to(:update)
    end

    it 'should respond to the #draw method' do
        expect(gui_window).to respond_to(:draw)
    end

    it 'should respond to the #dock method' do
        expect(gui_window).to respond_to(:dock)
    end

    it 'should respond to the #resize method' do
        expect(gui_window).to respond_to(:resize)
    end

    it 'should respond to the #drag method' do
        expect(gui_window).to respond_to(:drag)
    end

    it 'should be able to draw a border around itself' do
        expect(gui_window).to have_attributes(:border => { :size => 4, color: Gosu::Color.new(127,255,255,255)})
        expect(gui_window).to respond_to(:draw_border)
    end
end