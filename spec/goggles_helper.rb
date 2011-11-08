class GogglesHelper
  attr_accessor :browser

  def initialize(browser)
    @browser = browser
  end

  def active?
    @browser.div(:id => 'webxray-is-active').exists?
  end

  def overlay
    # Bug? Doesn't seem to find the div without both classes...
    @browser.div(:class => 'webxray-base webxray-overlay')
  end

  def help
    browser.div(:text => /This help reference/i)
  end
end
