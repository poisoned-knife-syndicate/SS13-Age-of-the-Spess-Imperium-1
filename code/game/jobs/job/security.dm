//Warden and regular officers add this result to their get_access()
/datum/job/proc/check_config_for_sec_maint()
	if(config.jobs_have_maint_access & SECURITY_HAS_MAINT_ACCESS)
		return list(access_maint_tunnels)
	return list()

/*
Head of Shitcurity
*/
/datum/job/hos
	title = "Commissar"
	flag = HOS
	department_head = list("Lord General")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Regiment General"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	minimal_player_age = 14

	default_id = /obj/item/weapon/card/id/silver
	default_pda = /obj/item/device/pda/heads/hos
	default_headset = /obj/item/device/radio/headset/heads/hos
	default_backpack = /obj/item/weapon/storage/backpack/security
	default_satchel = /obj/item/weapon/storage/backpack/satchel_sec

	access = list(access_security, access_sec_doors, access_brig, access_armory, access_court,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_armory, access_court,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)

/datum/job/hos/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/det(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/swat/comissar2(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/comissarcap(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/commissar(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/hos/comissarcoat(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/weapon/melee/chainofcommand/cwhip(H), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/imperialbelt(H), slot_belt)

	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_l_store)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_in_backpack)


	spawn(10)
		var/weaponchoice = input(H, "Select a weapon.","Weapon Selection") as null|anything in list("Power Sword","Mercy Chainsword", "Bolter Pistol", "Heavy Stubber")
		switch(weaponchoice)
			if("Power Sword")
				H.equip_to_slot_or_del(new /obj/item/weapon/powersword/munitorium(H), slot_r_hand)
			if("Mercy Chainsword")
				H.equip_to_slot_or_del(new /obj/item/weapon/twohanded/chainswordig(H), slot_r_hand)
			if("Bolter Pistol")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/bpistol(H), slot_r_hand)
			if("Heavy Stubber")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/l6_saw(H), slot_r_hand)

/*
Detective
*/

/*
/datum/job/detective
	title = "Enforcer"
	flag = DETECTIVE
	department_head = list("Comissar")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	supervisors = "Adeptus Arbites"
	selection_color = "#ffeeee"
	minimal_player_age = 7

	default_pda = /obj/item/device/pda/detective
	default_headset = /obj/item/device/radio/headset/headset_sec
	default_backpack = /obj/item/weapon/storage/backpack/security
	default_satchel = /obj/item/weapon/storage/backpack/satchel_sec

	access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court, access_brig)
	minimal_access = list(access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court)

/datum/job/detective/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/head_of_security(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/hos(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/HoS(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/thermal/eyepatch(H), slot_glasses)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/imperialbelt(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/uzi(H), slot_s_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/energy/gun(H), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/uzim45(H), slot_in_backpack)

	var/obj/item/clothing/mask/cigarette/cig = new /obj/item/clothing/mask/cigarette(H)
	cig.light("")
	H.equip_to_slot_or_del(cig, slot_wear_mask)

	if(H.backbag == 1)//Why cant some of these things spawn in his office?
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/evidence(H), slot_l_hand)
		H.equip_to_slot_or_del(new /obj/item/device/detective_scanner(H), slot_r_store)
		H.equip_to_slot_or_del(new /obj/item/weapon/melee/collapsiblesword(H), slot_in_backpack)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/melee/collapsiblesword(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/evidence(H), slot_in_backpack)
		H.equip_to_slot_or_del(new /obj/item/device/detective_scanner(H), slot_in_backpack)

	spawn(10)
		var/weaponchoice = input(H, "Select a weapon.","Weapon Selection") as null|anything in list("Mercy Chainsword", "Vox Legi Shotgun", "Lasgun (Fully Equipped)")
		switch(weaponchoice)
			if("Mercy Chainsword")
				H.equip_to_slot_or_del(new /obj/item/weapon/twohanded/chainswordig(H), slot_r_hand)
			if("Vox Legi Shotgun")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/shotgun/combat/voxlegis(H), slot_r_hand)
			if("Lasgun (Fully Equipped)")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/lasgun(H), slot_r_hand)
*/


