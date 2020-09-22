#Persistent  ; Keep the script running until the user exits it.

Menu, Tray, Tip, ⌨️ - Otto Group

; Custom icon
I_Icon = %A_ScriptDir%\moneyface.ico
IfExist, %I_Icon%
    Menu, Tray, Icon, %I_Icon%
Return


; Abwesenheitsplaner
#IfWinActive, Abwesenheitsplaner: Mitarbeiter-Service - Google Chrome
    ^n:: ; Neu
        ToolTip, 💡 Abwesenheitsplaner: Please wait...
        MouseClick, left, 3094, 2062 ; Click "Neu"
        Sleep, 2000
        MouseClick, left, 1638, 1082 ; Click "Beginnuhrzeit"
        Send, {Delete}
        ToolTip
        Return
    Tab::
        ToolTip, 💡 Abwesenheitsplaner: Please wait...
        MouseClick, left, 2460, 1082 ; Click outside as workaround for refresh bug
        Sleep, 2000
        MouseClick, left, 1638, 1152 ; Click "Endeuhrzeit"
        Send, {Delete}
        ToolTip
        Return
    Enter::
        ToolTip, 💡 Abwesenheitsplaner: Please wait...
        MouseClick, left, 2460, 1152 ; Click outside as workaround for refresh bug
        Sleep, 2000
        MouseClick, left, 1745, 1332 ; Click [X]
        Sleep, 1000
        MouseClick, left, 2345, 1487 ; Click "Speichern"
        ToolTip
        Return
    Esc::
        MouseClick, left, 2525, 1487 ; Click "X"
        Return

; ADFS
#IfWinActive, Home Realm Discovery - Google Chrome
    Enter::
        Send, {Tab}{Enter}
        MsgBox, 0, 🔑 ADFS, Sign in with your Otto Group organizational account (OCN), 2
        Return
#IfWinActive, Authentication options - Google Chrome
    Enter::
        Send, {Tab}{Enter}
        MsgBox, 0, 📱 2FA, Please check you Microsoft Authenticator app, 5
        Return