/datum/equipment_preset/twe
	name = "Three World Empire"
	faction = FACTION_TWE
	faction_group = list(FACTION_TWE, FACTION_MARINE)
	languages = list(LANGUAGE_ENGLISH, LANGUAGE_JAPANESE)
	minimap_background = "background_twe"

/datum/equipment_preset/twe/royal_expeditionary/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick_weight(list(MALE = 80, FEMALE = 20,))
	var/datum/preferences/placeholder_pref = new()
	placeholder_pref.randomize_appearance(new_human)
	var/random_name
	var/static/list/colors = list("BLACK" = list(15, 15, 25), "BROWN" = list(102, 51, 0), "AUBURN" = list(139, 62, 19))
	var/static/list/hair_colors = colors.Copy() + list("BLONDE" = list(197, 164, 30), "CARROT" = list(174, 69, 42))
	var/hair_color = pick(hair_colors)
	new_human.r_hair = hair_colors[hair_color][1]
	new_human.g_hair = hair_colors[hair_color][2]
	new_human.b_hair = hair_colors[hair_color][3]
	new_human.r_facial = hair_colors[hair_color][1]
	new_human.g_facial = hair_colors[hair_color][2]
	new_human.b_facial = hair_colors[hair_color][3]
	var/eye_color = pick(colors)
	new_human.r_eyes = colors[eye_color][1]
	new_human.g_eyes = colors[eye_color][2]
	new_human.b_eyes = colors[eye_color][3]
	idtype = /obj/item/card/id/dogtag
	if(new_human.gender == MALE)
		random_name = "[pick(GLOB.first_names_male)] [pick(GLOB.last_names)]"
		new_human.h_style = pick("Crewcut", "Shaved Head", "Buzzcut", "Undercut", "Side Undercut", "Pvt. Joker", "Marine Fade", "Low Fade", "Medium Fade", "High Fade", "No Fade", "Coffee House Cut", "Flat Top",)
		new_human.f_style = pick("5 O'clock Shadow", "Shaved", "Full Beard", "3 O'clock Moustache", "5 O'clock Shadow", "5 O'clock Moustache", "7 O'clock Shadow", "7 O'clock Moustache",)
	else
		random_name = "[pick(GLOB.first_names_female)] [pick(GLOB.last_names)]"
		new_human.h_style = pick("Ponytail 1", "Ponytail 2", "Ponytail 3", "Ponytail 4", "Pvt. Redding", "Pvt. Clarison", "Cpl. Dietrich", "Pvt. Vasquez", "Marine Bun", "Marine Bun 2", "Marine Flat Top",)
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,45)
	new_human.r_hair = rand(15,35)
	new_human.g_hair = rand(15,35)
	new_human.b_hair = rand(25,45)

/datum/equipment_preset/twe/royal_expeditionary/load_id(mob/living/carbon/human/new_human, client/mob_client)
	if(human_versus_human)
		var/obj/item/clothing/under/uniform = new_human.w_uniform
		if(istype(uniform))
			uniform.has_sensor = UNIFORM_HAS_SENSORS
	return ..()

//*****************************************************************************************************/

/datum/equipment_preset/twe/royal_expeditionary
	name = "Royal Expeditionary Group Team Member"
	assignment = "Doctor"
	rank = JOB_TWE_REG_DOCTOR
	var/human_versus_human = FALSE
	///Gives the Royal Marines their radios
	var/headset_type = /obj/item/device/radio/headset/distress/royal_marine
	idtype = /obj/item/card/id/silver/clearance_badge/scientist

// ***************************************************************************************************/scientist

/datum/equipment_preset/twe/royal_expeditionary/standard
	name = "TWE Royal Marine Commando (Rifleman)"
	paygrades = list(PAY_SHORT_CDOC = JOB_PLAYTIME_TIER_0)
	role_comm_title = "REG"
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Royal Expeditionary"
	rank = JOB_TWE_REG_DOCTOR

	minimap_icon = "reg_researcher"

	skills = /datum/skills/rmc
