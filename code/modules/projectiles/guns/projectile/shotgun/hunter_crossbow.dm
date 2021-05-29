/obj/item/weapon/gun/projectile/shotgun/pump/hunter_crossbow
	name = "bolt lance"
	desc = "A modified crossbow powered by an internal battery device that rapidly winds up a hydraulic winch to deliver a devastating, superheated bolt shot. \
	Hand-crafted by the local Hunting Lodge, it uses a design commonly found on Onkarth, the homeworld of the Sablekyne."
	icon = 'icons/obj/guns/projectile/hunter_crossbow.dmi'
	icon_state = "hunter_crossbow"
	item_state = "hunter_crossbow"
	fire_sound = 'sound/weapons/guns/fire/hydra_crossbow_fire.ogg' // TODO: Decent THWOK noise.
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 7
	caliber = CAL_CROSSBOW
	damage_multiplier = 1
	ammo_type = /obj/item/ammo_casing/crossbow_bolts
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 6)
	price_tag = 750
	recoil_buildup = 1
	one_hand_penalty = 14
	saw_off = FALSE
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SCOPE)
	pumpshotgun_sound = 'sound/weapons/guns/interact/hydra_crossbow_load.ogg'

/obj/item/weapon/gun/projectile/handle_post_fire()
	..()
	to_chat(usr, SPAN_WARNING("The bolt inside heats up to a dull red glow before being fired."))

/obj/item/weapon/gun/projectile/shotgun/pump/hunter_crossbow/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (chambered)
		iconstring += "-drawn_extra"
		itemstring += "-drawn_extra"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/shotgun/pump/hunter_crossbow/Initialize()
	. = ..()
	update_icon()
