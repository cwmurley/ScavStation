/decl/loadout_option/head/baxxid_hood
	name = "baxxid hood"
	path = /obj/item/clothing/head/baxxid/hood/long
	flags = GEAR_HAS_COLOR_SELECTION

/decl/loadout_option/head/baxxid_wig
	name = "baxxid wig"
	path = /obj/item/clothing/head/baxxid/big_wig
	description = "A large blonde wig"

/obj/item/clothing/head/baxxid
	name = "baxxid head clothing"
	desc = "A parent item for stuff you put on top of a baxxid."
	bodytype_equip_flags = BODY_FLAG_BAXXID
	icon_state = ICON_STATE_WORLD

/obj/item/clothing/head/baxxid/hood
	name = "short baxxid hood"
	desc = "A large piece of cloth with holes in it, designed to be worn by baxxid."
	icon = 'mods/valsalia/icons/clothing/head/hood_short_baxxid.dmi'
	var/apply_trim = FALSE

/obj/item/clothing/head/baxxid/hood/long
	name = "baxxid hood"
	icon = 'mods/valsalia/icons/clothing/head/hood_long_baxxid.dmi'
	color = COLOR_PURPLE
	apply_trim = TRUE

/obj/item/clothing/head/baxxid/hood/long/on_update_icon()
	. = ..()
	if(apply_trim)
		var/image/I = image(icon, "[get_world_inventory_state()]-trim")
		I.appearance_flags |= RESET_COLOR
		overlays = list(I)

/obj/item/clothing/head/baxxid/hood/long/adjust_mob_overlay(mob/living/user_mob, bodytype, image/overlay, slot, bodypart)
	. = ..()
	if(overlay && slot == slot_head_str && apply_trim)
		var/image/I = image(overlay.icon, "[overlay.icon_state]-trim")
		I.appearance_flags |= RESET_COLOR
		overlay.overlays = list(overlay)
	return overlay

/obj/item/clothing/head/baxxid/big_wig
	name = "big wig"
	desc = "A really cool wig, which is unfortunately too large for a regular human."
	icon = 'mods/valsalia/icons/clothing/head/wig_big_blonde.dmi'
