Given(/^a file named "([^"]*)" with "([^"]*)"$/) do |file_name, file_contents|
  write_file file_name, file_contents
end

When(/^barf is run with "([^"]*)"$/) do |file_path|
    run "page_barfer barf #{file_path}"
end

Then(/^the output should be "(.*?)"$/) do |output|
  assert_passing_with output
end
