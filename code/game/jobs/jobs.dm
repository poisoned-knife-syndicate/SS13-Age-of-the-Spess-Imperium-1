//The UI for the job menu is actually located in preferences_setup.dm
//This is a many segmented fucking mess, these are the FLAGS tied to the jobs in the individual files.
//The numbers determine what order they are in.


var/const/ENGSEC				=(1<<0)

var/const/GENERAL				=(1<<0)
var/const/COMMISSAR				=(1<<1)
var/const/IGGUARDSERGEANT		=(1<<2)
var/const/ENFORCER				=(1<<3)
var/const/IGGUARDSMAN			=(1<<4)
var/const/MAGOS					=(1<<5)
var/const/EXPLORATOR			=(1<<6)
var/const/ATMOSTECH				=(1<<7)
var/const/CYBERNETICAACOLYTE	=(1<<8)
var/const/AI					=(1<<9)
var/const/SERVITOR				=(1<<10)
var/const/UGOOSE				=(1<<11)
var/const/IGMEDIC 				=(1<<12)

var/const/MEDSCI				=(1<<1)

var/const/INQORDOSXENOS			=(1<<0)
var/const/SCIENTIST				=(1<<1)
var/const/PHARMACOLOGIST		=(1<<2)
var/const/SISTERHOSPITALLER		=(1<<3)
var/const/TRAUMAMEDICUS			=(1<<4)
var/const/GENETICIST			=(1<<5)
var/const/VIROLOGIST			=(1<<6)


var/const/CIVILIAN				=(1<<2)

var/const/SENESCHAL				=(1<<0)
var/const/BARTENDER				=(1<<1)
var/const/BOTANIST				=(1<<2)
var/const/CHEF					=(1<<3)
var/const/JANITOR				=(1<<4)
var/const/LIBRARIAN				=(1<<5)
var/const/QUARTERMASTER			=(1<<6)
var/const/CARGOTECH				=(1<<7)
var/const/MINER					=(1<<8)
var/const/INQUISITOR			=(1<<9)
var/const/PREACHER				=(1<<10)
var/const/CELEBRITY				=(1<<11)
var/const/MIME					=(1<<12)
var/const/ASSISTANT				=(1<<13)
var/const/ELDARSPY				=(1<<14)
var/const/GRETCHIN	=(1<<15)

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
