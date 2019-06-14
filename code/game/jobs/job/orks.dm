/datum/job/ork/gretchin
	title = "Gretchin"
	flag = GRETCHIN
	department_head = list("Boss")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Boss"
	selection_color = "#dddddd"

/datum/job/ork/gretchin/equip_items(var/mob/living/carbon/human/H)

/datum/job/ork/gretchin/equip(var/mob/living/carbon/human/H)
	if(!H)	return 0
	H.change_mob_type(/mob/living/carbon/human/ork/gretchin, src, src, 1)
