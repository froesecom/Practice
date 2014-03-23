require "pry"

loop do
  puts "Say something to grandma."
  answer = gets.chomp
  dates = (1900..2000).to_a
  if answer != answer.upcase
    puts "HUH?! SPEAK UP SONNY!"
  elsif answer == "BYE"
    break
  else
    dates.shuffle!
    puts "NO, NOT SINCE #{dates[0]}!"
  end
end

#another solution
class Grandma
  @@counter = 0

  def self. grandma_response(placeholder)
    if placeholder == "BYE"
      @@counter += 1
    elsif placeholder == placeholder.upcase
      @@counter = 0
      puts "Na not since 19#{rand(30..50)}"
    else
      @@counter = 0
      puts "Speak up sonny!"
  end

  def self.speak_to_grandma
    while @@counter < 3
      puts "Speak to grandma:"
      input = gets.chomp
      self.grandma_response(input)

  end
end

Grandma.speak_to_grandma