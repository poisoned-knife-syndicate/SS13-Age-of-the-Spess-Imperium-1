/* First aid storage
 * Contains:
 *		First Aid Kits
 * 		Pill Bottles
 *		Dice Pack (in a pill bottle)
 */

/*
 * First Aid Kits
 */
/obj/item/weapon/storage/firstaid
	name = "first-aid kit"
	desc = "It's an emergency medical kit for those serious boo-boos."
	icon_state = "firstaid"
	throw_speed = 3
	throw_range = 7
	var/empty = 0


/obj/item/weapon/storage/firstaid/fire
	name = "fire first-aid kit"
	desc = "It's an emergency medical kit for when the toxins lab <i>-spontaneously-</i> burns down."
	icon_state = "ointment"
	item_state = "firstaid-ointment"

	New()
		..()
		if (empty) return

		icon_state = pick("ointment","firefirstaid")

		new /obj/item/device/healthanalyzer( src )
		new /obj/item/weapon/reagent_containers/hypospray/stabilize( src )
		new /obj/item/weapon/reagent_containers/hypospray/stabilize( src )
		new /obj/item/weapon/reagent_containers/syringe/bruteburn_treatment( src )
		new /obj/item/weapon/reagent_containers/pill/kelotane( src )
		new /obj/item/weapon/reagent_containers/pill/kelotane( src ) //Replaced ointment with these since they actually work --Errorage
		new /obj/item/weapon/reagent_containers/pill/dermaline( src )
		return


/obj/item/weapon/storage/firstaid/regular
	icon_state = "firstaid"

	New()
		..()
		if (empty) return
		new /obj/item/device/healthanalyzer(src)
		new /obj/item/weapon/reagent_containers/hypospray/stabilize( src )
		new /obj/item/weapon/reagent_containers/hypospray/stabilize( src )
		new /obj/item/weapon/reagent_containers/hypospray/stabilize( src )
		new /obj/item/weapon/reagent_containers/syringe/bruteburn_treatment( src )
		new /obj/item/weapon/reagent_containers/syringe/bruteburn_treatment( src )
		new /obj/item/weapon/reagent_containers/pill/bicaridine( src )
		return

/obj/item/weapon/storage/firstaid/toxin
	name = "toxin first aid"
	desc = "Used to treat when you have a high amoutn of toxins in your body."
	icon_state = "antitoxin"
	item_state = "firstaid-toxin"

	New()
		..()
		if (empty) return

		icon_state = pick("antitoxin","antitoxfirstaid","antitoxfirstaid2","antitoxfirstaid3")

		new /obj/item/weapon/reagent_containers/syringe/antitoxin( src )
		new /obj/item/weapon/reagent_containers/syringe/toxic_treatment( src )
		new /obj/item/weapon/reagent_containers/syringe/toxic_treatment( src )
		new /obj/item/weapon/reagent_containers/pill/antitox( src )
		new /obj/item/weapon/reagent_containers/pill/antitox( src )
		new /obj/item/weapon/reagent_containers/hypospray/stabilize( src )
		new /obj/item/device/healthanalyzer( src )
		return

/obj/item/weapon/storage/firstaid/o2
	name = "oxygen deprivation first aid"
	desc = "A box full of oxygen goodies."
	icon_state = "o2"
	item_state = "firstaid-o2"

	New()
		..()
		if (empty) return
		new /obj/item/weapon/reagent_containers/pill/dexalin( src )
		new /obj/item/weapon/reagent_containers/pill/dexalin( src )
		new /obj/item/weapon/reagent_containers/pill/dexalin( src )
		new /obj/item/weapon/reagent_containers/syringe/epinephrine( src )
		new /obj/item/weapon/reagent_containers/hypospray/stabilize( src )
		new /obj/item/weapon/reagent_containers/hypospray/stabilize( src )
		new /obj/item/device/healthanalyzer( src )
		return

/obj/item/weapon/storage/firstaid/tactical
	name = "first-aid kit"
	icon_state = "bezerk"
	desc = "I hope you've got insurance."
	max_w_class = 3

	New()
		..()
		if (empty) return
		new /obj/item/clothing/tie/stethoscope( src )
		new /obj/item/weapon/surgicaldrill ( src )
		new /obj/item/weapon/reagent_containers/hypospray/combat( src )
		new /obj/item/weapon/reagent_containers/pill/bicaridine( src )
		new /obj/item/weapon/reagent_containers/pill/dermaline( src )
		new /obj/item/weapon/reagent_containers/syringe/lethal/choral( src )
		new /obj/item/clothing/glasses/hud/health( src )
		return


