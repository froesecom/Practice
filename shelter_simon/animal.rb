#creates a new class of animal
class Animal
  #defines what attributes this class can have. Allows you to both get (attr_read) and set (attr_write) things to the instance variables
  attr_accessor :name, :age, :gender, :species, :toys
  #a function that "boots up" each oject the class creates
  def initialize(name, age, gender, species)
    #these are instance variables. They are attached to this class
    @name = name
    @age = age
    @gender = gender.downcase
    @species = species
    @toys = []
  end
#this is a method that overrides the .to_s to print the stuff below when .to_s is called automatically
  def to_s
    @gender == 'male' ? @he_she = 'he' : @he_she = 'she'

    puts "The pet's name is #{@name} and #{@he_she} is #{@age} years old."
    puts "This animal has #{@toys.size} toy(s)."
  end
end