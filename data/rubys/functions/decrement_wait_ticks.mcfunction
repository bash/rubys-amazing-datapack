# Make sure new players have zero set, so they are teleportable
scoreboard players add @a tp_players_delay 0

scoreboard players add @a tp_home_counter 0
scoreboard players add @a tp_home_state 0

# Decrement delay
scoreboard players remove @a[scores={tp_players_delay=1..}] tp_players_delay 1

