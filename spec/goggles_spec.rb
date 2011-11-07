require "rubygems"
require "rspec"
require "watir-webdriver"

BOOKMARKLET = "javascript:(function(){var script=document.createElement('script');script.src='http://localhost:8000/webxray.js';script.className='webxray';document.head.appendChild(script);})();"

describe "X-Ray Goggles" do 

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
  end
    
end
