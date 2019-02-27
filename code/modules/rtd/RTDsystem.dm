/*
RTD system- Goosecode.
*/

var/list/availfaction = list("KRIEGER")
var/list/umlist = list()
var/list/pmlist = list()
var/list/salamanders = list()
var/list/kriegofficers = list()
var/list/tau = list()
var/list/eldar = list()
var/list/ravenguard = list()
var/list/tyranid = list()
var/list/stormtrooper = list()
var/list/ordohereticus = list()
var/list/sob = list()
var/list/ork = list()
var/list/ksons = list()
//leaders
var/list/smleader = list()
var/list/umleader = list()
var/list/pmleader = list()
var/list/krleader = list()
var/list/tauleader = list()
var/list/eldarleader = list()
var/list/ravenleader = list()
var/list/tyranidleader = list()
var/list/ohleader = list()
var/list/sobleader = list()
var/list/orkleader = list()
var/list/ksonsleader = list()
var/list/ohsleader = list()

/proc/load_rtd()							//This is load_rtd. It gets called from world.dm whenever a world/new happens.
	log_admin("Loading RTD lists")
	loadsmsave()
	loadumsave()
	loadpmsave()
	loadkrsave()
	loadtausave()
	loadeldarsave()
	loadrgsave()
	loadtyranidsave()
	loadohsave()
	loadsobsave()
	loadorksave()
	loadksonssave()
//leaders
	loadsmleader()
	loadumleader()
	loadpmleader()
	loadtauleader()
	loadeldarleader()
	loadrgleader()
	loadtyranidleader()
	loadohleader()
	loadohsleader()			//not implemented
	loadsobleader()
	loadorkleader()
	loadksonsleader()
	return 1


/*
It kicks these off.
*/


/proc/loadumsave()
	if(!fexists("data/rtd/umMember.sav"))
		log_admin("OMG Can't find umMember.sav!")
	var/savefile/umMember = new("data/rtd/umMember.sav")
	umMember>>umlist									//file to object, object to list
	return

/proc/loadksonssave()
	if(!fexists("data/rtd/ksonsMember.sav"))
		log_admin("OMG Can't find ksonsMember.sav!")
	var/savefile/ksonsMember = new("data/rtd/ksonsMember.sav")
	ksonsMember>>ksons
	return

/proc/loadpmsave()
	if(!fexists("data/rtd/pmMember.sav"))
		log_admin("OMG Can't find pmMember.sav!")
	var/savefile/pmMember = new("data/rtd/pmMember.sav")
	pmMember>>pmlist
	return

proc/loadsmsave()
	if(!fexists("data/rtd/smMember.sav"))
		log_admin("OMG Can't find smMember.sav!")
	var/savefile/smMember = new("data/rtd/smMember.sav")
	smMember>>salamanders
	return

proc/loadkrsave()
	if(!fexists("data/rtd/krMember.sav"))
		log_admin("OMG Can't find krMember.sav!")
	var/savefile/krMember = new("data/rtd/krMember.sav")
	krMember>>kriegofficers
	return

proc/loadtausave()
	if(!fexists("data/rtd/tauMember.sav"))
		log_admin("OMG Can't find tauMember.sav!")
	var/savefile/tauMember = new("data/rtd/tauMember.sav")
	tauMember>>tau
	return

proc/loadeldarsave()
	if(!fexists("data/rtd/eldarMember.sav"))
		log_admin("OMG Can't find eldarMember.sav!")
	var/savefile/eldarMember = new("data/rtd/eldarMember.sav")
	eldarMember>>eldar
	return

proc/loadrgsave()
	if(!fexists("data/rtd/rgMember.sav"))
		log_admin("OMG Can't find rgMember.sav!")
	var/savefile/rgMember = new("data/rtd/rgMember.sav")
	rgMember>>ravenguard
	return

proc/loadtyranidsave()
	if(!fexists("data/rtd/tyranidMember.sav"))
		log_admin("OMG Can't find tyranidMember.sav!")
	var/savefile/tyranidMember = new("data/rtd/tyranidMember.sav")
	tyranidMember>>tyranid
	return

proc/loadohsave()
	if(!fexists("data/rtd/ohMember.sav"))
		log_admin("OMG Can't find ohMember.sav!")
	var/savefile/ohMember = new("data/rtd/ohMember.sav")
	ohMember>>ordohereticus
	return

