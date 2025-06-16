--
-- This program was written in a UNIX system (freebsd specifically), with UNIX in mind. Linux should be able to run this fine, but the Winbros will probably have to fire
-- up WSL. Sorry!
--

--
-- Global Vars
--

playerhp = 20 -- starting health for the player
bananas = 0 -- starting bananas. get 500 bananas, win the game

charm = 5 -- one of three base stats. helps you get bananas through words.
wit = 5 -- second of three base stats. helps navigate dungeons
strength = 2 -- third of three base stats. increases attack damage in battle

charmxp = 0 -- doing things that train charm increase this.
witxp = 0 -- ditto but with wit
strengthxp = 0 -- ditto ditto but with strength

charmreq = 20 -- how much charm xp is needed to increase charm
witreq = 20 -- ditto but with wit
strengthreq = 20 -- ditto ditto but with strength

location = "NANATOPIA" -- this is the default / starting location. defined here as it'll probably be referenced by a lot of stuff

dungeonkeepcharmclaimed = false -- checks if the charm from talking with the dungeonkeep has been claimed

-- any future globals that need to be defined will be as they become necessary.

--
-- Funcs
--

function charmup()
	print("Your charm increased!")
	charm = charm + 1 -- foo euals foo plus one
	print("You are now at", charm, "charm.")
end

function witup()
	print("Your wit increased!")
	wit = wit + 1
	print("You are now at", wit, "wit.")
end

function strengthup()
	print("Your strength increased!")
	strength = strength + 1
	print("You are now at", strength, "strength.")
end

function charmxpup(a)
	print("You feel as if you are becoming more eloquent...")
	print("")
	charmxp = charmxp + a
	checkcharm()
end

function witxpup(a)
	print("You feel as if you are becoming sharper...")
	print("")
	witxp = witxp + a
	checkwit()
end

function strengthxpup(a)
	print("You feel as if you are becoming stronger...")
	print("")
	strengthxp = strengthxp + a
	checkstrength()
end

function dialoguepause(a)
	local sec = tonumber(os.clock() + a);
	while (os.clock() < sec) do -- This is much better. Also platform agnostic!
	end
end

function readlocation()
	print("You are currently in ", location, ".")
	if location == "NANATOPIA" then 
		nanatopia()
	elseif location == "NANADUNGEON" then
		dungeon()
	elseif location == "NANASTUDY" then
		study() -- TODO; this has not been made yet
	elseif location == "BULLETIN" then
		location = "NANATOPIA"
		clear()
		print("There are no new updates.")
		dialoguepause(3)
		clear()
		readlocation()
	elseif location == "NANADUNGEON FLOOR 1" then
		dungeonfloor1()
	end
end

function nanatopia()
	print("")
	print("Where do you want to go?")
	print("")
	print("1. Nanatopian Dungeon")
	print("2. Weapons Shop")
	print("3. Nanatopian Study")
	print("4. Bulletin Board")
	print("")
	local go = io.read("*number")
	if go == 1 then
		clear()
		location = "NANADUNGEON"
		readlocation() -- calling a function in the same function feels illegal but it works
	elseif go == 2 then
		clear()
		location = "WEAPONSHOP"
		readlocation()
	elseif go == 3 then
		clear()
		location = "NANASTUDY"
		readlocation()
	elseif go == 4 then
		clear()	
		location = "BULLETIN"
		readlocation()
	else do
		print("Not a location.")		
		dialoguepause(1)
		clear()
		readlocation()
	end
end
end


