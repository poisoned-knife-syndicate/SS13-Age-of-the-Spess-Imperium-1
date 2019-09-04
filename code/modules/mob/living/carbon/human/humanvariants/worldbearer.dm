/mob/living/carbon/human/whitelisted/worldbearer
	name = "Unknown"
	real_name = "Unknown"
	suicide_allowed = 0
	universal_speak = 1
	gender = "male"
	status_flags = 0

/mob/living/carbon/human/whitelisted/worldbearer/New()
	..()
	sleep (5)
	var/obj/item/device/radio/headset/R = new /obj/item/device/radio/headset/headset_cent
	R.set_frequency(1441)
	equip_to_slot_or_del(R, slot_ears)
	equip_to_slot_or_del(new /obj/item/clothing/under/color/black, slot_w_uniform)
	equip_to_slot_or_del(new /obj/item/clothing/suit/armor/WBpowerarmor, slot_wear_suit)
	equip_to_slot_or_del(new /obj/item/clothing/shoes/magboots/advance, slot_shoes)
	equip_to_slot_or_del(new /obj/item/clothing/gloves/black, slot_gloves)
	equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/security/night, slot_glasses)
	equip_to_slot_or_del(new /obj/item/clothing/mask/breath/marine, slot_wear_mask)
	equip_to_slot_or_del(new /obj/item/clothing/head/helmet/WBhelmet, slot_head)
	equip_to_slot_or_del(new /obj/item/weapon/chainsword, slot_belt)
	equip_to_slot_or_del(new /obj/item/ammo_box/magazine/boltermag, slot_r_store)
	equip_to_slot_or_del(new /obj/item/ammo_box/magazine/boltermag, slot_l_store)
	equip_to_slot_or_del(new /obj/item/weapon/tank/oxygen/WBback, slot_back)
	equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/bolter/chaos, slot_s_store)

	var/namelist = list  ("Nas", "Chod", "Keras", "Treg", "Lidacus", "Creasion", "Crasius", "Nabrus", "Soras", "Kylus", "Logren", "Crecep", "Meridian", "Davros", "Drusus", "Razal", "Ferox", "Nacret")
	var/rndname = pick(namelist)

	name = "Traitor Marine [rndname]"
	real_name = "Traitor Marine [rndname]"
	var/obj/item/weapon/card/id/W = new
	W.icon_state = "umcard"
	W.access = get_all_accesses()
	W.access += get_centcom_access("UltraMarine")
	W.assignment = "World Bearer"
	W.registered_name = real_name
	W.update_label()
	equip_to_slot_or_del(W, slot_wear_id)
	sleep(20)
	regenerate_icons()