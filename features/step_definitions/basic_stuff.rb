require 'spec/expectations'

Given /^a logged in user$/ do
  
end

Given /^he is at the instrument creation page$/ do
  get('/instruments/new')
end

When /^he fills in '(.*)' with '(.*)'$/ do |field, value|
  fill_in(field, :with => value)
end

When /he enters these values\:/ do |inputs|
  inputs.hashes.first.each do |k, v|
    fill_in(k, :with => v)
  end
end

Then /^there should be an instrument called '(.*)'$/ do |name|
  Instrument.find_by_name(name).should be
end

Given /^no one is logged in$/ do

end

Given /^he is at the login page$/ do
  get('/')
end

When /^he follows '([\w\s]*)'$/ do |link_text|
  click_link link_text # When "I follow #{link_text}"
end

When /^he presses '(.*)'$/ do |button_text|
  click_button button_text
end

Then /^there should be a user called '(.*)'$/ do |login|
  User.find_by_login(login).should be
end
