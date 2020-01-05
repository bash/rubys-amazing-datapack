# Make sure new players have zero set, so they are teleportable
scoreboard players add @a tp_home_delay 0
scoreboard players add @a tp_players_delay 0

# Decrement delay
scoreboard players remove @a[scores={tp_home_delay=1..}] tp_home_delay 1
scoreboard players remove @a[scores={tp_players_delay=1..}] tp_players_delay 1

