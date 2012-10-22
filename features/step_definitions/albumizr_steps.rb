Given /^I am on the signup page$/ do
  visit signup_path
end

Given /^I am on the signin page$/ do
  visit signin_path
end

Given /^I am on the album index page$/ do
  visit albums_path
end

Given /^I am on the "(.*?)" album detail page$/ do |title|
  click_link title
  page.should have_content(title)
end

Then /^I should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end

Then /^I should see a success message$/ do
  page.should have_selector('div.alert.alert-success')
end


Then /^I should see the signup form$/ do
  page.should have_content('Create an account for Albumizr')
end

Then /^I should see the signin form$/ do
  page.should have_content('Log in to Albumizr')
end

When /^I submit invalid signin information$/ do
  click_button "Sign in"
end

When /^I click add album$/ do
  click_link "Add album"
end

When /^I delete the album$/ do
  click_link "Delete album"
end

When /^I change the title of the album to "(.*?)"$/ do |title|
  click_link "Edit album"
  fill_in "Title", with: title
  click_button "Save album"
end

When /^I search for the album named "(.*?)"$/ do |title|
  fill_in "search", with: title
  click_button "Find"
end

Then /^I should see an album named "(.*?)" but not "(.*?)"$/ do |title_see, title_notsee|
  page.should have_content(title_see)
  page.should_not have_content(title_notsee)
end

Then /^the album should have the new title "(.*?)"$/ do |title|
  page.should have_content(title)
end

Then /^the album "(.*?)" should not exist anymore$/ do |title|
  page.should_not have_content(title)
end

When /^I create an album by "(.*?)" named "(.*?)" from "(.*?)"$/ do |artist, title, year|
  fill_in "Title",  with: title
  fill_in "Artist", with: artist
  fill_in "Year",   with: year
  click_button "Save album"
end

Then /^I should see an album by "(.*?)" named "(.*?)" from "(.*?)" on my album index page$/ do |artist, title, year|
  page.should have_content(artist)
  page.should have_content(title)
  page.should have_content(year)
end

Given /^I have an album by "(.*?)" named "(.*?)" from "(.*?)"$/ do |artist, title, year|
  visit albums_path
  click_link "Add album"
  fill_in "Title",  with: title
  fill_in "Artist", with: artist
  fill_in "Year",   with: year
  click_button "Save album"
  visit albums_path
end

When /^I submit invalid "(.*?)" and\/or "(.*?)" and "(.*?)"$/ do |username, password, confirmation|
  fill_in "Username", with: username
  fill_in "Password", with: password
  fill_in "Password confirmation", with: confirmation
  click_button "Sign up"
end

When /^I submit valid signup information$/ do
  fill_in "Username", with: "user"
  fill_in "Password", with: "password"
  fill_in "Password confirmation", with: "password"
  click_button "Sign up"
end

When /^I submit valid signin information$/ do
  fill_in "Username", with: "user"
  fill_in "Password", with: "password"
  click_button "Sign in"
end

When /^I signout$/ do
  click_link "Sign out"
end

Then /^I should not be signed in anymore$/ do
  page.should_not have_link('Sign out', href: signout_path)
end

Then /^I should get logged in$/ do
  page.should have_link('Sign out', href: signout_path)
end

Given /^I am a registered user$/ do
  @user = User.create(name: "user", password: "password", password_confirmation: "password")
end

Given /^I am currently logged in$/ do
  @user = User.create(name: "user", password: "password", password_confirmation: "password")
  visit signin_path
  fill_in "Username", with: "user"
  fill_in "Password", with: "password"
  click_button "Sign in"
end

