Given(/^the input "([^"]*)"$/) do |input|
  steps %{
    Given a file named "products.json" with:
    """
    #{input}
    """
  }
end

When(/^the consume feature is run$/) do
  steps %{
    When I run `page_barfer input.txt`
  }
end

Then(/^the output should be "(.*?)"$/) do |output|
  steps %{
    Then it should pass with:
    """
    #{output}
    """
  }
end