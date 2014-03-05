
require "pry"
pubs = {
  "Edinburgh Castle" => {"Location" => "Brunswick"},
  "The London" => {"Location" => "Richmond"},
  "Hey Said, She Said" => {"Location" => "Camberwell"},
  "Riverside" => {"Location" => "CBD"}
}

#adds a pub to the hash
pubs["Lomond Hotel"] = {"Location" => "East Brunswick"}

#.keys looks up keys from hashes
pubs.keys

#returns the values for the key it called
pubs["Lomond Hotel"]

#returns the keys inside the "Lomond Hotel" value hash
pubs["Lomond Hotel"].keys

#returns the values for "Lomond Hotel"(which includes a hash) and the returns the values for the second (inner) hash
pubs["Lomond Hotel"]["Location"]

#How do I had values to a hash?
pubs["Lomond Hotel"]["Music"] = "Blues"

puts "Now I'm going to show you the locations of all the pubs."
pubs.each do |name, hash|
  hash.each do |key, location|
    puts "#{name}: #{location}. "
  end
end



#hash1[key_hash1][newkey_hash2] = value_hash2


