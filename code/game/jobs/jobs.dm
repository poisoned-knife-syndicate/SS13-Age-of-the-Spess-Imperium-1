//The UI for the job menu is actually located in preferences_setup.dm
//This is a many segmented fucking mess, these are the FLAGS tied to the jobs in the individual files.
//The numbers determine some shit or another.


var/const/ENGSEC				=(1<<0)

var/const/GENERAL				=(1<<0) //landmark done
var/const/COMMISSAR				=(1<<1) //landmark done
var/const/IGGUARDSERGEANT		=(1<<2) //landmark done
var/const/KASRKIN  			    =(1<<3) //landmark done
var/const/IGGUARDSMAN			=(1<<4) //landmark done
var/const/MAGOS					=(1<<5) //landmark done
var/const/EXPLORATOR			=(1<<6) //landmark done
var/const/ATMOSTECH				=(1<<7) //landmark done
var/const/CYBERNETICAACOLYTE	=(1<<8) //landmark done
var/const/AI					=(1<<9) //landmark done
var/const/SERVITOR				=(1<<10) //landmark done
var/const/UGOOSE				=(1<<11) //landmark done
var/const/IGMEDIC 				=(1<<12) //landmark done

var/const/MEDSCI				=(1<<1)

var/const/INQORDOSXENOS			=(1<<0) //landmark done
var/const/SISTERHOSPITALLER		=(1<<3) //landmark done
var/const/TRAUMAMEDICUS			=(1<<4) //landmark done

var/const/CIVILIAN				=(1<<2)

var/const/SENESCHAL				=(1<<0) //landmark done
var/const/BARTENDER				=(1<<1) //landmark done
var/const/BOTANIST				=(1<<2) //landmark done
var/const/CHEF					=(1<<3) //landmark done
var/const/JANITOR				=(1<<4) //landmark done
var/const/LIBRARIAN				=(1<<5) //landmark done
var/const/QUARTERMASTER			=(1<<6) //landmark done
var/const/CARGOTECH				=(1<<7) //landmark done
var/const/MINER					=(1<<8) //landmark done
var/const/INQUISITOR			=(1<<9) //landmark done
var/const/PREACHER				=(1<<10) //landmark done
var/const/CELEBRITY				=(1<<11) //landmark done
var/const/MIME					=(1<<12) //landmark done
var/const/ASSISTANT				=(1<<13) //landmark done
var/const/ELDARSPY				=(1<<14) //landmark done
var/const/GRETCHIN				=(1<<15) //landmark done

var/list/assistant_occupations = list(
	"Assistant",
	"Atmospheric Technician",
	"Cargo Technician",
	"Preacher",
	"Lawyer",
	"Librarian"
)


var/list/command_positions = list(
	"Lord General",
	"Seneschal",
	"Lord Inquisitor, Ordo Xenos",
	"Sister Hospitaller",
	"Magos",
	"Inquisitor",
	"Commissar"
)


var/list/engineering_positions = list(
	"Magos",
	"Tech Priest",
	"Atmospheric Technician",
)


var/list/medical_positions = list(
	"Chief Medical Officer",
	"Medical Doctor",
	"Geneticist",	//Part of both medical and science
	"Virologist",
	"Chemist"
)


var/list/science_positions = list(
	"Lord Inquisitor, Ordo Xenos",
	"Scientist",
	"Geneticist",	//Part of both medical and science
	"Roboticist"
)


var/list/civilian_positions = list(
	"Seneschal",
	"Bartender",
	"Botanist",
	"Chef",
	"Janitor",
	"Librarian",
	"Quartermaster",
	"Cargo Technician",
	"Shaft Miner",
	"Inquisitor",
	"Chaplain",
	"Celebrity",
	"Mime",
	"Assistant",
	"Eldar Spy",
	"Gretchin"
)


var/list/security_positions = list(
	"Comissar",
	"Sergeant",
	"Enforcer",
	"Imperial Guardsman",
	"Imperial Guardsman Medic"
)


var/list/nonhuman_positions = list(
	"AI",
	"Cyborg",
	"Undercover Goose",
	"pAI"
)


/proc/guest_jobbans(var/job)
	return ((job in command_positions) || (job in nonhuman_positions) || (job in security_positions))
