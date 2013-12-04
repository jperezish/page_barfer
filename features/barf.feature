
Feature: page_barfer barf
  As a person with a ton of data stored in a single data file, I want to transform this data into Jekyll partials using a layout I choose.

  Background:
    Given a file named "products.json" with:
    """
    [
    {
      "sku": "1234567890",
      "name": "Baby Bubba's Butcher Block Hickory Smoked Peppered Bacon",
      "description": "This bacon has a bold flavor profile, and the pepper gives it the kick you'll love. It brings out the 'Bubba' in everyone! 14 ounces per package.",
      "hierarchy": ["bacon supplies", "savory", "bubba"]
    },
    {
      "sku": "1332328976",
      "name": "Vosges Dark Chocolate Bacon Bar",
      "description": "Mo's Dark Bacon Bar: applewood smoked bacon + Alder wood smoked salt + dark chocolate 62% cacao 3oz.",
      "hierarchy": ["bacon supplies", "Sweet!", "chocolate", "vosges"]
    }
    ]
    """
    And a file named "_page_barfer.yml" with:

    """
    # Page Barfer config
    layout_for_product_details: sample_product_details.html
    layout_for_categories: sample_category.html
    catalog_file: products.json
    """

  Scenario: Barf with a json file only

    When "barf" is run

    Then the command line message should be "Successfully imported products.json."
    And a file named "bacon-supplies/savory/bubba/index.html" should exist
    And a file named "bacon-supplies/sweet/chocolate/vosges/index.html" should exist

