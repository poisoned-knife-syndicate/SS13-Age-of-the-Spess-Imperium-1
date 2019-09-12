
/obj/item/clothing/under/rebel
	name = "Hive Ganger Clothing"
	desc = "Made of recycled cloth subtitutes- they're guaranteed to protect against nothing. <font color='blue'><i>Bane's gang makes these things from scavenged Guard uniforms. Quantity over quality.</i></font>"
	has_sensor = 0
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	icon = 'modules/opo/ss40k.dmi'
	icon_state = "rebeluniform"
	item_state = "rebeluniform

/obj/item/clothing/suit/armor/rebel
	name = "Renegade Armor"
	desc = "Bundled fiber and plasteel-inserts form a crude, but effective defense. <font color='blue'><i>ALWAYS ditch at first opportunity. These things are terrible.</i></font>"
	icon = 'modules/opo/ss40k.dmi'
	icon_state = "rebelarmor"
	item_state = "rebelarmor"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST|GROIN
	armor = list(melee = 30, bullet = 10, laser = 30,energy = 10, bomb = 25, bio = 0, rad = 0)
	allowed = list(/obj/item/weapon/gun/projectile/automatic/lasgun, /obj/item/weapon/gun/projectile/automatic/autogun/rebel)

/obj/item/weapon/gun/projectile/autogun/rebel
	name = "Modified Autogun"
	desc = "An old reliable, with a plasteel stock. <font color='blue'><i>Apply butt to target's head for maximal effect.</i></font>"
	icon_state = "autogun_old"
	item_state = "autogun"

/obj/item/weapon/gun/projectile/automatic/lasgun/rebel
	name = "Modified Lasgun"
	desc = "Lasgun parts shoved into an autopistol frame. <font color='blue'><i>Always swap out the lenses with new ones from the Corpse-dogs, lest yours turn into a grenade.</i></font>"
	icon = 'modules/opo/ss40k.dmi'
	icon_state = "rebellasgun"
	item_state = "rebellasgun"

/obj/item/weapon/gun/projectile/automatic/lasgun/rebel/attack
	if(!istype(user, /mob/living/carbon/human/)))
		else
			return
		if (prob(20)
			else
				return
			user << "<font color='red'><b>The lasgun hums menacingly.</b></font>"
			return

/obj/item/weapon/reagent_containers/food/snacks/rebeldrug
	name = "Frenzon Injector"
	desc = "A one-use Frenzon injector. Popular among gangers. <font color='blue'><i>Once you come off the Frenzon high- you're fucked.></i></font>"
	icon = 'modules/opo/ss40k.dmi'
	icon_state = "frenzoninjector"
	trash = /obj/item/trash
	filling_color = "#754C24"
	New()
		..()
		src << "<font color='red'><b>You feel ANGRY. Your blood seethes through your veins as they expand.</b></font>"
		reagents.add_reagent("nutriment", 5)
		reagents.add_reagent("hyperzine", 10)
		reagents.add_reagent("berserk", 10)
		reagents.add_reagent("morphine", 10)
		bitesize = 1

/obj/item/clothing/head/rebelhelmet
	name = "Renegade Helmet"
	desc = "Crude kevlar and plasteel plates form this helmet. <font color='blue'><i>Again, ditch at first opportunity. Looks dashing, though.</i></font>"
	icon = 'modules/opo/ss40k.dmi'
	icon_state = "rebelhelmet"
	item_state = "rebelhelmet"
	flags = HEADCOVERSEYES
	armor = list(melee = 50, bullet = 15, laser = 50,energy = 10, bomb = 25, bio = 0, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_TEMP_PROTECT
