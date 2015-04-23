require 'rspec'
require 'gui'

RSpec.describe Engine::GUI do
    it "should describe all GUI Elements" do
        expect { Engine::GUI::Base }.not_to raise_error
        expect { Engine::GUI::Button }.not_to raise_error
        expect { Engine::GUI::Cursor }.not_to raise_error
        expect { Engine::GUI::Window }.not_to raise_error
    end
end