require "rubygems"
require "rspec"
require "watir-webdriver"

require "bookmarklet"


describe "X-Ray Goggles (#{WEBXRAY_URL})" do 

  before(:all) { @browser = Watir::Browser.new :firefox }
  after(:all)  { @browser.close }

  before(:each) { 
    browser.goto('www.hackasaurus.org')
    browser.link(:id => 'mozilla').wait_until_present
  }

  let(:browser) { @browser }

  context "when goggles are inactive" do
    it "should launch from bookmarklet" do
      browser.div(:id => 'webxray-is-active').should_not exist
      browser.execute_script(BOOKMARKLET)
      browser.div(:id => 'webxray-is-active').should exist
    end
  end

  context "when goggles are active" do

    before(:each) { browser.execute_script(BOOKMARKLET) }

    it "should close on ESC" do
      browser.div(:id => 'webxray-is-active').should exist
      browser.body.send_keys :escape
      browser.div(:id => 'webxray-is-active').should_not exist
    end

    it "should show help on H" do
      browser.body.send_keys 'h' 
      browser.div(:text => /This help reference/i).should be_visible
    end

    describe "overlay" do
      
      let(:overlay) { 
        # Bug? Doesn't seem to find the div without both classes...
        browser.div(:class => 'webxray-base webxray-overlay') 
      }

      context "when link moused-over" do

        before(:each) { 
          browser.links.first.fire_event 'onmouseover' 
        }

        subject { overlay }

        it { should exist }
        it { should be_visible }
        specify { overlay.text.should include "<a>" }
        specify { overlay.text.should include "</a>" }
      end
    end
  end
end
