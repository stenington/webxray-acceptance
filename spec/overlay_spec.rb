require "rspec"
require "watir-webdriver"

require "bookmarklet"
require "shared"


describe "Goggles overlay" do
  context "when goggles are active" do 

    include_context "with a browser open"
    include_context "pointed at the test page"
    include_context "when goggles are active"

    # Sacrificing some readability for brevity here.
    # Although, I'm not sure if it's useful to check a bunch of elements 
    # individually, or if just one would do it. 
    ['a', 'p', 'ul', 'li', 'h1', 'h2', 'div'].each do |element|
      context "when <#{element}> moused-over" do

        before(:all) { 
          browser.elements(:tag_name => element).first.fire_event 'onmouseover' 
          Watir::Wait.while { !goggles.overlay.exists? }
        }

        subject { goggles.overlay }

        it { should exist }
        it { should be_visible }
        specify { goggles.overlay.text.should include "<#{element}>" }
        specify { goggles.overlay.text.should include "</#{element}>" }
      end
    end
  end
end

