
-- functions

function randomise()
	botchoice = math.random(1,3)
end

-- main program

print("Rock paper scissors!")
print("Type 1 for rock, 2 for paper and 3 for scissors!")
local playerchoice = io.read("*number")
if playerchoice == 1 then
	randomise()
	if botchoice == 3 then
		print("You win!")
	elseif botchoice == 2 then
		print("You lost!")
	elseif botchoice == 1 then
		print("It's a draw!")
	end
elseif playerchoice == 2 then
	randomise()
	if botchoice == 1 then
		print("You win!")
	elseif botchoice == 3 then
		print("You lost!")
	elseif botchoice == 2 then
		print("It's a draw!")
	end
elseif playerchoice == 3 then
	randomise()
	if botchoice == 2 then
		print("You win!")
	elseif botchoice == 1 then
		print("You lost!")
	elseif botchoice == 3 then
		print("It's a draw!")
	end
end

