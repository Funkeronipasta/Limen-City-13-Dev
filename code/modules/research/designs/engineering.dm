// Tools

/datum/design/item/tool/AssembleDesignName()
	..()
	name = "Experimental tool prototype ([item_name])"

/datum/design/item/tool/experimental_welder
	name = "Experimental welding tool"
	desc = "A welding tool that generates fuel for itself."
	id = "expwelder"
	req_tech = list(TECH_ENGINEERING = 4, TECH_PHORON = 3, TECH_MATERIAL = 4)
	materials = list(MAT_STEEL = 70, MAT_GLASS = 120, MAT_PHORON = 100)
	build_path = /obj/item/weldingtool/experimental
	sort_string = "NAAAA"

/datum/design/item/tool/hand_drill
	name = "Hand drill"
	desc = "A simple powered hand drill."
	id = "handdrill"
	req_tech = list(TECH_ENGINEERING = 3, TECH_MATERIAL = 2)
	materials = list(MAT_STEEL = 300, MAT_SILVER = 100)
	build_path = /obj/item/tool/screwdriver/power
	sort_string = "NAAAB"

/datum/design/item/tool/jaws_life
	name = "Jaws of life"
	desc = "A set of jaws of life, compressed through the magic of science."
	id = "jawslife"
	req_tech = list(TECH_ENGINEERING = 3, TECH_MATERIAL = 2)
	materials = list(MAT_STEEL = 300, MAT_SILVER = 100)
	build_path = /obj/item/tool/crowbar/power
	sort_string = "NAAAC"

/datum/design/item/tool/switchtool
	name = "Switchtool"
	desc = "A combined wirecutter, screwdriver, crowbar, wrench and multitool. The small size makes it somewhat slower at work."
	id = "switchtool"
	req_tech = list(TECH_ENGINEERING = 4, TECH_MATERIAL = 4)
	materials = list(MAT_STEEL = 4000, MAT_GLASS = 2000)
	build_path = /obj/item/switchtool
	sort_string = "NAAAD"

// Other devices

/datum/design/item/engineering/AssembleDesignName()
	..()
	name = "Engineering device prototype ([item_name])"

/datum/design/item/engineering/t_scanner
	name = "T-ray Scanner"
	desc = "A terahertz-ray emitter and scanner used to detect underfloor objects such as cables and pipes."
	id = "tscanner"
	req_tech = list(TECH_MAGNET = 2, TECH_ENGINEERING = 2, TECH_MATERIAL = 2)
	materials = list(MAT_STEEL = 200)
	build_path = /obj/item/t_scanner
	sort_string = "NBAAA"

/datum/design/item/engineering/t_scanner_upg
	name = "Upgraded T-ray Scanner"
	desc = "An upgraded version of the terahertz-ray emitter and scanner used to detect underfloor objects such as cables and pipes."
	id = "upgradedtscanner"
	req_tech = list(TECH_MAGNET = 3, TECH_ENGINEERING = 4, TECH_MATERIAL = 2)
	materials = list(MAT_STEEL = 500, MAT_PHORON = 150)
	build_path = /obj/item/t_scanner/upgraded
	sort_string = "NBAAB"

/datum/design/item/engineering/t_scanner_adv
	name = "Advanced T-ray Scanner"
	desc = "An advanced version of the terahertz-ray emitter and scanner used to detect underfloor objects such as cables and pipes."
	id = "advancedtscanner"
	req_tech = list(TECH_MAGNET = 6, TECH_ENGINEERING = 6, TECH_MATERIAL = 6)
	materials = list(MAT_STEEL = 1250, MAT_PHORON = 500, MAT_SILVER = 50)
	build_path = /obj/item/t_scanner/advanced
	sort_string = "NBAAC"

/datum/design/item/engineering/atmosanalyzer
	name = "Atmospheric Analyzer"
	desc = "A hand-held environmental scanner which reports current gas levels."
	id = "atmosanalyzer"
	req_tech = list(TECH_ENGINEERING = 2)
	materials = list(MAT_STEEL = 200, MAT_GLASS = 100)
	build_path = /obj/item/analyzer
	sort_string = "NBABA"

/datum/design/item/engineering/atmosanalyzerlongrange
	name = "Long Range Atmospheric Analyzer"
	desc = "A hand-held environmental scanner which reports current gas levels from a distance."
	id = "atmosanalyzerlr"
	req_tech = list(TECH_ENGINEERING = 4)
	materials = list(MAT_STEEL = 300, MAT_GLASS = 300)
	build_path = /obj/item/analyzer/longrange
	sort_string = "NBABB"
