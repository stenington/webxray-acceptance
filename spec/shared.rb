
shared_context "with a browser open" do 
  before(:all) { @browser = Watir::Browser.new :firefox }
  after(:all)  { @browser.close }

  let(:browser) { @browser }
end

shared_context "pointed at url" do
  # url should be defined in including spec
  before(:all) { browser.goto(url) }
end

shared_context "with a reloaded page" do
  before(:each) { browser.refresh }
end

shared_context "when goggles are active" do 
  before(:all) { browser.execute_script(BOOKMARKLET) }
end

shared_context "with reactivated goggles" do 
  before(:each) { browser.execute_script(BOOKMARKLET) }
end
