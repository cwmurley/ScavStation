/decl/slime_colour/pyrite
	name = "pyrite"
	baby_icon =    'icons/mob/slimes/slime_baby_pyrite.dmi'
	adult_icon =   'icons/mob/slimes/slime_adult_pyrite.dmi'
	extract_icon = 'icons/mob/slimes/slime_extract_pyrite.dmi'
	reaction_strings = list(/decl/material/solid/metal/uranium = "Synthesises a random bucket of paint.")

/decl/slime_colour/pyrite/handle_uranium_reaction(var/datum/reagents/holder)
	new /obj/item/chems/glass/paint/random(get_turf(holder.my_atom))
	return TRUE
