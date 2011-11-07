# You can aim the test suite at different goggles via the following environment variables:
#
#   WEBXRAY       - values: local, production, or custom
#   WEBXRAY_URL   - if WEBXRAY=custom, this url will be used in the bookmarklet
#

WEBXRAY_LOCAL = "http://localhost:8000/webxray.js"
WEBXRAY_PROD  = "http://labs.toolness.com/temp/webxray-dev/webxray.js"

case ENV['WEBXRAY'] || 'local'
when 'local'
  WEBXRAY_URL = WEBXRAY_LOCAL
when 'production'
  WEBXRAY_URL = WEBXRAY_PROD
when 'custom'
  raise NameError.new("Environment variable WEBXRAY_URL not defined") unless ENV.member? 'WEBXRAY_URL'
  WEBXRAY_URL = ENV['WEBXRAY_URL']
else 
  raise ArgumentError.new("WEBXRAY must be one of: local, production, custom")
end

BOOKMARKLET = "javascript:(function(){var script=document.createElement('script');script.src='#{WEBXRAY_URL}';script.className='webxray';document.head.appendChild(script);})();"