function dungeon()
	print("")
	print("Where would you like to go?")
	print("")
	print("1. Enter the dungeon")
	print("2. Consult with the dungeon keeper")
	print("3. Leave the dungeon")
	print("")
	local go = io.read("*number")
	if go == 1 then
		location = "NANADUNGEON FLOOR 1"
		clear()
		readlocation()
	elseif go == 2 then
		clear()
		print("")
		print("You approach the dungeon keeper. They acknowledge your presence, waiting for your question.")
		print("")
		print("1. Can you tell me about the dungeon?")
		print("2. Small talk?")
		print("3. Spare some bananas? (10 Charm)")
		print("")
		local go = io.read("*number")
		if go == 1 then
			clear()
			print("The dungeon keep nods, preparing a tutorial.")
			dialoguepause(1)
			print("")
			print("Navigating dungeons is quite simple. You will typically be met with several different paths, which have a chance of leading you to bananas.")
			dialoguepause(4)
			print("However, you'll usually have to go quite deep to find anything. Lower floors have larger troves. Be warned though, as you may also encounter enemies!")
			dialoguepause(4)
			print("In such encounters, having a high strength stat will be helpful.")
			dialoguepause(2)
			print("It would, though, be advisable to avoid such conflict. Being witty can help with this, as you could spot shortcuts or escape routes more easily.")
			dialoguepause(4)
			print("Good luck!")
			dialoguepause(1)
			print("")
			clear()
			readlocation()
		elseif go == 2 then
			clear()
			print("The dungeon keep looks you up and down.")
			print("")
			print("Small talk? I suppose I could kill some time.. why don't I tell you about the banana bread I got from the tavern not long ago?")
			dialoguepause(2)
			if dungeonkeepcharmclaimed == false then
				dungeonkeepcharmclaimed = true -- makes sure that the charm from this interaction can only be claimed once
				charmxpup(5)
				dialoguepause(2)
				clear()
				readlocation()
			else do
				clear()
				readlocation()
			end
		end
		elseif go == 3 then
			print("")
			if charm >= 10 then
				clear()
				print("Okay, I suppose I have some to spare.")
				bananas = bananas + 15
				dialoguepause(2)
				clear()
				readlocation()
			else do
				clear()
				print("Sorry, I don't have any for you.")
				dialoguepause(2)
				clear()
				readlocation()
			end
			end
		else do
			print("Not a location.")
			dialoguepause(1)
			dungeon()
		end
	end
	elseif go == 3 then
		location = "NANATOPIA"
		clear()
		readlocation()
		end
end

function dungeonfloor1()
	print("")
	print("Where do you want to go?")
	print("")
	print("1. Go forward")
	print("2. Go back")
	local go = io.read("*number")
	if go == 1 then
		-- TODO
	elseif go == 2 then
		print("")
		print("You decide to go back, heading towards the exit.")
		dialoguepause(1)
		location = "NANADUNGEON"
		clear()
		readlocation()
	else do
		print("Not a location.")
		dungeonfloor1()
	end
end
end

function clear()
	os.execute(package.config:sub(1,1) == "\\" and "cls" or "clear") -- this is platform agnostic, theres probably still some unix specific stuff in the rest of program thou
end

function test()
	print("If you see this, the code worked.")
end

function endgame()
	os.exit() -- now platform agnostic!
end

function checkcharm()
	if charmxp >= charmreq then
		charmup()
		charmreq = charmreq + 1
	end
end

function checkwit()
	if witxp >= witreq then
		witup()
		witreq = witreq + 1
	end
end

function checkstrength()
	if strengthxp >= strengthreq then
		strengthup()
		strengthreq = strengthreq + 1
	end
end

--
-- Main
--

clear()
print("") -- there is probably a better way to print a blank line but too bad
print("") 
print("Welcome to MONKEY QUEST! A legendary adventure to become one with the Banana.")
dialoguepause(1)
print("")
print("You are but an average monkey in Nanatopia. What is your name..?")
print("")
name = io.read()
print("")
print("Your name is", name, "? Very well.. let me give you a tutorial.")
print("")
print("These are your base stats...")
dialoguepause(1)
print("")
print("Charm: ", charm)
dialoguepause(1)
print("Wit: ", wit)
dialoguepause(1)
print("Strength: ", strength)
print("")
dialoguepause(1)
print("Let me give you a rundown on what these stats mean.")
dialoguepause(1)
print("")
print("Charm is representative of your way around words. Get a high amount of Charm and you'll have an easier time convincing people to help you find Bananas.")
print("Wit is your own inner wisdom. It will help you navigate dungeons more easily, which can contain troves full of Bananas.")
print("Strength is your physicality. It'll mainly be useful in battle against vicious foes who are after your Bananas.")
dialoguepause(5)
print("")
print("Obviously, these stats can be trained, and it is very important to do so. Talking to NPCs helps to train your Charm, study boosts your Wit, and head-on combat tests your Strength.")
dialoguepause(2)
print("")
print("This is about all I know. Explore Nanatopia, delve through dungeons and gather Bananas to grow stronger, and become One with the Banana. Good luck!")
print("")
print("")
print("")
print("")
print("")
dialoguepause(4)
clear()

--
-- END OF TUTORIAL / INTRO
--

readlocation() -- this makes up like 90% of the gameplay

