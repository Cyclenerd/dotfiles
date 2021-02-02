#Persistent  ; Keep the script running until the user exits it.
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2 ; A window's title can contain WinTitle anywhere inside it to be a match.

; Config
varSu01Name := "FU_BAR"
varRootCa := "C:\temp\RootCa.cer"
varCompanyCa := "C:\temp\CompanyCa.cer"
varUniversalIssuingCa := "C:\temp\UniversalIssuingCa.cer"

; Overwrite default config
IfExist, %A_ScriptDir%\RunSAP_Config.ahk
	#Include %A_ScriptDir%\RunSAP_Config.ahk

; Tcodes menu
Menu, Tcodes, Add, AL08 : System-Wide List of User Sessions, StartGuiTcode
Menu, Tcodes, Add, SU01 : User Maintenance, StartGuiTcode
Menu, Tcodes, Add, STRUST : Trust Manager, StartGuiTcode
Menu, Tcodes, Add, SMT1 : Trusting Connection, StartGuiTcode
Menu, Tcodes, Add, STZAC : System Time Zone, StartGuiTcode

; Custom menu
Menu, Tray, NoStandard
Menu, Tray, Tip, RunSAP
Menu, Tray, Add, Tcodes, :Tcodes
Menu, Tray, Add ; separator
Menu, Tray, Add, 000 - %varSu01Name%, Login000Me
Menu, Tray, Add, SU01 - %varSu01Name%, Su01Me
Menu, Tray, Add ; separator
Menu, Tray, Add, STRUST - Add OTTO Root CA, StrustAddOttoCa
Menu, Tray, Add, STRUST - Export OTTO Root CA to Database, StrustExportOttoCaDb
Menu, Tray, Add ; separator
Menu, Tray, Add, SICF - Activate Services, SicfActivate
Menu, Tray, Add ; separator
Menu, Tray, Add, GUI - Import Favorites, GuiFavorites
Menu, Tray, Add, GUI - Easy Access - Settings, EasyAccessSettings
Menu, Tray, Add, STMS - Import Queue - Personal Settings, StmsSettings
Menu, Tray, Add, SCC4 - Change Clients, Scc4Change
Menu, Tray, Add, STZAC - Change System Time Zone to CET, StzacCET
Menu, Tray, Add, TZCUSTHELP - Check Time Zone Setting, CheckTimeZone
Menu, Tray, Add ; separator
Menu, Tray, Add, Exit, ExitScript

; Custom icon
I_Icon = %A_ScriptDir%\runsap.ico
IfExist, %I_Icon%
    Menu, Tray, Icon, %I_Icon%
Return

; SAP GUI Keyboard
; https://help.sap.com/saphelp_nwmobile711/helpdata/en/27/7049cf0d224690a1019de9c28d4926/frameset.htm

ExitScript:
	ExitApp

Login000Me:
	if WinExist("ahk_class SAP_FRONTEND_SESSION") {
		WinActivate
		ToolTip, 🔑 RunSAP: Login to Client 000
		Send, +{tab} ; [Shift]+[Tab]
		Sleep, 100
		Send, 000{Enter}
		Sleep, 100
		Send, %varSu01Name%{Enter}
		Sleep, 100
		ToolTip
		Return
	} else {
		MsgBox, 0, ❓ SAP GUI, SAP GUI note open, 5
		Return
	}

Su01Me:
	if WinExist("ahk_class SAP_FRONTEND_SESSION") {
		WinActivate
		startTcode("su01")
		Send, %varSu01Name%{Enter}
		Sleep, 400
		Send, +{F6} ; [Shift]+[F6]
		ToolTip
		Return
	} else {
		MsgBox, 0, ❓ SAP GUI, SAP GUI note open, 5
		Return
	}

GuiFavorites:
	if WinExist("ahk_class SAP_FRONTEND_SESSION") {
		WinActivate
		startTcode("_")
		Send, !f
		Send, u
		Return
	} else {
		MsgBox, 0, ❓ SAP GUI, SAP GUI note open, 5
		Return
	}

EasyAccessSettings:
	if WinExist("ahk_class SAP_FRONTEND_SESSION") {
		WinActivate
		startTcode("_")
		Send, +{F9} ; [Shift]+[F9]
		Return
	} else {
		MsgBox, 0, ❓ SAP GUI, SAP GUI note open, 5
		Return
	}

