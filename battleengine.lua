-- global vars

-- all are set in the program... they are playerhp, baseatk, spellatk, enemyhp and enemyatk if you're curious.

-- functions

function encounter()
	print("You encounter an artifical construct. It wants to fight!")
	print("It appears to have", enemyhp, "health!")
	print("What will you do?!")
	print("TYPE 1 TO USE BASIC ATTACK OR 2 TO USE YOUR SECONDARY / MAGICAL ATTACK.")
	while playerhp > 0 do
		action = io.read("*number")
		if action == 1 then
			print("You swing your sword with all your might. It dealt", baseatk, "damage!")
			enemyhp = enemyhp - baseatk
			print("The enemy retaliates, dealing", enemyatk, "damage.")
			playerhp = playerhp - enemyatk
			print("You are now at", playerhp, "health.")
			print("The enemy is now at", enemyhp, "health.")
		if enemyhp <= 0 then
			print("You defeated the enemy!")
			break
		end
		if playerhp <= 0 then
			print("You died! You can keep going if you want to, but that's cheating! Though, this is just mostly for testing so I doubt that matters all too much.")
			break
		end
	elseif action == 2 then
		print("You cast a basic spell at the enemy, sending some magical energy towards them. It deals", spellatk, "damage!")
		enemyhp = enemyhp - spellatk
		print("The enemy returns with a stronger attack, dealing", enemyspellatk, "damage!")
		playerhp = playerhp - enemyspellatk
		print("You are now at", playerhp, "health!")
		print("The enemy is now at", enemyhp, "health.")
		if enemyhp <= 0 then
			print("You defeated the enemy!")
			break
		end
		if playerhp <= 0 then
			print("You died! You can keep going if you want to, but that's cheating! Though, this is just mostly for testing so I doubt that matters all too much.")
			break
		end
	end
end
end

-- main program

print("Welcome to the Lua Text Battle Engine! This is a simple test for basic text-based combat, good for RPGs in your terminal.")
print("First, what are the stats of you, the player?")
print("How much health do you have? Type a number.")
playerhp = io.read("*number") -- i would have liked to use local vars here however my understanding of them tells me that they wouldn't work when the time comes to actually call the function for an encounter
print("How much damage does your Basic Attack do? Type a number.")
baseatk = io.read("*number")
print("Now, how much damage does your Secondary / Magical attack do? Type a number, probably higher than your base attack. Using this attack will result in a stronger retaliation from the enemy!") -- this recommendation is because using spell causes you to suffer more damage in return than if you used basic atk
spellatk = io.read("*number")
print("Now that you have selected your stats, now we can set up the enemy you'll face off against.")
print("Similar process as with your own stats. How much health do they have? Type a number.")
enemyhp = io.read("*number")
print("How much damage do they do when attacking? Type one last number...")
enemyatk = io.read("*number")
enemyspellatk = enemyatk + 1
print("That's all of the variables set! Let's start the encounter!")
encounter()