proc/loadohssave()
	if(!fexists("data/rtd/ohsMember.sav"))
		log_admin("OMG Can't find ohsMember.sav!")
	var/savefile/ohsMember = new("data/rtd/ohsMember.sav")
	ohsMember>>stormtrooper
	return

proc/loadsobsave()
	if(!fexists("data/rtd/sobMember.sav"))
		log_admin("OMG Can't find sobMember.sav!")
	var/savefile/sobMember = new("data/rtd/sobMember.sav")
	sobMember>>sob
	return

proc/loadorksave()
	if(!fexists("data/rtd/orkMember.sav"))
		log_admin("OMG Can't find orkMember.sav!")
	var/savefile/orkMember = new("data/rtd/orkMember.sav")
	orkMember>>ork
	return

//leaders

/proc/loadumleader()
	if(!fexists("data/rtd/umleader.sav"))
		log_admin("OMG Can't find umleader.sav!")
	var/savefile/umOVERSEER = new("data/rtd/umleader.sav")
	umOVERSEER>>umleader									//file to object, object to list
	return

/proc/loadksonsleader()
	if(!fexists("data/rtd/ksonsleader.sav"))
		log_admin("OMG Can't find ksonsleader.sav!")
	var/savefile/ksonsOVERSEER = new("data/rtd/ksonsleader.sav")
	ksonsOVERSEER>>ksonsleader
	return

/proc/loadpmleader()
	if(!fexists("data/rtd/pmleader.sav"))
		log_admin("OMG Can't find pmMember.sav!")
	var/savefile/pmOVERSEER = new("data/rtd/pmleader.sav")
	pmOVERSEER>>pmleader
	return

proc/loadsmleader()
	if(!fexists("data/rtd/smleader.sav"))
		log_admin("OMG Can't find smleader.sav!")
	var/savefile/smOVERSEER = new("data/rtd/smleader.sav")
	smOVERSEER>>smleader
	return

proc/loadtauleader()
	if(!fexists("data/rtd/tauleader.sav"))
		log_admin("OMG Can't find tauleader.sav!")
	var/savefile/tauOVERSEER = new("data/rtd/tauleader.sav")
	tauOVERSEER>>tauleader
	return

proc/loadeldarleader()
	if(!fexists("data/rtd/eldarleader.sav"))
		log_admin("OMG Can't find eldarleader.sav!")
	var/savefile/eldarOVERSEER = new("data/rtd/eldarleader.sav")
	eldarOVERSEER>>eldarleader
	return

proc/loadrgleader()
	if(!fexists("data/rtd/rgleader.sav"))
		log_admin("OMG Can't find rgleader.sav!")
	var/savefile/rgOVERSEER = new("data/rtd/rgleader.sav")
	rgOVERSEER>>ravenleader
	return

proc/loadtyranidleader()
	if(!fexists("data/rtd/tyranidleader.sav"))
		log_admin("OMG Can't find tyranidleader.sav!")
	var/savefile/tyranidOVERSEER = new("data/rtd/tyranidleader.sav")
	tyranidOVERSEER>>tyranidleader
	return

proc/loadohleader()
	if(!fexists("data/rtd/ohleader.sav"))
		log_admin("OMG Can't find ohleader.sav!")
	var/savefile/ohOVERSEER = new("data/rtd/ohleader.sav")
	ohOVERSEER>>ohleader
	return

proc/loadohsleader()
	if(!fexists("data/rtd/ohsleader.sav"))
		log_admin("OMG Can't find ohsleader.sav!")
	var/savefile/ohsOVERSEER = new("data/rtd/ohsleader.sav")
	ohsOVERSEER>>ohsleader
	return

proc/loadsobleader()
	if(!fexists("data/rtd/sobleader.sav"))
		log_admin("OMG Can't find sobleader.sav!")
	var/savefile/sobOVERSEER = new("data/rtd/sobleader.sav")
	sobOVERSEER>>sobleader
	return

proc/loadorkleader()
	if(!fexists("data/rtd/orkleader.sav"))
		log_admin("OMG Can't find orkleader.sav!")
	var/savefile/orkOVERSEER = new("data/rtd/orkleader.sav")
	orkOVERSEER>>orkleader
	return

