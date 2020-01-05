# Mark players holding an target locator
scoreboard players set @a[scores={tp_players_delay=0},nbt={SelectedItem:{id:"minecraft:blue_dye",tag:{display:{Name:'{"text":"Teleporter"}'}}}}] tp_players_m 1

# Teleport
teleport @a[scores={tp_players_m=1}] @p[nbt={SelectedItem:{id:"minecraft:red_dye",tag:{display:{Name:'{"text":"Teleportation Beacon"}'}}}}]

# Play Teleporting sound
execute at @a[scores={tp_players_m=1}] run playsound minecraft:entity.enderman.teleport ambient @a[scores={tp_players_m=1}]

# Make player wait for ~10s before teleporting again
scoreboard players set @a[scores={tp_players_m=1}] tp_players_delay 200

# Reset scoreboard marker
scoreboard players reset @a[scores={tp_players_m=1}] tp_players_m
