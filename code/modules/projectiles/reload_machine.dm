//ARE YOU READY FOR SOME SPAGHETTI-CODE? - Pandolphina

/obj/machinery/lasloader
	name = "lasgun recharge"
	desc = "A specialized machine designed to recharge lasgun magazines."
	icon_state = "autolathe"
	density = 1
	use_power = 0



/obj/machinery/lasloader/attackby(obj/item/O, mob/user)
	if(istype(O ,/obj/item/ammo_box/magazine/lasgunmagpistol))
		qdel(O)
		sleep(6)
		new /obj/item/ammo_box/magazine/lasgunmagpistol(src)
	if(istype(O ,/obj/item/ammo_box/magazine/lasgunmag))
		qdel(O)
		sleep(10)
		new /obj/item/ammo_box/magazine/lasgunmag(src)

