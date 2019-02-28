require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox

Given("We navigate to the homepage") do
  driver.navigate.to("http://automationpractice.com/index.php")
end

When("We log in") do
  driver.find_element(:link_text, "Sign in").click

  driver.find_element(:id, "email").send_keys("LargeBagel@mailinator.com")
  driver.find_element(:id, "passwd").send_keys("asdfjklsemicolon")
  driver.find_element(:id, "SubmitLogin").click
end

Then("The cart will be empty") do
  cart = driver.find_element(:class, "shopping_cart")
  expect(cart.text).to eq("Cart (empty)")
end

When("We click on the {string} tab in the top menu") do |string|
  top_menu = driver.find_element(:id, "block_top_menu")
  top_menu.find_element(:xpath, "//*[text()='#{string}']").click
end

When("We expand the {string} category in the side menu") do |string|
  categories = driver.find_element(:id, "categories_block_left")
  link = categories.find_element(:link_text, string)
  parent = link.find_element(:xpath, "..")
  parent.find_element(:class, "grower").click
end

Then("The heading counter will say {string}") do |string|
  heading_counter = driver.find_element(:class, "heading-counter")
  expect(heading_counter.text).to eq(string)
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