StmsSettings:
	if WinExist("ahk_class SAP_FRONTEND_SESSION") and WinExist("Import Queue: System") {
		WinActivate
		Sleep, 200
		Send, ^+{F12} ; [Crtl]+[Shift]+[F12]
		Return
	} else {
		MsgBox, 0, ❓ SAP GUI, SAP GUI with Tcode STMS in import queue not open (Import Queue: System), 5
		Return
	}

Scc4Change:
	if WinExist("ahk_class SAP_FRONTEND_SESSION") {
		WinActivate
		startTcode("SCC4")
		Sleep, 400
		; Change
		Send, ^{F1} ; [Crtl]+[F1]
		; Pop-up
		Sleep, 400
		Send, {Enter}
		Return
	} else {
		MsgBox, 0, ❓ SAP GUI, SAP GUI with Tcode STMS in import queue not open (Import Queue: System), 5
		Return
	}

StrustAddOttoCa:
	if WinExist("ahk_class SAP_FRONTEND_SESSION") and WinExist("Trust Manager: Change") {
		WinActivate

		strustUploadCa(varRootCa)
		strustAddCaToList()
		strustUploadCa(varCompanyCa)
		strustAddCaToList()
		strustUploadCa(varUniversalIssuingCa)
		strustAddCaToList()

		; Save
		ToolTip, 💡 RunSAP: Save... Please wait..!
		Sleep, 400
		Send, ^s ; [Crtl]+[S]

		; Remove ToolTip
		ToolTip
		Return
	} else {
		MsgBox, 0, ❓ SAP GUI, SAP GUI with Tcode STRUST in change mode not open (Trust Manager: Change), 5
		Return
	}

StrustExportOttoCaDb:
	if WinExist("ahk_class SAP_FRONTEND_SESSION") {
		WinActivate

		startStrust()
		strustUploadCa(varRootCa)
		strustExportToDb("ZOTTO", "CA", "Otto Root CA")

		startStrust()
		strustUploadCa(varCompanyCa)
		strustExportToDb("ZOTTOCO", "CA", "Otto Company CA")

		startStrust()
		strustUploadCa(varUniversalIssuingCa)
		strustExportToDb("ZOTTOUI", "CA", "Otto Universal Issuing CA")

		startStrust()
		ToolTip, 💡 RunSAP: Show Database. Please wait..!
		Sleep, 400
		Send, !c ; [Alt]+[C]
		Send, d

		; Remove ToolTip
		ToolTip
		Return
	} else {
		MsgBox, 0, ❓ SAP GUI, SAP GUI not open, 5
		Return
	}

StzacCET:
	if WinExist("ahk_class SAP_FRONTEND_SESSION") {
		WinActivate
		ToolTip, 🕑 RunSAP: Chnage System Timezone to CET
		startTcode("STZAC") ; Start Tcode
		Sleep, 400
		; Pop-up
		; Click Yes
		Send, {tab}
		Sleep, 200
		Send, {tab}
		Sleep, 200
		Send, {Enter}
		Sleep, 400
		; System Time Zone is selected
		Send, CET{Enter}
		Sleep, 200
		; Save
		Send, ^s ; [Crtl]+[S]
		;Sleep, 200
		; Transport
		; Create Transport
		;Send, {F8}
		;Sleep, 200
		; Short Description selected
		;Send, CET Timezone{Enter}
		; Remove ToolTip
		ToolTip
		Return
	} else {
		MsgBox, 0, ❓ SAP GUI, SAP GUI not open, 5
		Return
	}

CheckTimeZone:
	if WinExist("ahk_class SAP_FRONTEND_SESSION") {
		WinActivate

		sa38Tzcusthelp()

		; Remove ToolTip
		ToolTip
		Return
	} else {
		MsgBox, 0, ❓ SAP GUI, SAP GUI not open, 5
		Return
	}

SicfActivate:
	if WinExist("ahk_class SAP_FRONTEND_SESSION") {
		WinActivate

		; /sap/public/ping
		startSicf()
		activateSicfService("/sap/public/", "ping")

		; Remove ToolTip
		ToolTip
		Return
	} else {
		MsgBox, 0, ❓ SAP GUI, SAP GUI not open, 5
		Return
	}

