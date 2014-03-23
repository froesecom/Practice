
 
loop do
  numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  numbers.shuffle!
  puts "What is #{numbers[0]} + #{numbers[1]}?"
  answer = gets.chomp.to_i
    
  if answer == numbers[0] + numbers[1]
    puts "You got it right!"
    puts "-----------------------------------"
  elsif answer == 0
    puts "Do you want to quit? (y or n)"
      quit = gets.chomp
    break if quit == "y".downcase
  else
    puts "You got it wrong. Try again."
    puts ""
    puts "What is #{numbers[0]} + #{numbers[1]}?"
      answer2 = gets.chomp.to_i
      if answer2 == numbers[0] + numbers[1]
        puts "You got it right!"
      until answer2 == numbers[0] + numbers[1]
      end
    end
   end
  end

