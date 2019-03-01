require 'selenium-webdriver'

driver = Selenium::WebDriver.for :firefox

Given("We navigate to the homepage") do
  driver.navigate.to("http://automationpractice.com/index.php")
end

When("We log in") do
  # Click the "Sign in" link
  driver.find_element(:link_text, "Sign in").click

  # Input email and password, and click the submit button
  driver.find_element(:id, "email").send_keys("LargeBagel@mailinator.com")
  driver.find_element(:id, "passwd").send_keys("asdfjklsemicolon")
  driver.find_element(:id, "SubmitLogin").click
end

Then("The cart will say {string}") do |string|
  # Select the shopping cart
  cart = driver.find_element(:class, "shopping_cart")

  # Check that the cart has text equal to the input string
  expect(cart.text).to eq(string)
end

When("We click on the {string} tab in the top menu") do |string|
  # Find the top menu
  top_menu = driver.find_element(:id, "block_top_menu")

  # Click the element in the top menu with text equal to input string
  top_menu.find_element(:xpath, "//*[text()='#{string}']").click
end

When("We expand the {string} category in the side menu") do |string|
  # Find the categories menu on the left
  categories = driver.find_element(:id, "categories_block_left")

  # Find the link in the categories menu with matching link text
  link = categories.find_element(:link_text, string)

  # Find and click the grower, which is a preceding sibling to the link
  grower = link.find_element(:xpath, "preceding-sibling::span").click
end

Then("The heading counter will say {string}") do |string|
  # Find the heading counter
  heading_counter = driver.find_element(:class, "heading-counter")

  # Check that the heading counter has text equal to the input string
  expect(heading_counter.text).to eq(string)
end

When("We add one item to the cart") do
  # Find any product container
  product = driver.find_element(:class, "product-container")

  # Scroll the product container into view
  driver.execute_script("arguments[0].scrollIntoView();", product)

  # Move the mouse over the product container to display "Add to cart" button
  driver.action.move_to(product).perform

  # Wait a split second for the button to appear
  # There might be a better way to handle this
  sleep(0.5)

  # Click the "Add to cart" button
  product.find_element(:link_text, "Add to cart").click
end

Then("The post-add-to-cart dialogue box will pop up") do
  # Wait for the layer_cart div to appear
  wait_until do
    popup = driver.find_element(:id, "layer_cart")
    !popup.text.empty? # There's probably a better way
  end
end

Then("The right of the post-add-to-cart dialogue box will say {string}") do |string|
  # Find the right side div of the popup
  popup_right = driver.find_element(:class, "layer_cart_cart")

  # Find the h2 tag within the right side div
  cart_heading = popup_right.find_element(:tag_name, "h2")

  # Check that the heading text is equal to the input string
  expect(cart_heading.text).to eq(string)
end

After do
  driver.quit
end

private

# Implicit wait for the passed block to return a truthy value
# Default 10s timeout
def wait_until timeout=10, &block
  wait = Selenium::WebDriver::Wait.new(:timeout => timeout)
  wait.until &block
end
