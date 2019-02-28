require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox

Given("We navigate to the homepage") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("We log in") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("The cart will be empty") do
  pending # Write code here that turns the phrase above into concrete actions
end

When("We click on the {string} tab in the top menu") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

When("We expand the {string} category in the side menu") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Then("The page says there are {int} products") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end

When("We add one item to the cart") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("The cart will have {int} product") do |int|
  pending # Write code here that turns the phrase above into concrete actions
end

After do
  driver.quit
end
