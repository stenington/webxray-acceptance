These are acceptance tests for the [Web X-Ray Goggles](http://hackasaurus.org/en-US/goggles/) project. They're 
written in [RSpec](http://rspec.info/) using [Watir-WebDriver](http://watirwebdriver.com/).

## Acceptance testing

Unlike unit tests, acceptance tests should be very **high-level**, describing the functionality and features an end-user
wants to see. Additionally, the tests should be highly **expressive** such that an end-user can make sense of their
intent and, ideally, add to the suite of acceptance tests themselves. RSpec was chosen for its readability and
ability to run Watir-WebDriver (although a tool like [Cucumber](http://cukes.info/) could drive this even farther). 

## Running the tests

### Install rspec

Assuming you have `ruby` and `rubygems` installed, run:

    $ [sudo] gem install rspec

### Using rspec

The easiest way to get and run this test suite is:

    $ git clone git://github.com/stenington/webxray-acceptance.git
    $ cd ./webxray-acceptance
    $ rspec

By default, `rspec` looks for `./spec/**/*_spec.rb` and runs all the files it finds.

### RSpec output formatting

A nice alternative output can be specified like so:

    $ rspec --format documentation  

or more concisely:

    $ rspec -f 

See `rspec -h` for more formatters.

