/obj/item/weapon/reagent_containers/glass/bottle/vial
	name = "vial"
	desc = "A small designed for storing chemicals."
	icon = 'icons/obj/chemical.dmi'
	icon_state = null
	item_state = "guardsmanmedic_vial"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,25,30)
	flags = OPENCONTAINER
	volume = 80 //Somehow. Either way, medics need this amount, minimum - Pandolphina


/obj/item/weapon/reagent_containers/glass/bottle/vial/bicaridine
	name = "bicaridine vial"
	desc = "A small designed for storing chemicals. This one contains bicaridine, a medicine designed to treat damage from cuts and blunt force."


	New()
		..()
		reagents.add_reagent("bicaridine", 80)

/obj/item/weapon/reagent_containers/glass/bottle/vial/kelotane
	name = "kelotane vial"
	desc = "A small designed for storing chemicals. This one contains kelotane, a medicine designed to treat damage from fire and lasers."


	New()
		..()
		reagents.add_reagent("kelotane", 80)

/obj/item/weapon/reagent_containers/glass/bottle/vial/dylovene
	name = "dylovene vial"
	desc = "A small designed for storing chemicals. This one contains dylovene, a medicine designed to treat damage from poisons."


	New()
		..()
		reagents.add_reagent("dylovene", 80)


/obj/item/weapon/reagent_containers/glass/bottle/vial/inaprovaline
	name = "inaprovaline vial"
	desc = "A small designed for storing chemicals. This one contains inaprovaline, a medicine designed to regulate heart rate, slow bleeding and keep oxygen flowing ."


	New()
		..()
		reagents.add_reagent("inaprovaline", 80)


/obj/item/weapon/reagent_containers/glass/bottle/vial/tramadol
	name = "tramadol vial"
	desc = "A small designed for storing chemicals. This one contains inaprovaline, a medicine designed to act as a painkiller ."


	New()
		..()
		reagents.add_reagent("tramadol", 80)