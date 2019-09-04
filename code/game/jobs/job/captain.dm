/*
Captain
*/
/datum/job/general
	title = "General"
	flag = GENERAL
	department_head = list("Centcom")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The System Governor, Adeptus Administratum and the Emperor."
	selection_color = "#ccccff"
	req_admin_notify = 1
	minimal_player_age = 14

	default_id = /obj/item/weapon/card/id/gold
	default_pda = /obj/item/device/pda/captain
	default_headset = /obj/item/device/radio/headset/heads/captain
	default_backpack = /obj/item/weapon/storage/backpack/satchel_cap
	default_satchel = /obj/item/weapon/storage/backpack/satchel_cap

	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()

/datum/job/general/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/promoteIG
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	var/obj/item/clothing/under/U = new /obj/item/clothing/under/rank/captain(H)
	U.attachTie(new /obj/item/clothing/tie/medal/gold/sealofpurity())
	H.equip_to_slot_or_del(U, slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/commanderarmor(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/imperialboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/plasma/pistol(H), slot_s_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/melee/chainofcommand/cwhip(H), slot_in_backpack)

	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/melee/telebaton(H), slot_in_backpack)

	world << "<b>[H.real_name] is the Regiment General!</b>"

/datum/job/general/get_access()
	return get_all_accesses()

/*
LG promotion
*/

/mob/living/carbon/human/proc/promoteIG(var/mob/living/carbon/human/M in mob_list)
	set category = null
	set name = "Field Promotion"
	set desc = "Finally! Some recognition!"
	if(!ishuman(M))
		usr << text("<span class='notice'>Thats not a person.</span>")
		return
	var/mob/living/carbon/human/U = src

	var/list/options = list(
		"Conscript to Guardsman",
		"Promote to Captain",
		"Cancel",
		)

	var/theoptions = input("Select what you would like to promote [M] to.", "Promote Menu") as null|anything in options
	if (isnull(theoptions))																	//You chose poorly
		return
	if(!Adjacent(M))																			//How close are we?
		usr << text("<span class='notice'>Get a little closer.</span>")
		return

	switch(theoptions)
		if ("Cancel")
			return	//do nothing

		if ("Conscript to Guardsman")
			for(var/obj/item/weapon/card/id/W in M.contents)
				M.unEquip(W)
				U.visible_message(text("<span class='alert'>[U] snatches [W] and tosses it on the ground.</span>"))

			var/obj/item/weapon/card/id/dogtag/W = new
			W.access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels, access_morgue)
			W.assignment = "Imperial Guard"
			W.registered_name = M.real_name
			W.update_label()
			M.equip_to_slot_or_del(W, slot_wear_id)
			M.regenerate_icons()
			U.visible_message(text("<span class='alert'>[U] slaps a new ID onto [M].</span>"))
			U.say("Welcome the to guard.")
		if ("Promote to Captain")
			for(var/obj/item/weapon/card/id/W in M.contents)
				M.unEquip(W)
				U.visible_message(text("<span class='alert'>[U] snatches [W] and tosses it on the ground.</span>"))

			var/obj/item/weapon/card/id/dogtag/W = new
			W.access = get_all_accesses()
			W.assignment = "Captain"
			W.registered_name = M.real_name
			W.update_label()
			M.equip_to_slot_or_del(W, slot_wear_id)
			M.regenerate_icons()
			U.visible_message(text("<span class='alert'>[U] slaps a new ID onto [M].</span>"))
			playsound(U.loc, 'sound/voice/numberoneguy.ogg', 75, 0)

		else
			return

