#========================================
# Mode de déclenchement :
	# Tick

# Fonction du fichier :
	# Sert à calculer tous les nombres en lien avec l'experience et les niveaux des joueurs

# Tags utilisés :
	#-----
#========================================



# Calcul de l'xp pour monter d'un niveau

scoreboard players set @a stats_xp2up 39
	
execute as @a run scoreboard players operation @s stats_xp0 = @s stats_level
execute as @a run scoreboard players operation @s stats_xp0 *= @s stats_level
execute as @a run scoreboard players operation @s stats_xp0 *= @s stats_xp0
	
execute as @a run scoreboard players operation @s stats_xp1 = @s stats_level
execute as @a run scoreboard players operation @s stats_xp1 *= @s stats_level
execute as @a run scoreboard players operation @s stats_xp1 *= @s stats_level
execute as @a run scoreboard players operation @s stats_xp1 *= 68 commun_Constante
	
execute as @a run scoreboard players operation @s stats_xp2 = @s stats_level
execute as @a run scoreboard players operation @s stats_xp2 *= @s stats_level
execute as @a run scoreboard players operation @s stats_xp2 = 87 commun_Constante
	
execute as @a run scoreboard players operation @s stats_xp3 = @s stats_level
execute as @a run scoreboard players operation @s stats_xp3 = 18 commun_Constante
	
execute as @a run scoreboard players operation @s stats_xp2up += @s stats_xp0
execute as @a run scoreboard players operation @s stats_xp2up += @s stats_xp1
execute as @a run scoreboard players operation @s stats_xp2up += @s stats_xp2
execute as @a run scoreboard players operation @s stats_xp2up += @s stats_xp3



#Passage au niveau suivant

execute as @a[scores={stats_level=0..201}] if score @s stats_xp >= @s stats_xp2up run scoreboard players add @s level 1
execute as @a[scores={stats_level=0..201}] if score @s stats_xp >= @s stats_xp2up run scoreboard players operation @s stats_xp -= @s stats_xp2up
	


#Message et son

execute as @a[scores={stats_level=0..201}] if score @s stats_xp >= @s stats_xp2up run tellraw @s ["",{"text":"§7§lServeur§r §8➤ "},{"text":"Bravo ! Tu passe au niveau ","color":"green"},{"score":{"objective":"stats_level","name":"@s"},"color":"gold","bold":"true"},{"text":" !","color":"green"}]
execute as @a[scores={stats_level=0..201}] if score @s stats_xp >= @s stats_xp2up run playsound minecraft:entity.player.levelup master @s
