
Feature: page_barfer prepare
  As a web designer working for a client with a catalog of products stored in a single file, I want to prepare the catalog products to work with my Jekyll site, so I can have a web page for each one of my products.

  Scenario: Jekyll already installed, site name provided
    Given a directory named "bacon-store"
    And a directory named "_data"
    When "prepare" is run

    Then the command line message should be "Update this file to use Page Barfer."
    And the file "_page_barfer.yml" should contain:
      """
      # Page Barfer config
      layout_for_product_details: sample_product_details.html
      layout_for_categories: sample_category.html
      catalog_file: products.json
      """