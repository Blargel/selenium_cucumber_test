Feature: Adding an item to the shopping cart
Scenario:
  Given We navigate to the homepage
  When We log in
  Then The cart will say "Cart (empty)"
  When We click on the "Women" tab in the top menu
  And We expand the "Tops" category in the side menu
  And We expand the "Dresses" category in the side menu
  Then The heading counter will say "There are 7 products."
  When We add one item to the cart
  Then The post-add-to-cart dialogue box will pop up
  And The right of the dialogue box will say "There is 1 item in your cart."
  And The cart will say "Cart 1 Product"
