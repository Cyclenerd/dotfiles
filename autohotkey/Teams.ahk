; MICROSOFT TEAMS - Hotkeys
;
; Note: I'm using Teams in German.
;       Texts in Button are therefore often longer than in English. You must therefore adjust the MouseClick X/Y coordinates.
;       ß is the question mark on the german keyboard.

Help =
(
MICROSOFT TEAMS - HOTKEYS
-----------------------------------------------------------------------------------------

App is open (also in background or minimized):
    [Ctrl]+[Space] : Enable or disable 🎤 microphone
    [Ctrl]+[Shift]+[Space] : Enable or disable 🎤 microphone and 📹 camera

Meeting window is active:
    [Ctrl]+[t] : Show participants (🖱️)
    [Ctrl]+[u] : Show conversation (🖱️)
    [Ctrl]+[h] : Raise your hand (🖱️)
    [Ctrl]+[Insert]: Share 🖥️ screen
    [Ctrl]+[End] : Leave meeting [🇩🇪: Verlassen] (🖱️)

Window is active:
    [Ctrl]+[Shift]+[1] : Type ❗ and [Enter]
    [Ctrl]+[Shift]+[ß] : Type ❓ and [Enter]
    [Ctrl]+[F1] : This help

Meeting details window is active:
    [Ctrl]+[j] : Join meeting [🇩🇪: Teilnehmen] (🖱️)

Meeting pop-up is active:
    [Ctrl]+[Shift]+[j] : Join now [🇩🇪: Jetzt teilnehmen] (🖱️)

-----------------------------------------------------------------------------------------
  🖱️ = done by a mouse click
)

; Hotkeys: https://www.autohotkey.com/docs/Hotkeys.htm
; ^ = [Ctrl]
; + = [Shift]
; ! = [Alt]

; MouseClick: https://www.autohotkey.com/docs/commands/MouseClick.htm
;   MouseClick, WhichButton, X, Y

Menu, Tray, Tip, ⌨️ - Microsoft Teams

; Custom icon
I_Icon = %A_ScriptDir%\teams.ico
IfExist, %I_Icon%
    Menu, Tray, Icon, %I_Icon%
Return

#IfWinExist, ahk_exe Teams.exe
    ^Space:: ; [Ctrl]+[Space]
        WinGet, winid, ID, A ; Save the current window ID
        WinActivate
        WinMaximize
        Send, ^+M ; Teams Mute shortcut
        SoundBeep
        WinActivate ahk_id %winid%
        ToolTip, 💡 Teams: 🎤
        SetTimer, RemoveToolTip, -5000
        Return
    +^Space:: ; [Ctrl]+[Shift]+[Space]
        WinGet, winid, ID, A ; Save the current window ID
        WinActivate
        WinMaximize
        Send, ^+O
        Sleep, 50
        Send, ^+M
        ToolTip, 💡 Teams: 🎤 & 📹
        SetTimer, RemoveToolTip, -5000
        SoundBeep, 750, 500 ; Play a higher pitch for half a second
        WinActivate ahk_id %winid%
        Return

#IfWinActive, ahk_exe Teams.exe
    ^j:: ; Join
        WinMaximize
        MouseClick, left, 3425, 205 ; Click "Join" (German: Teilnehmen) button
        ToolTip, 💡 Teams: 😊
        SetTimer, RemoveToolTip, -3000
        Return
    +^j:: ; Join meeting
        WinMaximize
        MouseClick, left, 2304, 1351 ; Click "Join now"  (German: Jetzt teilnehmen) button
        ToolTip, 💡 Teams: 👋
        SetTimer, RemoveToolTip, -3000
        Return
    ^t:: ; Show participants
        WinMaximize
        MouseClick, left, 2820, 141
        ToolTip, 💡 Teams: 👨‍👩‍👧‍👦
        SetTimer, RemoveToolTip, -3000
        Return
    ^u:: ; Show conversation
        WinMaximize
        MouseClick, left, 2915, 141
        ToolTip, 💡 Teams: 💬
        SetTimer, RemoveToolTip, -3000
        Return
    ^h:: ; Raise your hand
        WinMaximize
        MouseClick, left, 3030, 141
        ToolTip, 💡 Teams: ✋
        SetTimer, RemoveToolTip, -3000
        Return
    ^Insert:: ; Share screen
        Send, ^+E
        ToolTip, 💡 Teams: 🖥️
        SetTimer, RemoveToolTip, -5000
        Return
    ^End:: ; Leave meeting
        WinMaximize
        MouseClick, left, 3670, 141 ; Click "Leave" (German: Verlassen) button. Send, ^+B - not always work
        MsgBox, 0, 🏃💨 Left, You left the meeting, 5
        Return
    +^1:: ; type !
        Send, ❗{Enter}
        ToolTip, 💡 Teams: ❗
        SetTimer, RemoveToolTip, -3000
        Return
    +^ß:: ; type ?
        Send, ❓{Enter}
        ToolTip, 💡 Teams: ❓
        SetTimer, RemoveToolTip, -3000
        Return
    ^F1::
        MsgBox, 0, ⌨️ Help, %Help%
        Return

RemoveToolTip:
    ToolTip
    Return