/mob/living/proc/toggle_pass_table()
	set category = "Abilities"
	set name = "Toggle Agility" //Dunno a better name for this. You have to be pretty agile to hop over stuff!!!
	set desc = "Allows you to start/stop hopping over things such as hydroponics trays, tables, and railings."
	pass_flags ^= PASS_FLAG_TABLE //I dunno what this fancy ^= is but Aronai gave it to me.
	to_chat(src, "You [pass_flags&PASS_FLAG_TABLE ? "will" : "will NOT"] move over tables/railings/trays!")
