kill @e[type=minecraft:armor_stand,nbt={CustomName:"{\"text\":\"Home Marker\"}"}]
execute as @s run summon minecraft:armor_stand ~ ~ ~ {CustomName: "{\"text\":\"Home Marker\"}", Invisible:1, Marker: 1}
