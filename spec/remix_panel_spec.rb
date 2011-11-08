require "rspec"
require "shared"


describe "Goggles remix panel" do 
  context "when goggles are active" do

    include_context "with a browser open"
    include_context "pointed at the test page"
    include_context "when goggles are active"
   
    context "when remixing first <p>" do
      before(:all) { 
        remixee = browser.ps.first
        remixee.fire_event 'onmouseover'
        browser.body.send_keys 'r'
        goggles.remix_panel.wait_until_present
      }

      subject { goggles.remix_panel }

      it { should exist }
      it { should be_visible }
      # TODO: make these possible
      #specify { goggles.remix_panel.basic_source_panel.should include "<p>" }
      #specify { goggles.remix_panel.basic_source_panel.should include "And a paragraph." }
      #specify { goggles.remix_panel.basic_source_panel.should include "</p>" }
      #specify { goggles.remix_panel.what_you_see_panel.should include "And a paragraph."
    end

  end
end
