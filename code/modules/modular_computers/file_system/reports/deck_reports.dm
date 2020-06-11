//Reports for the deck management program.

/datum/computer_file/report/flight_plan
	form_name = "DC109"
	title = "План Полета"
	var/datum/report_field/people/leader     //Give these a special name for easier access.
	var/datum/report_field/people/manifest
	var/datum/report_field/planned_depart

/datum/computer_file/report/flight_plan/New()
	..()
	set_access(null, access_bridge)

/datum/computer_file/report/flight_plan/Destroy()
	leader = null
	manifest = null
	planned_depart = null
	return ..()

/datum/computer_file/report/flight_plan/generate_fields()
	add_field(/datum/report_field/text_label/instruction, "Обязательные поля:")
	leader = add_field(/datum/report_field/people/from_manifest, "Командир", required = 1)
	planned_depart = add_field(/datum/report_field/time, "Время отправления", required = 1)
	add_field(/datum/report_field/text_label/instruction, "Необязательные поля:")
	manifest = add_field(/datum/report_field/people/list_from_manifest, "Манифест")
	add_field(/datum/report_field/pencode_text, "Цель")
	add_field(/datum/report_field/time, "Ожидаемое время возвращения/контакта")
	add_field(/datum/report_field/simple_text, "Данные о топливе")

//These fields will be auto-set.
/datum/computer_file/report/recipient/shuttle
	var/datum/report_field/shuttle
	var/datum/report_field/mission
	var/access_shuttle = 0 //Set to 1 to give the shuttle's logging access as an access_edit pattern.

/datum/computer_file/report/recipient/shuttle/New()
	..()
	set_access(null, access_bridge)

/datum/computer_file/report/recipient/shuttle/Destroy()
	shuttle = null
	mission = null
	return ..()

/datum/computer_file/report/recipient/shuttle/generate_fields()
	..()
	shuttle = add_field(/datum/report_field/simple_text, "Шаттл", required = 1)
	shuttle.can_edit = 0
	mission = add_field(/datum/report_field/simple_text, "Миссия", required = 1)
	mission.can_edit = 0

/datum/computer_file/report/recipient/shuttle/damage
	form_name = "DC243"
	title = "Оценка Ущерба"

/datum/computer_file/report/recipient/shuttle/damage/New()
	..()
	set_access(null, access_cargo, override = 0)

/datum/computer_file/report/recipient/shuttle/damage/generate_fields()
	..()
	add_field(/datum/report_field/text_label/instruction, "Оцените ущерб, нанесенный шаттлу, и его готовность к полету.")
	add_field(/datum/report_field/pencode_text, "Состояние шаттла по прибытии")
	add_field(/datum/report_field/simple_text, "Готовность к полету")
	add_field(/datum/report_field/pencode_text, "Требующийся ремонт")
	add_field(/datum/report_field/time, "Предполагаемое время завершения работ")

/datum/computer_file/report/recipient/shuttle/fuel
	form_name = "DC12"
	title = "Отчет о Дозаправке"

/datum/computer_file/report/recipient/shuttle/fuel/New()
	..()
	set_access(null, access_cargo, override = 0)

/datum/computer_file/report/recipient/shuttle/fuel/generate_fields()
	..()
	add_field(/datum/report_field/simple_text, "Предыдущий уровень топлива")
	add_field(/datum/report_field/simple_text, "Текущий уровень топлива")
	add_field(/datum/report_field/time, "Время дозаправки топливом")
	add_field(/datum/report_field/pencode_text, "Заметки")

/datum/computer_file/report/recipient/shuttle/atmos
	form_name = "DC245"
	title = "Оценка Атмосферных Показателей"

/datum/computer_file/report/recipient/shuttle/atmos/New()
	..()
	set_access(null, access_cargo, override = 0)

/datum/computer_file/report/recipient/shuttle/atmos/generate_fields()
	..()
	add_field(/datum/report_field/text_label/instruction, "Оцените состояние атмосферной системы шаттла.")
	add_field(/datum/report_field/pencode_text, "Состояние атмосферных запасов")
	add_field(/datum/report_field/simple_text, "Необходимо пополнение")

/datum/computer_file/report/recipient/shuttle/gear
	form_name = "DC248b"
	title = "Инвентаризация Аварийного Снабжения; Сводная версия"

/datum/computer_file/report/recipient/shuttle/gear/New()
	..()
	set_access(null, access_cargo, override = 0)

/datum/computer_file/report/recipient/shuttle/gear/generate_fields()
	..()
	add_field(/datum/report_field/text_label/instruction, "Суммируйте состояние критических-важных аварийных запасов шаттла.")
	add_field(/datum/report_field/pencode_text, "Состояние запасов на момент прибытия")
	add_field(/datum/report_field/pencode_text, "Пополненные запасы")
	add_field(/datum/report_field/time, "Время пополнения")
	add_field(/datum/report_field/simple_text, "Готовность к полету")
	add_field(/datum/report_field/pencode_text, "Заметки")

/datum/computer_file/report/recipient/shuttle/post_flight
	form_name = "DC102"
	title = "Стандартное Резюме Экспедиции"
	access_shuttle = 1

/datum/computer_file/report/recipient/shuttle/post_flight/generate_fields()
	..()
	add_field(/datum/report_field/text_label/instruction, "Доложите о результатах и выводах экспедиции.")
	add_field(/datum/report_field/simple_text, "Посещенные места")
	add_field(/datum/report_field/simple_text, "Общая цель миссии")
	add_field(/datum/report_field/pencode_text, "Краткое описание деятельности")
	add_field(/datum/report_field/pencode_text, "Состояние экипажа, жертвы")
	add_field(/datum/report_field/pencode_text, "Собранные предметы или материалы")
	add_field(/datum/report_field/pencode_text, "Рекомендуемые последующие мероприятия")
	add_field(/datum/report_field/pencode_text, "Заметки")
