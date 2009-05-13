Given /^the band ([\w\s']+)$/ do |name|
  @band = Band.make(:name => name)
end

Given /^their song ([\w\s']+)$/ do |title|
  @song = Song.make(:name => title)
end
