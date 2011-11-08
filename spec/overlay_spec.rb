require "rspec"
require "watir-webdriver"

require "bookmarklet"
require "shared"


describe "Goggles overlay" do
  context "when goggles are active" do 

    include_context "with a browser open"
    let(:url) { 'www.hackasaurus.org' }
    include_context "pointed at url"

    include_context "when goggles are active"

    let(:overlay) { 
      # Bug? Doesn't seem to find the div without both classes...
      browser.div(:class => 'webxray-base webxray-overlay') 
    }

    # Sacrificing some readability for brevity here.
    # I'm not sure if it's useful to check a bunch of elements individually,
    # or if just one would do it. 
    ['a', 'p', 'ul', 'li', 'h1', 'h2', 'div'].each do |element|
      context "when <#{element}> moused-over" do

        before(:all) { 
          browser.elements(:tag_name => element).first.fire_event 'onmouseover' 
        }

        subject { overlay }

        it { should exist }
        it { should be_visible }
        specify { overlay.text.should include "<#{element}>" }
        specify { overlay.text.should include "</#{element}>" }
      end
    end
  end
end

