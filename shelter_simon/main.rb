
require 'pry'

#this requires the class .rb files
require_relative 'shelter'
require_relative 'client'
require_relative 'animal'

#this creates a new Shelter object, called shelter
shelter = Shelter.new

#this defines new animal objects
a1 = Animal.new("Mittens",2,"Female","Cat")
a2 = Animal.new("Rover",7,"Male","Dog")
a3 = Animal.new("Guppy",1,"Female","Fish")

#this creates a new key value pairing in a hash
#It uses the name attribute of the Animal object as the key, and the ojbect itself as the value
#the key value pair is in the animals hash in the shelter object
shelter.animals[a1.name] = a1
shelter.animals[a2.name] = a2
shelter.animals[a3.name] = a3

#this creates a new client object
c1 = Client.new("Simon",0,29)
c2 = Client.new("Nix",0,24)

#this creates a new key value pairing in the .clients attribute of the shelter object. The clients attribute is a hash.
#the key is the name attribute of the client class object, and the value is the class object
shelter.clients[c1.name] = c1
shelter.clients[c2.name] = c2

#this calls the adopt method that simon defined in the shelter class. It does two things:
#1 it adds a key value pairing to the to the pets attribute (a hash) of the client ojbect returned by the "Nix" key.
#2 it removes a key value pairing from the @clients attribute (a hash) of the shelter class object.
shelter.adopt("Nix","Rover")



loop do

 
  puts "1. Create an animal"
  puts "2. Create a client"
  puts "3. Print animals"
  puts "4. Print clients"
  puts "5. Adopt animal"
  puts "6. Give up animal"
  puts "7. Quit"
  puts "---------------------------------"
  puts "Please input a number corresponding to the option you desire."

 
  input = gets.chomp.to_i

  puts "---------------------------------"

  case input

 
  when 1
    puts "Please input the animal's name"
    name = gets.chomp
    puts "Please input the animal's age"
    age = gets.to_i

    puts "Please input the animal's gender (male/female)"
    gender = gets.chomp.downcase

    puts "Please input the animal's species"
    species = gets.chomp

    puts "Does this animal have any toys (y/n?)"
    toys_yn = gets.chomp.downcase
    #this creates an animal ojbect using user input
    animal = Animal.new(name, age, gender, species)

   
    if toys_yn == 'y'
      #this creates a loop to get  the names of toys
      loop do
        puts "Please enter the name of the toy (leave blank and press enter to exit)"
        toy = gets.chomp
        #this says "if the user input is equal to nothing, break the loop"
        if toy == ""
          break
        #this pushes the toy string into the the toys attribute (an array) of the animal object
        else
          animal.toys.push toy
        end
      end
    end
#this calls the animal attribute of the shelter ojbect, which must be a hash. It then creates a new key value pairing using the name (from user input)
#and the animal object (created by user input)
    shelter.animals[name] = animal

  
  when 2
    puts "Please input your name"
    name = gets.chomp
    puts "Please input the number of children you have"
    children = gets.chomp
    puts "Please input your age"
    age = gets.to_i
    #this creates a new client object using user input
    client = Client.new(name, children, age)
    #this creates a new key value pairing in the clients attribute of the shelter object (a hash). The key is the name (from user input)
    #and the client object (created from user input)
    shelter.clients[name] = client

 
  when 3
      #this applies the .print_animals method to the shelter ojbect
      #.print_animals cycles through the values of the @animals hash and prints the values
      shelter.print_animals


  when 4
      #similar to above
      shelter.print_clients


  when 5
    puts "Please input your name"
    name = gets.chomp
    puts "Please input the animal's name"
    animal = gets.chomp

    #calls the .adopt method and passes in user input. The method does two things:
    #deletes a key value pair from the @animal hash
    #creates a key value pair in the @pets attribute of the client object
    #effectively, it's trying to move the pet from the shelter to the client
    shelter.adopt(name, animal)

  
  when 6
    puts "Please input your name"
    name = gets.chomp
    puts "Please input the animal's name"
    animal = gets.chomp
#calls the .give_up method and passes in user input. The method does two things
#creates a key value pair in the @animals hash
#deletes a key value pair in the pets attribute of the client object
#effectively, it's trying to move the pet from the client to the shelter
    shelter.give_up(name, animal)

  
  when 7
    puts "Exiting program..."
    break

  else
    puts "Please input a valid option!"
  end

  puts "---------------------------------"

end