# selenium_cucumber_test
Experimenting with selenium and cucumber for learning purposes

# Setup
Install geckodriver to run the tests with Firefox and/or chromedriver to run the tests with Chrome.

Run `bundle install` to install all the gem dependencies.

# Running the test
Run `cucumber` to run the test. Depending on how your gems are setup, you may need to use `bundle exec cucumber`.

The test runs with Firefox by default, but you can run it with Chrome instead by running `cucumber browser=chrome` or `bundle exec cucumber browser=chrome`.