/*
Security Officer
*/
/datum/job/officer
	title = "Imperial Guardsman"
	flag = OFFICER
	department_head = list("Comissar")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 500
	spawn_positions = 50
	supervisors = "Commissar and your Platoon Sergeant."
	selection_color = "#ffeeee"
	minimal_player_age = 7
	var/list/dep_access = null

	default_id = /obj/item/weapon/card/id/dogtag

	access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels, access_morgue)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_court) //But see /datum/job/warden/get_access()

/datum/job/officer/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	assign_sec_to_department(H)

	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/imperialboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/imperialarmor(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/imperialhelmet(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/lasgun(H), slot_s_store)


/datum/job/officer/get_access()
	var/list/L = list()
	if(dep_access)
		L |= dep_access.Copy()
	L |= ..() | check_config_for_sec_maint()
	dep_access = null;
	return L

var/list/sec_departments = list("engineering", "supply", "medical", "science")

/datum/job/officer/proc/assign_sec_to_department(var/mob/living/carbon/human/H)
	if(!sec_departments.len)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
	else
		var/department = pick(sec_departments)
		sec_departments -= department
		switch(department)
			if("supply")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
			if("engineering")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
			if("medical")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
			if("science")
				H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)




/*
Security Officer
*/
/datum/job/medic
	title = "Imperial Guardsman Medic"
	flag = MEDIC
	department_head = list("Comissar")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 8
	spawn_positions = 8
	supervisors = "Commissar and your Platoon Sergeant."
	selection_color = "#ffeeee"
	minimal_player_age = 7
	var/list/dep_access = null

	default_id = /obj/item/weapon/card/id/dogtag

	access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels, access_morgue)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_court) //But see /datum/job/warden/get_access()

/datum/job/officer/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	assign_sec_to_department(H)

	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/imperialboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/imperialarmor/medic(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/imperialhelmet/medic(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/lasgun/pistol(H), slot_s_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/medic/start(H), slot_belt)



/datum/job/vox
	title = "Imperial Guardsman Vox Operator"
	flag = MEDIC
	department_head = list("Comissar")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 8
	spawn_positions = 8
	supervisors = "Commissar and your Platoon Sergeant."
	selection_color = "#ffeeee"
	minimal_player_age = 7

	default_id = /obj/item/weapon/card/id/dogtag

	access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels, access_morgue)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_court) //But see /datum/job/warden/get_access()

/datum/job/officer/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	assign_sec_to_department(H)

	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/imperialboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/imperialarmor/vox(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/imperialhelmet/vox(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/lasgun(H), slot_s_store)
	H.equip_to_slot_or_del(new /obj/item/device/radio/voxcaster(H), slot_back)


/*
Warden
*/
/datum/job/warden
	title = "Guardsman Sergeant"
	flag = WARDEN
	department_head = list("Comissar")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Commissar"
	selection_color = "#ffeeee"
	minimal_player_age = 0

	access = list(access_security, access_sec_doors, access_brig, access_armory, access_court, access_maint_tunnels, access_morgue)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_armory, access_court) //See /datum/job/warden/get_access()

/datum/job/warden/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/imperialboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/imperialarmor/leader(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/imperialhelmet/leader(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/belt/imperialbelt(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/lasgun(H), slot_s_store)
	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_l_hand)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_in_backpack)

	spawn(10)
		var/weaponchoice = input(H, "Select a weapon.","Weapon Selection") as null|anything in list("Chainsword", "Hell Pistol", "Guardsman's Sword and Laspistol")
		switch(weaponchoice)
			if("Chainsword")
				H.equip_to_slot_or_del(new /obj/item/weapon/twohanded/chainswordig(H), slot_r_hand)
			if("Hell Pistol")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/hellpistol(H), slot_r_hand)
			if("Guardsman's Sword and Las Pistol")
				H.equip_to_slot_or_del(new /obj/item/weapon/complexsword/IGsword(H), slot_r_hand)
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/lasgun/pistol(H), slot_l_hand)


/datum/job/warden/get_access()
	var/list/L = list()
	L = ..() | check_config_for_sec_maint()
	return L
