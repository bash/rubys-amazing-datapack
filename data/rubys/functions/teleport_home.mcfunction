# A player can be in one of the following states:
# Initial = 0
# Teleporting = 1
# Complete = 2

# Brings players that hold a token into the teleporting state
scoreboard players set @a[scores={tp_home_state=0},nbt={SelectedItem:{id:"minecraft:emerald",tag:{display:{Name:'{"text":"Get Home Token"}'}}}}] tp_home_state 1

# Start teleportation sound
execute as @a[scores={tp_home_state=1, tp_home_counter=0}] at @s run playsound minecraft:block.portal.trigger ambient @s

# Spawn particles around player
execute as @a[scores={tp_home_state=1}] at @s run particle minecraft:portal ~ ~1 ~
execute as @a[scores={tp_home_state=1}] at @s run particle minecraft:portal ~ ~1 ~0.5
execute as @a[scores={tp_home_state=1}] at @s run particle minecraft:portal ~0.5 ~1 ~
execute as @a[scores={tp_home_state=1}] at @s run particle minecraft:portal ~ ~1 ~-0.5
execute as @a[scores={tp_home_state=1}] at @s run particle minecraft:portal ~-0.5 ~1 ~

# Increment counter
scoreboard players add @a[scores={tp_home_state=1}] tp_home_counter 1

# Teleport when enough time has passed
teleport @a[scores={tp_home_state=1,tp_home_counter=80..}] @e[type=minecraft:armor_stand,nbt={CustomName: "{\"text\":\"Home Marker\"}"},limit=1,sort=nearest]
scoreboard players set @a[scores={tp_home_state=1,tp_home_counter=80..}] tp_home_state 2

# Reset counter
scoreboard players set @a[scores={tp_home_counter=80..}] tp_home_counter 0

# Cancels teleportation when player switches away from token
# also brings teleported players back into the initial state.
execute as @a[scores={tp_home_state=1..}] unless entity @s[nbt={SelectedItem:{id:"minecraft:emerald",tag:{display:{Name:'{"text":"Get Home Token"}'}}}}] run scoreboard players set @s tp_home_counter 0
execute as @a[scores={tp_home_state=1..}] unless entity @s[nbt={SelectedItem:{id:"minecraft:emerald",tag:{display:{Name:'{"text":"Get Home Token"}'}}}}] run scoreboard players set @s tp_home_state 0

# Stop teleportation sound
execute as @a[scores={tp_home_state=0}] at @s run stopsound @s ambient minecraft:block.portal.trigger
