system ("cls")
arr = []
guessed = []
lives = 8
def progress(word) 
	print "Your progress is: #{word.each_char {|c| c + " "}}\n"
end
def update(word,letter,secret)
		i=0
		secret.each_char{ |c|
		if c == letter
			word[i] = secret[i]
		end
		i+=1
		}
	return word
end

puts "Player 1 is the Hanged Man and player 2 is the Executioner"
puts "Executioner: How many words would you like to use?"
x = gets.chomp # The number inputted is looped until Executioner enters as many words as the int xik8
x.to_i.times {
	print "@Executioner - Enter word #{arr.size+1} (maximum 10 letter) __________\b\b\b\b\b\b\b\b\b\b"
   	arr << gets.upcase!.chomp  # entered word is inserted into the array
}
secret = arr.sample #pulls random word from arr

temp = secret.gsub(/[a-zA-Z]/,'_')
while (temp != secret && lives > 0)
	system ("cls")
	puts "Executioner: Your last turn, Hanged Man" if lives==1
	if guessed.size != 0
 		progress(temp)
 		puts "Try again! Lives left - #{lives}" 
		puts "Hanged Man: Guessed letters - #{guessed.join(", ")}"
	end 
	print "Executioner: Give me a letter, dead man. _\b"
	letter = gets.chomp
	letter.upcase!
	until letter.size==1
		puts "You cheat! That's -2 lives! Enjoy your #{lives-2<0 ? 0 : lives-2} lives"
		lives-=2
		break if lives<1
		print "Executioner: Give me a letter, dead man. _\b"
		letter = gets.chomp
		letter.upcase!
	end
	guessed << letter unless guessed.include? letter 
	#guessed hold guessed letters. if it arleady has letter we just told it won't add it.
	if ((secret.include? letter) && lives>0 && letter.size==1)
			puts "Executioner: You win this round."
			temp = update(temp,letter,secret)
	elsif lives > 1 
		puts "Executioner: Wrong! Try again."
		lives-=1
	else
		puts "You died. Game over."
		sleep 5
		break
	end
	print "Next round in: "
	(1..3).each { |x| 
		print "#{x}... "
		sleep 1 
	}
end
system("cls")
if secret==temp
	puts "Executioner: How did you guess it was #{secret}?!"
	puts "*Executioner dies of a heart attack*"
	puts "Hanged Man lives!"
end
sleep 5