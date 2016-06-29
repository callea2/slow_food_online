Given(/^the following users are registered in the system$/) do |table|
  table.hashes.each do |user|
    FactoryGirl.create(:user, username: user[:username], email: user[:email], password: 'password')
  end
end

Given(/^I am signed in$/) do
  steps %Q{
    Given I am on the "login page"
    And I fill in "Email" with "calle@gmail.com"
    And I fill in "Password" with "password"
    And I click "Log in"
    Then I should be on the "home page"
  }
end
