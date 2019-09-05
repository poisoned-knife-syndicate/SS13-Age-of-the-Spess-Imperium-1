
/mob/living/carbon/human/whitelisted/furrylord
	name = "Lord Yiffus"
	real_name = "Lord Yiffus"
	suicide_allowed = 0
	universal_speak = 1
	gender = "male"
	status_flags = 0
	icon = 'icons/mob/furrymutant.dmi'
	icon_state = "furrymutant"

/mob/living/carbon/human/whitelisted/furrylord/New()
	..()
	sleep (5)
	var/obj/item/device/radio/headset/R = new /obj/item/device/radio/headset/headset_cent
	R.set_frequency(1441)
	equip_to_slot_or_del(R, slot_ears)
	equip_to_slot_or_del(new /obj/item/clothing/under/color/black, slot_w_uniform)
	equip_to_slot_or_del(new /obj/item/clothing/suit/armor/ELIPHAS, slot_wear_suit)
	equip_to_slot_or_del(new /obj/item/clothing/shoes/magboots/advance, slot_shoes)
	equip_to_slot_or_del(new /obj/item/clothing/gloves/black, slot_gloves)
	equip_to_slot_or_del(new /obj/item/clothing/head/helmet/WBhelmet, slot_head)
	equip_to_slot_or_del(new /obj/item/weapon/gun/energy/plasma/pistol/chaos, slot_belt)
	equip_to_slot_or_del(new /obj/item/ammo_box/magazine/boltermag, slot_r_store)
	equip_to_slot_or_del(new /obj/item/ammo_box/magazine/boltermag, slot_l_store)
	equip_to_slot_or_del(new /obj/item/weapon/tank/oxygen/WBback, slot_back)
	equip_to_slot_or_del(new /obj/item/weapon/gun/projectile/automatic/bolter/chaos, slot_s_store)
	equip_to_slot_or_del(new /obj/item/weapon/gun/magic/staff/abyssalstaff, slot_r_hand)
	equip_to_slot_or_del(new /obj/item/weapon/hellblade, slot_l_hand)