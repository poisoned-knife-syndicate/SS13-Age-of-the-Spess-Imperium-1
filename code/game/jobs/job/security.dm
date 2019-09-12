//Warden and regular officers add this result to their get_access()
/datum/job/proc/check_config_for_sec_maint()
	if(config.jobs_have_maint_access & SECURITY_HAS_MAINT_ACCESS)
		return list(access_maint_tunnels)
	return list()

/*
Head of Shitcurity
*/
/datum/job/commissar
	title = "Commissar"
	flag = COMMISSAR
	department_head = list("General")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Regiment General"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	minimal_player_age = 14

	default_id = /obj/item/weapon/card/id/silver
	default_headset = /obj/item/device/radio/headset/heads/hos
	default_backpack = /obj/item/weapon/storage/backpack/impguard
	default_satchel = /obj/item/weapon/storage/backpack/impguard

	access = list(access_security, access_sec_doors, access_brig, access_armory, access_court,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_armory, access_court,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)

/datum/job/commissar/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/det(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/swat/comissar2(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/commissarcap(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/hos/comissarcoat(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/weapon/melee/chainofcommand/cwhip(H), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/bpistolmag(H), slot_in_backpack)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/bpistol(H), slot_s_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/chainsword(H), slot_belt)

	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_l_store)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_in_backpack)

	spawn(10)
		var/weaponchoice = input(H, "Select a weapon.","Weapon Selection") as null|anything in list("Power Sword","Mercy Chainsword", "Hell Pistol",)
		switch(weaponchoice)
			if("Power Sword")
				H.equip_to_slot_or_del(new /obj/item/weapon/powersword/munitorium(H), slot_r_hand)
			if("Mercy Chainsword")
				H.equip_to_slot_or_del(new /obj/item/weapon/twohanded/chainswordig(H), slot_r_hand)
			if("Bolter Pistol")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/hellpistol(H), slot_r_hand)

/*
Detective
*/
/datum/job/enforcer
	title = "Kasrkin"
	flag = KASRKIN
	department_head = list("Commissar")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 5
	spawn_positions = 1
	supervisors = "Segmentum Command and the Regimental General"
	selection_color = "#ffeeee"
	minimal_player_age = 7

	default_headset = /obj/item/device/radio/headset/headset_sec
	default_backpack = /obj/item/weapon/storage/backpack/impguard
	default_satchel = /obj/item/weapon/storage/backpack/satchel_sec

	access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court, access_brig)
	minimal_access = list(access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court)

/datum/job/enforcer/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/imperialboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/gloves/black(H), slot_gloves)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/imperialarmor/kasrkinarmor(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/imperialhelmet/kasrkinhelm(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/clothing/glasses/thermal(H), slot_glasses)
	H.equip_to_slot_or_del(new /obj/item/weapon/chainsword(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/grenade/krak(H), slot_r_store)
	H.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/lasgunmag(H), slot_l_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/autogunmag(H), slot_in_backpack)

	spawn(10)
		var/weaponchoice = input(H, "Select a weapon.","Weapon Selection") as null|anything in list("Autogun","Imperial Flamer", "Lasgun (Fully Equipped)")
		switch(weaponchoice)
			if("Imperial Flamer")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/flamer(H), slot_r_hand)
			if("Lasgun (Fully Equipped)")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/lasgun(H), slot_r_hand)
			if("Autogun")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/autogun2(H), slot_r_hand)

/*
Warden
*/
/datum/job/ig_guard_sergeant
	title = "Guardsman Sergeant"
	flag = IGGUARDSERGEANT
	department_head = list("Comissar")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Commissar"
	selection_color = "#ffeeee"
	minimal_player_age = 0

	access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court, access_brig)
	minimal_access = list(access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court)

/datum/job/ig_guard_sergeant/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/imperialboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/imperialarmor/leader(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/sgtheadset(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/weapon/chainsword(H), slot_belt)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/lasgun(H), slot_s_store)
	if(H.backbag == 1)
		H.equip_to_slot_or_del(new /obj/item/weapon/handcuffs(H), slot_l_hand)
	else
		H.equip_to_slot_or_del(new /obj/item/weapon/complexknife/combatknife(H), slot_in_backpack)

	spawn(10)
		var/weaponchoice = input(H, "Select a weapon.","Weapon Selection") as null|anything in list("Chainsword", "Hell Pistol", "Guardsman's Sword and Laspistol")
		switch(weaponchoice)
			if("Chainsword")
				H.equip_to_slot_or_del(new /obj/item/weapon/twohanded/chainswordig(H), slot_r_hand)
			if("Hell Pistol")
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/hellpistol(H), slot_r_hand)
			if("Guardsman's Sword and Las Pistol")
				H.equip_to_slot_or_del(new /obj/item/weapon/complexsword/IGsword(H), slot_r_hand)
				H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/lasgun/kantrael(H), slot_l_hand)


/datum/job/ig_guard_sergeant/get_access()
	var/list/L = list()
	L = ..() | check_config_for_sec_maint()
	return L

/*
Security Officer
*/
/datum/job/ig_guardsman
	title = "Imperial Guardsman"
	flag = IGGUARDSMAN
	department_head = list("Commissar")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 100
	spawn_positions = 50
	supervisors = "Commissar and your Platoon Sergeant."
	selection_color = "#ffeeee"
	minimal_player_age = 7
	var/list/dep_access = null

	default_id = /obj/item/weapon/card/id/dogtag
	default_backpack = /obj/item/weapon/storage/backpack/impguard

	access = list(access_security, access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court, access_brig)
	minimal_access = list(access_sec_doors, access_forensics_lockers, access_morgue, access_maint_tunnels, access_court)

/datum/job/ig_guardsman/equip_items(var/mob/living/carbon/human/H)
	H.verbs += /mob/living/carbon/human/proc/renderaid									 //This is how we get the verb!
	assign_sec_to_department(H)

	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/imperialboots(H), slot_shoes)
	H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/security(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/imperialarmor(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/head/imperialhelmet(H), slot_head)
	H.equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/lasgun(H), slot_s_store)
	H.equip_to_slot_or_del(new /obj/item/weapon/grenade/krak(H), slot_r_store)
	H.equip_to_slot_or_del(new /obj/item/ammo_box/magazine/lasgunmag(H), slot_l_store)

/datum/job/ig_guardsman/get_access()
	var/list/L = list()
	if(dep_access)
		L |= dep_access.Copy()
	L |= ..() | check_config_for_sec_maint()
	dep_access = null;
	return L

var/list/sec_departments = list("engineering", "supply", "medical", "science")

/datum/job/ig_guardsman/proc/assign_sec_to_department(var/mob/living/carbon/human/H)
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



