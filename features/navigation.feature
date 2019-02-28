Feature: Adding an item to cart
Scenario:
  Given We navigate to the homepage
  When We log in
  Then The cart will be empty
  When We click on the "Women" tab in the top menu
  And We expand the "Tops" category in the side menu
  And We expand the "Dresses" category in the side menu
  Then The page says there are 7 products
  When We add one item to the cart
  Then The cart will have 1 product
