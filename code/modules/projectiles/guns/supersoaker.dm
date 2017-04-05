/*Thanks to Time-Green for writing a LOT of this*/


/obj/item/weapon/gun/magic/watergun
	icon = 'icons/obj/guns/magic.dmi'
	name = "H.O.N.K soaker 5000"
	desc = "A water gun using hyper advanced clown planet technology to fire any  up to 30 meters away!"
	ammo_type = /obj/item/ammo_casing/magic/watergun
	icon_state = "soaker"


/obj/item/weapon/gun/magic/watergun/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/weapon/reagent_containers))
		reagents += I.reagents



//obj/item/weapon/gun/magic/watergun/examine()
//if(reagents.len)
//	desc = "A water gun using hyper advanced clown planet technology to fire water up to 30 meters away! There's"
//	for(var/a in src.reagents)
//		for(var/b in src.reagents[a])
//			desc += ",[b] units of [a] inside the tank"
//			return
//	desc += "."


/obj/item/ammo_casing/magic/watergun
	name = "water round"
	projectile_type = /obj/item/projectile/water_proj
	caliber = "hook"
	icon_state = "hook"

/obj/item/projectile/water_proj
	name = "water"
	damage = 0
	armour_penetration = 0
	damage_type = BRUTE
	var/water
	var/obj/effect/particle_effect/water/sploosh = /obj/effect/particle_effect/water

/obj/item/ammo_casing/magic/watergun/ready_proj(atom/target, mob/living/user, quiet, zone_override = "")
	..()
	var/obj/item/projectile/water_proj/WP = BB
	spawn(1)
		WP.water = WP.Beam(user,icon_state="waterbeam",icon = 'icons/effects/beam.dmi',time=30, maxdistance = 30)

/obj/item/projectile/water_proj/on_hit(atom/target)
	. = ..()
	new sploosh(get_turf(target))
	chem_splash(get_turf(target), 2,src.reagents)
	qdel(water)



