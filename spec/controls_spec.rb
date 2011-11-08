require "rspec"
require "watir-webdriver"

require "bookmarklet"
require "shared"


describe "X-Ray Goggles control" do 

  include_context "with a browser open"
  let(:url) { 'www.hackasaurus.org' }
  include_context "pointed at url"
  include_context "with a reloaded page"

  context "when goggles are inactive" do
    it "should launch from bookmarklet" do
      browser.div(:id => 'webxray-is-active').should_not exist
      browser.execute_script(BOOKMARKLET)
      browser.div(:id => 'webxray-is-active').should exist
    end
  end

  context "when goggles are active" do

    include_context "with reactivated goggles"

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