/*
 * Pill Bottles
 */
/obj/item/weapon/storage/pill_bottle
	name = "pill bottle"
	desc = "It's an airtight container for storing medication."
	icon_state = "pill_canister"
	icon = 'icons/obj/chemical.dmi'
	item_state = "contsolid"
	w_class = 2.0
	can_hold = list(/obj/item/weapon/reagent_containers/pill,/obj/item/weapon/dice)
	allow_quick_gather = 1
	use_to_pickup = 1

/obj/item/weapon/storage/pill_bottle/MouseDrop(obj/over_object as obj) //Quick pillbottle fix. -Agouri

	if (ishuman(usr) || ismonkey(usr)) //Can monkeys even place items in the pocket slots? Leaving this in just in case~
		var/mob/M = usr
		if (!( istype(over_object, /obj/screen) ))
			return ..()
		if ((!( M.restrained() ) && !( M.stat ) /*&& M.pocket == src*/))
			switch(over_object.name)
				if("r_hand")
					M.unEquip(src)
					M.put_in_r_hand(src)
				if("l_hand")
					M.unEquip(src)
					M.put_in_l_hand(src)
			src.add_fingerprint(usr)
			return
		if(over_object == usr && in_range(src, usr) || usr.contents.Find(src))
			if (usr.s_active)
				usr.s_active.close(usr)
			src.show_to(usr)
			return
	return

/obj/item/weapon/storage/pill_bottle/kelotane
	name = "bottle of kelotane pills"
	desc = "Contains pills used to treat burns."

	New()
		..()
		new /obj/item/weapon/reagent_containers/pill/kelotane( src )
		new /obj/item/weapon/reagent_containers/pill/kelotane( src )
		new /obj/item/weapon/reagent_containers/pill/kelotane( src )
		new /obj/item/weapon/reagent_containers/pill/kelotane( src )
		new /obj/item/weapon/reagent_containers/pill/kelotane( src )
		new /obj/item/weapon/reagent_containers/pill/kelotane( src )
		new /obj/item/weapon/reagent_containers/pill/kelotane( src )

/obj/item/weapon/storage/pill_bottle/antitox
	name = "bottle of anti-toxin pills"
	desc = "Contains pills used to counter toxins."

	New()
		..()
		new /obj/item/weapon/reagent_containers/pill/antitox( src )
		new /obj/item/weapon/reagent_containers/pill/antitox( src )
		new /obj/item/weapon/reagent_containers/pill/antitox( src )
		new /obj/item/weapon/reagent_containers/pill/antitox( src )
		new /obj/item/weapon/reagent_containers/pill/antitox( src )
		new /obj/item/weapon/reagent_containers/pill/antitox( src )
		new /obj/item/weapon/reagent_containers/pill/antitox( src )

/obj/item/weapon/storage/pill_bottle/inaprovaline
	name = "bottle of inaprovaline pills"
	desc = "Contains pills used to stabilize patients."

	New()
		..()
		new /obj/item/weapon/reagent_containers/pill/inaprovaline( src )
		new /obj/item/weapon/reagent_containers/pill/inaprovaline( src )
		new /obj/item/weapon/reagent_containers/pill/inaprovaline( src )
		new /obj/item/weapon/reagent_containers/pill/inaprovaline( src )
		new /obj/item/weapon/reagent_containers/pill/inaprovaline( src )
		new /obj/item/weapon/reagent_containers/pill/inaprovaline( src )
		new /obj/item/weapon/reagent_containers/pill/inaprovaline( src )

/obj/item/weapon/storage/pill_bottle/stimulant
	name = "bottle of stimulant pills"
	desc = "Guaranteed to give you that extra burst of energy during a long shift!"

