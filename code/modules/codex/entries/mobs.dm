/datum/codex_entry/maint_drone
	display_name = "maintenance drone"
	associated_paths = list(/mob/living/silicon/robot/drone)
	mechanics_text = "Drones are player-controlled synthetics which are lawed to maintain their assigned vessel and not \
	interfere with anyone else, except for other drones. They hold a wide array of tools to build, repair, maintain, and clean. \
	They function similarly to other synthetics, in that they require recharging regularly, have laws, and are resilient to many hazards, \
	such as fire, radiation, vacuum, and more. Ghosts can join the round as a maintenance drone by using the appropriate verb in the 'ghost' tab. \
	An inactive drone can be rebooted by swiping an ID card on it with engineering or robotics access, and an active drone can be shut down in the same manner. \
	Maintenance drone presence can be requested to specific areas from any maintenance drone control console."
	antag_text = "A crypotgraphic sequencer, available via a traitor uplink, can be used to subvert the drone to your cause."

/datum/codex_entry/uncertified_module
	associated_paths = list(/obj/item/borg/upgrade/uncertified)
	mechanics_text = "This special chip will forcibly change a robot's module to a new one. In most cases, this is the only way for the robot to obtain these modules. Once you've unlocked the robot's maintenance hatch with an ID card and opened it with a crowbar, click the bot to install this chip."
	lore_text = "No TSC, industrial concern, or military organization worth their salt would dare install uncertified hardware on their robotic platforms. Nevertheless, in backwater sectors of the universe, there is a thriving grey market for third-party modular configurations such as this one."

/datum/codex_entry/slimes
	associated_paths = list(
		/mob/living/slime,
		/obj/machinery/smartfridge/secure/extract,
		/obj/item/slime_extract
	)
	lore_text = "The strange, hydrophobic, single-celled organisms called 'slimes' are frequently the focus of xenobiological science, due to their fascinating internal chemistry and their incredible hardiness. However, they are frequently underestimated or mishandled, and slime-related genetic decay is a leading cause of death for xenoscientists."
	mechanics_text = "Slimes will happily feed on any human, humanoid or monkey that wanders into their sight. You can wrestle them off their victim or spray them with a fire extinguisher to neutralize them. If a slime is well-fed, it might grow into an adult, and then split into up to four baby slimes of various colours, depending on the colour of the parent.<br><br>Slime cores can have a variety of effects when injected with either blood or uranium powder. For more information on slime xenobiology, consult the <span codexlink='Guide to Slime Handling'>guide</span>."

/datum/codex_entry/slime_handling
	display_name = "Guide to Slime Handling"
	mechanics_text = {"
		<h2>The Basics</h2>
		<p>Slimes are strange creatures reared for their valuable extracts. They feed by engulfing their prey and degrading them at the cellular level, eventually dissolving them entirely. A hungry slime can  be fended off with water, usually from a fire extinguisher; don't bother trying to use weapons or firearms on a being made of semiliquid goo. You can wrestle a slime off its prey, including yourself, by clicking on it with disarm, harm or grab intent.</p>
		<h2>Slime Breeding</h2>
		<p>When a baby slime is well-fed enough, it will mature into an adult; adults are much larger, <i>much</i> more dangerous, and capable of reproducing by splitting into four smaller slimes. Each of the children has a chance of mutating into a different colour, with different effects associated with their extracts. See the table at the bottom of this guide for a list of parent and child colours.</p>
		<h2>Extracts and Reactions</h2>
		<p>If you cull a baby slime, either by water or starvation, you can then drag it over to the operating table and use a scalpel and saw to remove the slime cores inside. These cores can be injected with ground-up uranium (use the reagent grinder in your lab), or blood (either your own or from a donor), to evoke strange and powerful effects. Consult the bottom of this guide for details on extract reactions.</p>
		<h2>Friendship</h2>
		<p>Slimes are intelligent, social creatures, even if they don't look like it. Physical affection (click a slime on help intent) will start an enduring friendship that will last until you attack the slime, or it gets hungry enough to see you as food. Saying hello to a friendly slime will also make them regard you more fondly. Slimes that regard you well enough may even listen to commands like 'stop', 'stay' or 'follow'.</p>
	"}

/datum/codex_entry/slime_handling/New(_display_name, list/_associated_paths, list/_associated_strings, _lore_text, _mechanics_text, _antag_text)
	. = ..()
	var/list/extra_mechanics_text = list()
	extra_mechanics_text += "<h2>Slime colours</h2><br><table border = '1px'>"
	extra_mechanics_text += "<tr><td><b>Colour</b></td><td><b>Ancestors</b></td><td><b>Descendants</b></td><td>Reactions</td></tr>"
	var/list/slime_colours = decls_repository.get_decls_of_subtype(/decl/slime_colour)
	for(var/slime_type in slime_colours)
		var/decl/slime_colour/slime_data = slime_colours[slime_type]
		var/list/child_colours = list(slime_data.name)
		for(var/child_type in slime_data.descendants)
			var/decl/slime_colour/child_colour = decls_repository.get_decl(child_type)
			child_colours |= child_colour.name
		var/list/ancestors = list(slime_data.name)
		for(var/ancestor_type in slime_colours)
			var/decl/slime_colour/ancestor_data = slime_colours[ancestor_type]
			if(slime_type in ancestor_data.descendants)
				ancestors |= ancestor_data.name
		extra_mechanics_text += "<tr><td>[capitalize(slime_data.name)]</td><td>[jointext(ancestors, ", ")]</td><td>[jointext(child_colours, ", ")]</td><td>"
		var/list/reagent_strings = list()
		for(var/reagent_id in slime_data.reaction_strings)
			var/decl/material/mat = decls_repository.get_decl(reagent_id)
			reagent_strings += "<b><span codexlink='[mat.name] (substance)'>[capitalize(mat.name)]</span></b>- [slime_data.reaction_strings[reagent_id]]"
		extra_mechanics_text += "[length(reagent_strings) ? jointext(reagent_strings, "<br>") : "None."]</td></tr>"
	mechanics_text = "[mechanics_text]<br>[jointext(extra_mechanics_text, "")]"
