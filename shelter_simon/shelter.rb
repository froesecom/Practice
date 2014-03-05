
class Shelter
  attr_accessor :clients, :animals

  def initialize()
    @clients = {}
    @animals = {}
  end
  #this defines a method that can print the animals in the shelter
  def print_animals
    #this looks at each key in the hash, and returns the corresponding value
    @animals.each_value do |animal|
      animal.to_s
    end
  end
#same as above, but for the clients instance variable
  def print_clients
    @clients.each_value do |client|
      client.to_s
    end
  end
#this defines a method with two arguments
  def adopt(person, pet)
    #this creates a variable "animal" that returns the value of the "@animals" hash
    animal = @animals[pet]
    #This line creates a new key, value pair in a hash
    #@clients[person] uses the key [person], to return the values of the @clients hash. 
    #.pets[animal.name]. 
    #.pets returns that attribute from the client object, creates a new key value, pair
    #[animal.name] is the new key. animal is the new value
    #animal.name returns the name attribute from the animal class object
    @clients[person].pets[animal.name] = animal
    #this deletes a key value pair from @animals. pet is the name of the key in the key, value pair
    @animals.delete(pet)
  end
#this defines a give_up method, with two arguments
  def give_up(person, pet)
   #this defines a variable called animal. The variable is equal to @clients[person].pets[pet]
    #@clients[person] returns the value of the key value pairing associated with the person key. THAT VALUE IS A CLASS OBJECT OF CLIENT
    #so...
    #.pets calls the pets attribute out of that class object, and uses the pet key to return the value of pets.
    #so effectively @clients[person].pets[pet] returns the value of of an attributed in the a Client class object, which is an animal object. Fuck.
    #the key value pairing fo that pets hashs is {animal name => animal ojbect} I think
    animal = @clients[person].pets[pet]
    #this creates a new key value pairing in the @animals hash
    #the key is name of pet (name of animal), and the value is an animal object
    @animals[pet] = animal
 #this deletes a key value pairing fron a client class object
 #@clients[person returns] the value of the @clients hash. That value is a client class object
 #.pets calls teh pets attribue from the class ojbect. That attribute is itself a hash.
 #.delete(pet) deletes the key value pairing with the key pet
    @clients[person].pets.delete(pet)
  end
end
