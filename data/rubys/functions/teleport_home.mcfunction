# Mark players holding an emerald
scoreboard players add @a[scores={tp_home_delay=0},nbt={SelectedItem:{id:"minecraft:emerald",tag:{display:{Name:'{"text":"Get Home Token"}'}}}}] tp_home_marker 1

# Cancel teleportation for players that switch away from entity
execute as @a[scores={tp_home_marker=1..}] unless entity @s[nbt={SelectedItem:{id:"minecraft:emerald",tag:{display:{Name:'{"text":"Get Home Token"}'}}}}] run scoreboard players set @s tp_home_marker 0

# Start teleportation sound
execute as @a[scores={tp_home_marker=1}] at @s run playsound minecraft:block.portal.trigger ambient @s

# Spawn particles
execute as @a[scores={tp_home_marker=1..}] at @s run particle minecraft:portal ~ ~1 ~
execute as @a[scores={tp_home_marker=1..}] at @s run particle minecraft:portal ~ ~1 ~0.5
execute as @a[scores={tp_home_marker=1..}] at @s run particle minecraft:portal ~0.5 ~1 ~
execute as @a[scores={tp_home_marker=1..}] at @s run particle minecraft:portal ~ ~1 ~-0.5
execute as @a[scores={tp_home_marker=1..}] at @s run particle minecraft:portal ~-0.5 ~1 ~

# Stop teleportation sound
execute as @a[scores={tp_home_marker=0}] at @s run stopsound @s ambient minecraft:block.portal.trigger

# Teleport when enough time has passed
teleport @a[scores={tp_home_marker=80..}] @e[type=minecraft:armor_stand,nbt={CustomName: "{\"text\":\"Home Marker\"}"},limit=1,sort=nearest]

# Make player wait for ~20s before teleporting again
scoreboard players set @a[scores={tp_home_marker=80..}] tp_home_delay 200

# Reset scoreboard marker
scoreboard players set @a[scores={tp_home_marker=80..}] tp_home_marker 0