StartGuiTcode:
	if WinExist("ahk_class SAP_FRONTEND_SESSION") {
		WinActivate
		StringSplit, arrayTcode, A_ThisMenuItem, :
		startTcode(arrayTcode1) ; Start Tcode
		ToolTip
		Return
	} else {
		MsgBox, 0, ❓ SAP GUI, SAP GUI not open, 5
		Return
	}

startTcode(varTcode) {
	ToolTip, 💡 RunSAP: Start %varTcode%. Please wait..!
	StringUpper, Tcode, Tcode
	Send, ^+/ ; Tcode
	Sleep, 400
	Send, /n%varTcode%{Enter}
	Sleep, 1000
	ToolTip
	Return
}

startStrust() {
	startTcode("strust")
	Send, ^{F1} ; Change mode
	Sleep, 400
	Return
}

startSicf() {
	startTcode("sicf")
	Send, {F8} ; Change mode
	Sleep, 400
	Return
}

strustUploadCa(varCerFile) {
	if FileExist(varCerFile) {
		ToolTip, 💡 RunSAP: Import certificate. Please wait..!
		Sleep, 400
		Send, !c ; [Alt]+[C]
		Send, i
		Sleep, 1000
		Send, %varCerFile%
		Sleep, 600
		Send, {Enter}
		ToolTip
		Return
	} else {
		MsgBox, 0, 😞 Error, Certificate %varCerFile% does not exist
		Exit
	}
}

strustAddCaToList() {
	ToolTip, 💡 RunSAP: Add certificate to list. Please wait..!
	Sleep, 1000
	Send, !e ; [Alt]+[E]
	Send, i
	Sleep, 600
	ToolTip
	Return
}

strustExportToDb(varTrustCenterName, varCategory, varDesc) {
	StringUpper, varTrustCenterName, varTrustCenterName
	ToolTip, 💡 RunSAP: Export certificate to database. Please wait..!
	Sleep, 1000
	Send, !c ; [Alt]+[C]
	Send, e ; [E]
	Sleep, 1000
	
	; Switch tab
	Send, +{tab} ; [Shift]+[Tab]
	Sleep, 400
	Send, {Right} ; Switch to database tab
	Sleep, 400
	Send, {Enter} ; Activate database tab
	Sleep, 400
	
	; Trust Center Name
	Send, {tab}
	Sleep, 400
	Send, %varTrustCenterName%
	Sleep, 400
	
	; Category
	Send, {tab}
	Sleep, 400
	Send, %varCategory%
	Sleep, 400

	; Description
	Send, {tab}
	Sleep, 400
	Send, %varDesc%
	Sleep, 400

	; Save
	Send, {Enter}
	Sleep, 500
	Send, {Enter} ; Close overwrite pop-up
	Sleep, 500

	ToolTip
	Return
}

activateSicfService(varSicfServicePath, varSicfServiceName) {
	ToolTip, 💡 RunSAP: Activate ICM-service %varSicfServiceName%. Please wait..!
	Sleep, 400
	Send, DEFAULT_HOST ; Virtual Host
	Send, {tab}
	Send, %varSicfServicePath% ; Service Path
	Send, {tab}
	Send, %varSicfServiceName% ; ServiceName
	Send, {tab}{tab}{tab}{tab}{Enter}
	Sleep, 600
	Send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab} ; 10x Tab
	Sleep, 400
	Send, {PgDn} ; [Page down]
	Send, +{F11} ; Activate
	Sleep, 400
	Send, {Enter}
	Sleep, 1000
	ToolTip
	Return
}

sa38Tzcusthelp() {
	ToolTip, 🕑 RunSAP: Check System Timezone Setting
	startTcode("SA38") ; Start Tcode
	Sleep, 400
	Send, TZCUSTHELP{Enter}
	Sleep, 200
	Send, {F8} ; Change mode
	Sleep, 200
	; Current Date selected
	FormatTime, CurrentDate,, dd.MM.yyyy
	Send, %CurrentDate%{tab}
	Sleep, 200
	FormatTime, CurrentTime,, HH:mm:ss
	Send, %CurrentTime%{tab}
	Sleep, 200
	Send, CET{Enter}
	Sleep, 200
	Send, {F8}
	; Remove ToolTip
	ToolTip
	Return
}
