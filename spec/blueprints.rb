require File.expand_path(File.dirname(__FILE__) + '/markov_chain')
def chain_from_files_in_directory dir
  text = ''
  Dir.open(dir).entries.reject { |e| ['.', '..'].include? e }.each do |filename|
    File.open(dir + '/' + filename) do |f|
      text << f.read
    end
  end
  MarkovChain.new(text)
end

word_bank = chain_from_files_in_directory '../../downloads/gutenberg'
Sham.name { Faker::Name.name }
Sham.band_name { word_bank.words(rand(5)) }

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

Band.blueprint do
  name { bandname }
end