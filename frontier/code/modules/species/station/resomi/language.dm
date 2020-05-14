/datum/language/resomi
	name = LANGUAGE_RESOMI
	desc = "A trilling language spoken by the diminutive Resomi."
	speech_verb = "�������"
	ask_verb = "��������"
	exclaim_verb = "�������"
	colour = "alien"
	key = "e"
	flags = WHITELISTED
	space_chance = 50
	syllables = list(
			"ca", "ra", "ma", "sa", "na", "ta", "la", "sha", "scha", "a", "a",
			"ce", "re", "me", "se", "ne", "te", "le", "she", "sche", "e", "e",
			"ci", "ri", "mi", "si", "ni", "ti", "li", "shi", "schi", "i", "i"
		)
	shorthand = "SCH"

/datum/language/resomi/get_random_name(gender)
	return ..(gender, 1, 4, 1.5)