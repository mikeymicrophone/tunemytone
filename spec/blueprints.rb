Sham.name { Faker::Name.name }

User.blueprint do
  login { Faker::Name.name }
  email { Faker::Internet.email }
  password { 'toppsecret' }
  password_confirmation { 'toppsecret' }
end

Configuration.blueprint do
  name { |n| "nasty #{n}x#{n}" }
end

Venue.blueprint do
  name { |n| "rock #{n}x#{n}00" }
end

Excerpt.blueprint do
  
end

Artist.blueprint do
  
end

Knob.blueprint do

end

Input.blueprint do
  
end

Output.blueprint do
  
end

Song.blueprint do
  
end

Brand.blueprint do
  
end

Show.blueprint do
  
end