@announce

Feature: page_barfer barf
  As a person with a ton of data stored in a single data file, I want to transform this data into Jekyll partials using a layout I choose.

  Background:
    Given a file named "products.json" with:
    """
    [
    {
      "product_number": "1234567890",
      "product_name": "Baby Bubba's Butcher Block Hickory Smoked Peppered Bacon",
      "product_description": "This bacon has a bold flavor profile, and the pepper gives it the kick you'll love. It brings out the "Bubba" in everyone! 14 ounces per package.",
      "category_one": "The Bacon"
    },
    {
      "product_number": "1332328976",
      "product_name": "Vosges Dark Chocolate Bacon Bar",
      "product_description": "Mo's Dark Bacon Bar: applewood smoked bacon + Alder wood smoked salt + dark chocolate 62% cacao 3oz.",
      "category_one": "Bacon Sweets & Snacks",
      "category_two": "Bacon Chocolate"
    }
    ]
    """

  Scenario: Barf with a json file only
    When barf is run with "products.json"

    Then the output should be "Successfully imported products.json."

  Scenario: Barf a json file when prompted
    When I run `page_barfer barf` interactively
    And I type "products.json"

    Then the command line message should be "Successfully imported products.json."