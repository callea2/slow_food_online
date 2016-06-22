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

Then(/^I should see the "([^"]*)"$/) do |id|
  find_by_id(id)
end

When(/^I select "([^"]*)" from "([^"]*)"$/) do |value, field|
  select(value, :from => field)
end


Given(/^the following categories exist$/) do |table|
  table.hashes.each do |category|
    FactoryGirl.create(:restaurant_category, title: category[:title])
  end

end

Given(/^the following restaurants exist$/) do |table|
  table.hashes.each do |restaurant|
    category = RestaurantCategory.find_by(title: restaurant[:category])
    FactoryGirl.create(:restaurant, name: restaurant[:name], restaurant_category: category)
  end
end

Then(/^show me the page$/) do
  save_and_open_page
end

Then(/^I click "([^"]*)"$/) do |value|
  click_link_or_button(value)
end

Then(/^I should be on the "([^"]*)"$/) do |page|
  case page
    when "home page" then
      expect(current_path).to eq root_path
    when "login page" then
      expect(current_path).to eq new_user_session_path
  end
end

Given(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, with: value)
end
