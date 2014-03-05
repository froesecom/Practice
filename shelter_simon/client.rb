
#this defines the class
class Client
  #this defines what attributes the string can have
  attr_accessor :name, :children, :age, :pets
  #this is a fucntion that "boots up" each object the class creates
  def initialize(name, children, age)
    @name = name
    @children = children
    @age = age
    @pets = {}
  end

  def to_s
    puts "The client's name is #{@name} and he/she is #{@age} years old."
    puts "He/she has #{@children} children and has #{@pets.size} pet(s)."
  end
end