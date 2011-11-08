require "rspec"
require "watir-webdriver"

require "bookmarklet"
require "shared"


describe "X-Ray Goggles control" do 

  include_context "with a browser open"
  include_context "pointed at the test page"
  include_context "with a reloaded page"

  context "when goggles are inactive" do
    it "should launch from bookmarklet" do
      goggles.should_not be_active
      browser.execute_script(BOOKMARKLET)
      goggles.should be_active
    end
  end

  context "when goggles are active" do

    include_context "with reactivated goggles"

    it "should close on ESC" do
      goggles.should be_active
      browser.body.send_keys :escape
      goggles.should_not be_active
    end

    it "should show help on H" do
      browser.body.send_keys 'h' 
      goggles.help.should be_visible
    end

  end
end