/obj/item/weapon/storage/pill_bottle/stimulant/New()
	..()
	new /obj/item/weapon/reagent_containers/pill/stimulant( src )
	new /obj/item/weapon/reagent_containers/pill/stimulant( src )
	new /obj/item/weapon/reagent_containers/pill/stimulant( src )
	new /obj/item/weapon/reagent_containers/pill/stimulant( src )
	new /obj/item/weapon/reagent_containers/pill/stimulant( src )

/obj/item/weapon/storage/pill_bottle/dice
	name = "dice bag"
	desc = "Contains all the luck you'll ever need."
	icon = 'icons/obj/dice.dmi'
	icon_state = "dicebag"

	New()
		..()
		new /obj/item/weapon/dice/d4( src )
		new /obj/item/weapon/dice( src )
		new /obj/item/weapon/dice/d8( src )
		new /obj/item/weapon/dice/d10( src )
		new /obj/item/weapon/dice/d00( src )
		new /obj/item/weapon/dice/d12( src )
		new /obj/item/weapon/dice/d20( src )

/obj/item/weapon/reagent_containers/pill/drug
	name = "unknown pill"
	desc = "You can't tell any of these apart!"
	icon_state = "drugs"

/obj/item/weapon/reagent_containers/pill/drug/New()
	..()
	var/type = rand(1, 10)
	switch(type)
		if(1)
			reagents.add_reagent("tricordrazine", 25)
			reagents.add_reagent("legecillin", 25)
		if(2)
			reagents.add_reagent("hallucinations", 50)
		if(3)
			reagents.add_reagent("meth", 50)
		if(4)
			reagents.add_reagent("lho", 50)
		if(5)
			reagents.add_reagent("morphine", 50)
		if(6)
			reagents.add_reagent("stimulant", 50)
		if(7)
			reagents.add_reagent("triumvirate", 50)
		if(8)
			reagents.add_reagent("strangle", 50)
		if(9)
			reagents.add_reagent("thujone", 50)
		if(10)
			reagents.add_reagent("plague", 50)

/obj/item/weapon/storage/pill_bottle/drug
	name = "dice bag"
	desc = "Contains all the luck you'll ever need."
	icon = 'icons/obj/dice.dmi'
	icon_state = "dicebag"

	New()
		..()
		new /obj/item/weapon/reagent_containers/pill/drug( src )
		new /obj/item/weapon/reagent_containers/pill/drug( src )
		new /obj/item/weapon/reagent_containers/pill/drug( src )
		new /obj/item/weapon/reagent_containers/pill/drug( src )
		new /obj/item/weapon/reagent_containers/pill/drug( src )
		new /obj/item/weapon/reagent_containers/pill/drug( src )
		new /obj/item/weapon/reagent_containers/pill/drug( src )

/obj/item/weapon/storage/firstaid/impguard
	name = "Medi-Pack"
	desc = "A pack of field medicine."
	icon_state = "medipack"

	New()
		..()
		if (empty) return
		new /obj/item/device/healthanalyzer(src)
		new /obj/item/weapon/reagent_containers/hypospray/stabilize( src )
		new /obj/item/weapon/reagent_containers/hypospray/stabilize( src )
		new /obj/item/weapon/reagent_containers/hypospray/stabilize( src )
		new /obj/item/weapon/reagent_containers/hypospray/stabilize( src )
		new /obj/item/weapon/reagent_containers/pill/bicaridine( src )
		new /obj/item/weapon/reagent_containers/pill/kelotane( src )
		return

/obj/item/weapon/storage/firstaid/advanced
	name = "Tactical Medi-Pack"
	desc = "A pack of field medicine."
	icon_state = "medipack"

	New()
		..()
		if (empty) return
		new /obj/item/device/healthanalyzer(src)
		new /obj/item/weapon/reagent_containers/syringe/epinephrine( src )
		new /obj/item/weapon/reagent_containers/pill/bicaridine( src )
		new /obj/item/weapon/reagent_containers/pill/bicaridine( src )
		new /obj/item/weapon/reagent_containers/pill/bicaridine( src )
		new /obj/item/weapon/reagent_containers/pill/dermaline( src )
		new /obj/item/weapon/reagent_containers/pill/dermaline( src )
		new /obj/item/weapon/reagent_containers/pill/dermaline( src )
		new /obj/item/weapon/reagent_containers/syringe/toxic_treatment( src )
		new /obj/item/weapon/reagent_containers/pill/stimulant( src )
		return