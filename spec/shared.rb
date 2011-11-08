require 'watir-webdriver'
require 'bookmarklet'
require 'goggles_helper'

shared_context "with a browser open" do 
  before(:all) { 
    @browser = Watir::Browser.new :firefox 
    @goggles = GogglesHelper.new(@browser)
  }
  after(:all)  { @browser.close }

  let(:browser) { @browser }
  let(:goggles) { @goggles }
end

shared_context "pointed at url" do
  # url should be defined in including spec
  before(:all) { browser.goto(url) }
end

shared_context "pointed at the test page" do
  let(:url) { "file://" + File.expand_path(File.dirname(__FILE__) + "/../testpage.html") }
  include_context "pointed at url"
end

shared_context "with a reloaded page" do
  before(:each) { browser.refresh }
end

shared_context "when goggles are active" do 
  before(:all) { 
    browser.execute_script(BOOKMARKLET) 
    Watir::Wait.while { !goggles.active? }
  }
end

shared_context "with reactivated goggles" do 
  before(:each) { 
    browser.execute_script(BOOKMARKLET) 
    Watir::Wait.while { !goggles.active? }
  }
end
