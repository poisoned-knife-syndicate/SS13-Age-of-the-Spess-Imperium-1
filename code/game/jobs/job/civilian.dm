
/*
Inquisitor
*/
/datum/job/inquisitor
	title = "Inquisitor"
	flag = INQUISITOR
	department_head = list("Ordo Hereticus")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Ordo Hereticus"
	selection_color = "#dddddd"
	var/global/lawyers = 0 //Counts lawyer amount
	default_backpack = /obj/item/weapon/storage/backpack/inq
	default_satchel = /obj/item/weapon/storage/backpack/inq
	default_pda = /obj/item/device/pda/lawyer
	default_headset = /obj/item/device/radio/headset/headset_sec
	default_id = /obj/item/weapon/card/id/inquisitor

	access = list(access_security, access_sec_doors, access_brig, access_court, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_theatre, access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_mineral_storeroom, access_cent_inquisitor, access_cent_general, access_cent_hereticus)
	minimal_access = list(access_security, access_sec_doors, access_court,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_theatre, access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway, access_mineral_storeroom, access_cent_inquisitor, access_cent_general, access_cent_hereticus)

/datum/job/inquisitor/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/inq(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/inqarmor(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/laspistol2(H), slot_s_store)
	H.equip_to_slot_or_del(new /obj/item/device/pda/lawyer(H), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/weapon/powersword/pknife(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/device/hdetector(H), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/weapon/paper/inq(H), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/combat/inquisitor(H), slot_gloves)
	H.faction = "Inquisitor"
	if (prob(50))
		var/obj/item/weapon/implant/loyalty/E = new/obj/item/weapon/implant/loyalty(H)
		E.imp_in = H
		E.implanted = 1

	spawn(10)
		H.wear_id.name = "[H.real_name]'s Inquisitorial Seal"

	spawn(10)
		var/weaponchoice = input(H, "Select a weapon.","Weapon Selection") as null|anything in list("Power Sword", "Mercy Chainsword", "Hell Pistol", "Stubber Pistol", "Inferno Pistol")
		switch(weaponchoice)
			if("Power Sword")
				H.equip_to_slot_or_del(new /obj/item/weapon/powersword/(H), slot_r_hand)
			if("Mercy Chainsword")
				H.equip_to_slot_or_del(new /obj/item/weapon/twohanded/chainswordig/inq(H), slot_r_hand)
			if("Hell Pistol")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/hellpistol(H), slot_r_hand)
			if("Inferno Pistol")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/inferno(H), slot_r_hand)
			if("Stubber Pistol")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/pistol(H), slot_r_hand)

/*
/datum/job/psyker
	title = "Librarian"
	flag = LIBRARIAN
	department_head = list("Commissar")
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Commissar or the Inquisition"
	selection_color = "#dddddd"


	access = list(access_maint_tunnels)
	minimal_access = list(access_maint_tunnels)

/datum/job/librarian/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/suit_jacket/red(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/(H), slot_shoes)
	H.equip_to_slot_or_del(new /(H), slot_r_store)
	H.equip_to_slot_or_del(new (H), slot_l_store)
*/

//--Eldar Spy--

/datum/job/eldarspy
	title = "Assistant"
	flag = ELDARSPY
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = -1
	spawn_positions = -1
	supervisors = "Everyone!"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/assistant/get_access()
	minimal_access = list()	//See /datum/job/assistant/get_access()
	idtype = /obj/item/weapon/card/id/assistant

// eldarspy/datum/job/eldarspy/equip_items(var/mob/living/carbon/human/H)
	//H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	//H.equip_to_slot_or_del(new /obj/item/clothing/suit/cape(H), slot_wear_suit)
	//H.equip_to_slot_or_del(new /obj/item/clothing/under/color/grey(H), slot_w_uniform)
	//H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sneakers/black(H), slot_shoes)  //Looks like an assistant
	// removalH.equip_to_slot_or_del(new /obj/item/weapon/paper/espy(H), slot_in_backpack)  //With a cloaking device
	//H.equip_to_slot_or_del(new /obj/item/device/soulstone(H), slot_in_backpack)	//and a soulstone. Perfectly normal!
	//H.equip_to_slot_or_del(new /obj/item/weapon/card/id/syndicate(H), slot_in_backpack)

//datum/job/assistant/get_access()
//	if(config.jobs_have_maint_access & ASSISTANTS_HAVE_MAINT_ACCESS) //Config has assistant maint access set
//		. = ..()
//		. |= list(access_maint_tunnels)
//	else
//		return ..()