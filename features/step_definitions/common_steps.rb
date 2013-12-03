Given(/^a file named "([^"]*)" with "([^"]*)"$/) do |file_name, file_contents|
  write_file file_name, file_contents
end

When(/^"([^"]*)" is run$/) do |command|
    run "page_barfer #{command}"
end

Then(/^the command line message should be "(.*?)"$/) do |message|
  assert_passing_with message
end


