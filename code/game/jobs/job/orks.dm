/datum/job/ork/gretchin
	title = "gretchin"
	flag = GRETCHIN
	department_head = list("Boss")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Boss"
	selection_color = "#dddddd"

/datum/job/ork/gretchin/equip_items(var/mob/living/carbon/human/H)
	H.equip_to_slot_or_del(new /obj/item/weapon/twohanded/chainswordig(H), slot_r_hand) //testing

/datum/job/ork/gretchin/equip(var/mob/living/carbon/human/H)
	if(!H)	return 0
	H.change_mob_type(/mob/living/carbon/human/ork/gretchin, src, src, 1)
