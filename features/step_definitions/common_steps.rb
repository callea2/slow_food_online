Given(/^I am on the "([^"]*)"$/) do |page|
  case page
    when "home page" then
      visit root_path
    when "login page" then
      visit new_user_session_path
    when "sign up page" then
      visit new_user_registration_path
    when "Forgot password page" then
      visit new_user_password_path
  end
end

Then(/^I should see "([^"]*)"$/) do |text|
  expect(page).to have_text(text)
end

Then(/^I should see the "([^"]*)" drop list$/) do |id|
  find_by_id(id)
end

When(/^I select "([^"]*)" from "([^"]*)"$/) do |value, field|
  select(value, :from => field)
end
