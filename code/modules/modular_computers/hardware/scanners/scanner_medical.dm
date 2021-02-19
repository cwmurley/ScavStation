/obj/item/stock_parts/computer/scanner/medical
	name = "medical scanner module"
	desc = "A medical scanner module. It can be used to scan patients and display medical information."
	material = /decl/material/solid/metal/steel
	matter = list(/decl/material/solid/glass = MATTER_AMOUNT_REINFORCEMENT)

/obj/item/stock_parts/computer/scanner/medical/do_on_afterattack(mob/user, atom/target, proximity)
	if(!can_use_scanner(user, target, proximity))
		return

	var/dat = medical_scan_action(target, user, loc, 1)

	if(dat && driver && driver.using_scanner)
		driver.data_buffer = html2pencode(dat)
		SSnano.update_uis(driver.NM)
