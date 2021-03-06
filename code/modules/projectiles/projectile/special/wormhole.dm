/obj/item/projectile/beam/wormhole
	name = "bluespace beam"
	icon_state = "spark"
	hitsound = "sparks"
	nodamage = TRUE
	pass_flags = PASSGLASS | PASSTABLE | PASSGRILLE | PASSMOB
	var/obj/item/gun/energy/wormhole_projector/gun
	color = "#33CCFF"
	tracer_type = /obj/effect/projectile/tracer/wormhole
	impact_type = /obj/effect/projectile/impact/wormhole
	muzzle_type = /obj/effect/projectile/muzzle/wormhole

/obj/item/projectile/beam/wormhole/orange
	name = "orange bluespace beam"
	color = "#FF6600"

/obj/item/projectile/beam/wormhole/Initialize(mapload, obj/item/ammo_casing/energy/wormhole/casing)
	. = ..()
	if(casing)
		gun = casing.gun

/obj/item/projectile/beam/wormhole/on_hit(atom/target)
	if(!gun)
		qdel(src)
	gun.create_portal(src, get_turf(src))
