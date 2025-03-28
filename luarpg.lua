-- global vars

health = 10
attack = 1 -- how much damage your basic attack does. function attackUp() increases this value by one
spell = 4 -- how much damage your spell does, similarly increased by the function spellUp()
-- enemy stats are in their own blocks as local vars. i probably should be using object oriented programming so i can have greater variety but tough noogies

-- functions

function attackUp()
  attack = attack + 1 -- increases the global variable Attack by one, making standard attack do one more damage.
end

function spellUp()
  spell = spell + 1 -- ditto, but with spell damage.
end

function Goblin2()
  print("You encounter a foe... It's a level 2 goblin!")
  local enemyhealth = 6
  local enemyattack = 3
  print("What will you do?")
  print("TYPE 1 FOR BASIC ATTACK, TYPE 2 TO USE SPELL, OR TYPE 3 TO ATTEMPT TO EVADE.")
  while health > 0 do
    local number = io.read("*number")
    if number == 1 then
      print("You swing your sword at the enemy with all your might. It dealt", attack, "damage.")
      enemyhealth = enemyhealth - attack
      print("The goblin retaliates, dealing", enemyattack, "damage.")
      health = health - enemyattack
      print("You are now at", health, "health.")
      print("The enemy is now at", enemyhealth, "health.")
      if enemyhealth <= 0 then
        print("You defeated the enemy!")
        print("You levelled up, gaining +Attack. You fully recover!")
        attackUp()
        health = 10
        break
      end
      if health <= 0 then
        while health <= 0 do
          print("You died!")
        end
      end
    elseif number == 2 then
      print("You cast a spell, sending a wave of embers towards the enemy. It dealt", spell, "damage.")
      enemyhealth = enemyhealth - spell
      print("However, casting the spell allowed the goblin to retaliate, dealing", enemyattack + 1, "damage.")
      health = health - enemyattack + 1
      print("You are now at", health, "health.")
      print("The enemy is now at", enemyhealth, "health.")
      if enemyhealth <= 0 then
        print("You defeated the enemy!")
        print("You levelled up, gaining +Attack. You fully recover!")
        attackUp()
        health = 10
        break
      end
      if health <= 0 then
        while health <= 0 do
          print("You died!") -- this is a really ugly way to force-end the game upon death however i dont know any other way to do it.. Too bad!
        end
      end
    elseif number == 3 then -- YES IT WORKS NOW
      print("You attempt to run... but fell down! You took 5 damage!")
      print("You are now at", health, "health.")
      health = health - 5
      if health <= 0 then
        while health <= 0 do
          print("You died!")
        end
      end
    end
  end 
end -- the end is never the end is never the end is never the end is never the end is never the end is never the end is never the end is never the end is never

function Skeleton5()
  print("You encounter a foe... it's a level 5 Skeleton!")
  print("Be careful... this enemy is more well armed! A rusted sword is at their standby.")
  local enemyhealth = 12
  local enemyattack = 4
  print("What will you do?")
  print("TYPE 1 FOR BASIC ATTACK, TYPE 2 TO USE SPELL OR TYPE 3 TO ATTEMPT TO EVADE.")
  while health > 0 do
    local number = io.read("*number")
    if number == 1 then
      print("You flourish your blade, cleanly hitting the skeleton. It dealt", attack, "damage!")
      enemyhealth = enemyhealth - attack
      print("The skeleton grabs their sword and responds, dealing", enemyattack, "damage.")
      health = health - enemyattack
      print("You are now at", health, "health.")
      print("The enemy is now at", enemyhealth, "health.")
      if enemyhealth <= 0 then
        print("You defeated the enemy! Magical energy resonates from their remains. You level up, gaining +Spell and are fully restored!")
        spellUp()
        health = 10
        break
      end
      if health <= 0 then
        while health <= 0 do
          print("You died!")
        end
      end
    elseif number == 2 then
      print("You cast a simple fire spell. It dealt", spell, "damage!")
      enemyhealth = enemyhealth - spell
      print("The skeleton retaliates sharply, dealing", enemyattack, "damage.")
      health = health - enemyattack
      print("You are now at", health, "health.")
      print("The enemy is now at", enemyhealth, "health.")
      if enemyhealth <= 0 then
        print("You defeated the enemy! Magical energy resonates from their remains. You level up, gaining +Spell and are fully restored!")
        spellUp()
        health = 10
        break
      end
      if health <= 0 then
        while health <= 0 do
          print("You died!")
        end
      end
    elseif number == 3 then
      print("You attempt to run away... but fell down! You took 6 damage!")
      health = health - 6
      print("You are now at", health "health.")
      if health <= 0 then
        while health <= 0 do
          print("You died!")
        end
      end
    end
  end
end
          
    

-- main program

print("Welcome to LuaRPG, a simple text based game that I will likely never finish. Coded in Lua, using replit (i will move to vim sooner or later).")
print("")
print("You are deep within a vast dungeon. Your sword stands by your side and your fire magic is at the ready. You continue onwards.")
print("")
Goblin2() -- starts an encounter
print("")
print("You are left mostly unfazed by the common encounter, so you continue going forwards.")
print("The path seems to fork into two different ways... Forward and left.")
print("TYPE 1 TO GO FORWARD, TYPE 2 TO GO LEFT.")
local action = io.read("*number")
if action == 1 then
  print("You opt to advance forwards.")
  print("Your path closes with a chest. Inside is an orb of magical energy. +Spell! You turn back and take the left path.")
  print("There is little to see, however your path is soon cut off by a pair of enemies!")
  spellUp()
elseif action == 2 then
  print("You opt to turn left. There is little to see.")
  print("However, your path is soon cut off by a pair of enemies!")
end
Skeleton5()
Goblin2()
print("You have completed all that there is to see for now! Check back some time for more...")
        
      
      
