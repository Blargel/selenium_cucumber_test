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

Then("The cart will say {string}") do |string|
  cart = driver.find_element(:class, "shopping_cart")
  expect(cart.text).to eq(string)
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
  product = driver.find_element(:class, "product-container")
  driver.execute_script("arguments[0].scrollIntoView();", product)
  driver.action.move_to(product).perform

  wait = Selenium::WebDriver::Wait.new(:timeout => 1)
  add_to_cart = wait.until do
    product.find_element(:link_text, "Add to cart")
  end
  add_to_cart.click
end

Then("The post-add-to-cart dialogue box will pop up") do
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  wait.until do
    popup = driver.find_element(:id, "layer_cart")
    !popup.text.empty?
  end
end

Then("The right of the dialogue box will say {string}") do |string|
  popup_right_col = driver.find_element(:class, "layer_cart_cart")
  cart_text = popup_right_col.find_element(:class, "ajax_cart_product_txt").text
  expect(cart_text).to eq(string)
end

After do
  driver.quit
end
