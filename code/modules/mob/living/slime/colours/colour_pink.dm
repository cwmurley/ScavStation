/decl/slime_colour/pink
	name = "pink"
	descendants = list(
		/decl/slime_colour/pink,
		/decl/slime_colour/pink,
		/decl/slime_colour/light_pink,
		/decl/slime_colour/light_pink
	)
	baby_icon =    'icons/mob/slimes/slime_baby_pink.dmi'
	adult_icon =   'icons/mob/slimes/slime_adult_pink.dmi'
	extract_icon = 'icons/mob/slimes/slime_extract_pink.dmi'
	reaction_strings = list(/decl/material/solid/metal/uranium ="Synthesises a potion that turns a baby slime into a docile pet.")

/decl/slime_colour/pink/handle_uranium_reaction(var/datum/reagents/holder)
	new /obj/item/slime_potion(get_turf(holder.my_atom))
	return TRUE
