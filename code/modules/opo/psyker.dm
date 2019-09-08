//change human var psyker = 0 to psyker = 1 for psykery magic
	/obj/effect/proc_holder/spell/targeted/emperorword
	name = "Word of The Emperor"
	desc = "You invoke the God Emperor, smiting a target with His wrath."
	charge_type = "recharge"
	charge_max = 150
	charge_counter = 0
	clothes_req = 0
	stat_allowed = 0
	invocation = "BURN, HERETIC!"
	invocation_type = "shout"
	range = 7
	cooldown = 90
	selection_type = "range"
	if(seer == 0)
		return

	var/smoke_spread =1
	var/smoke_amt = 2

	var/ex_severe = 1
	var/ex_heavy = 1
	var/ex_light = 1
	var/ex_flash = 1

/obj/effect/proc_holder/spell/targeted/emperorword/cast(list/targets)

	for(var/mob/living/target in targets)
		explosion(target.loc,ex_severe,ex_heavy,ex_light,ex_flash)

	return

/obj/effect/proc_holder/spell/targeted/projectile/doombolt
	name = "Doombolt"
	desc = "This spell fires several, slow moving, magic projectiles at nearby targets."

	school = "evocation"
	charge_max = 150
	clothes_req = 1
	invocation = "I AM POWER!"
	invocation_type = "shout"
	range = 7
	cooldown_min = 90 //15 deciseconds reduction per rank

	max_targets = 0

	proj_icon_state = "magicm"
	proj_name = "a doombolt"
	proj_lingering = 1
	proj_type = "/obj/effect/proc_holder/spell/targeted/inflict_handler/doombolt"

	proj_lifespan = 20
	proj_step_delay = 5

	proj_trail = 1
	proj_trail_lifespan = 5
	proj_trail_icon_state = "magicmd"