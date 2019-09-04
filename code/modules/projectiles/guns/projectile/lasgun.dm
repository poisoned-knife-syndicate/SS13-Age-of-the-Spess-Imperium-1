/*
LASGUNS
*/

//Lasguns

/obj/item/weapon/gun/projectile/automatic/lasgun
	name = "M-Galaxy Pattern Lasgun"
	desc = "Standard issue ranged weapon given to Guardsmen of the Imperial Guard,now with a bayonet."
	icon_state = "lasgun"
	item_state = "lasgun"
	slot_flags = SLOT_BACK
	origin_tech = "combat=5;materials=1;syndicate=2"
	mag_type = /obj/item/ammo_box/magazine/lasgunmag
	fire_sound = 'sound/weapons/lasgun.ogg'
	scoped = 0
	chainb = 0
	canscope = 0
	zoom = 0
	canattach = 0
	scopetype = 0
	ejectcasing = 0 //Technically energy based! None of that!
	force = 10.0
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")

/obj/item/weapon/gun/projectile/automatic/lasgun/process_chamber(var/eject_casing = 0, var/empty_chamber = 1)    //be afraid of my skill
	..()

/*
Adding a lascannon here because I would rather not make a new file for a simple additional las-weapon.
*/

/obj/item/weapon/gun/projectile/automatic/lascannon
	name = "Las-Cannon"
	desc = "A heavy las-weapon that is particularly effective against armored opponents."
	icon_state = "lascannon"
	item_state = "lascannon"
	origin_tech = "combat=7;materials=3;syndicate=2"
	mag_type = /obj/item/ammo_box/magazine/lascannonmag
	fire_sound = 'sound/weapons/lasgun.ogg'
	ejectcasing = 0 //Technically energy based! None of that!


/obj/item/weapon/gun/projectile/automatic/lasgun/kantrael
	name = "Kantrael Pattern Laspistol"
	desc = "A variant of the classic Lasgun primarily given to support roles within the Imperial Guard."
	icon_state = "kantrael"
	item_state = "kantrael"
	w_class = 3.0
	origin_tech = "combat=5;materials=1;syndicate=2"
	mag_type = /obj/item/ammo_box/magazine/lasgunmagpistol
	fire_sound = 'sound/weapons/lasgun.ogg'

