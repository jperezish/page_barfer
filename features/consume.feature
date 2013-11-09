Feature: page-barfer consume
  As a person with a ton of data stored in a source data file, I want to import this data and make it available to the page barfer to barf out my pages.

  Scenario: consume a json file in the default location
    Given the input "file"

    When the consume feature is run
    Then the output should be "Successfully imported products.json."