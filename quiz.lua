-- global vars

questionone = 2 -- oi mate are you just looking in the code to CHEAT??!?!?!?!?!!!
questiontwo = 3
questionthree = 1
finalscore = 0

-- functions

function questionOne()
	print("This is the first question, it should be pretty simple.")
	print("What language was this quiz coded in? Type 1 for Python, type 2 for Lua, and type 3 for Haskell.")
	local guessone = io.read("*number")
	if guessone==questionone then
		print("Nice one, you got it right.")
		finalscore = finalscore + 1
	elseif guessone~=questionone then
		print("Too bad, you didn't get it right. Maybe next time?")
	end
end

function questionTwo()
	print("Now, on to the second question.")
	print("Is Lua statically typed, typed, or dynamically typed? Type 1 for statically, type 2 for typed and type 3 for dynamically.")
	local guesstwo = io.read("*number")
	if guesstwo==questiontwo then
		print("Excellent, you got the second question correct. You're pretty good at this.")
		finalscore = finalscore + 1
	elseif guesstwo~=questiontwo then
		print("Unfortunate, you didn't get it right. Lua is dynamically typed.")
	end
end

function questionThree()
	print("Finally, the third and last question. You'll absolutely get this one wrong, unless you get it right.")
	print("Is Lua normally interpreted, or compiled? Type 1 for interpreted, or type 2 for compiled.")
	local guessthree = io.read("*number")
	if guessthree==questionthree then
		print("You got the last question right. Are you a Lua programmer yourself?")
		finalscore = finalscore + 1
		print("Your final score is", finalscore, "out of 3.")
		if finalscore==3 then
			print("You got every question right!")
		end
	elseif guessthree~=questionthree then
		print("See what did I tell you. You'd absolutely get that one wrong unless you got it right. Try the quiz again sometime!")
		print("Your final score is", finalscore, "out of 3.")	
	end
end

		
-- main program

print("Welcome to the quiz...")
print("Easy for some, impossible for others...")
print("Are you ready...?")
questionOne() -- calls the function questionOne() in order to ask the first question
questionTwo() -- ditto
questionThree() -- extra ditto
