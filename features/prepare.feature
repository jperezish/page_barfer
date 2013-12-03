
Feature: page_barfer prepare
  As a web designer working for a client with a catalog of products stored in a single file, I want to prepare the catalog products to work with my Jekyll site, so I can have a web page for each one of my products.

  Scenario: Jekyll already installed, site name provided
    Given a directory named "bacon-store"
    And a directory named "_data"
    When "prepare" is run

    Then the command line message should be "Page Barfer is ready for use."
    And the file "_page_barfer.yml" should contain:
      """
      # Page Barfer config
      product_details_layout: #sample_product_details.html
      category_layout: #sample_category.html
      product_file: #sample_products.json
      """