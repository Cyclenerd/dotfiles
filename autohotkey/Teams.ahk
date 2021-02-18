﻿; MICROSOFT TEAMS - Hotkeys
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
    [Pos1] or [Ctrl]+[j] : Join meeting
    [Ctrl]+[t] : 👨‍👩‍👧‍👦 Show participants
    [Ctrl]+[u] : 💬 Show conversation
    [F4] : Reactions
    [F5] : 👍 Thumbs Up
    [F6] : ❤️ Love
    [F7] : 👏 Applause
    [F8] : 😀 Smile
    [F9] or [Ctrl]+[h] : ✋ Raise your hand
    [Insert]: Share 🖥️ screen
    [End] : Leave meeting [🇩🇪: Verlassen] (🖱️)
    [Ctrl]+[Shift]+[1] : Type ❗ and [Enter]
    [Ctrl]+[Shift]+[ß] : Type ❓ and [Enter]

Teams window is active:
    [Ctrl]+[.] : Show default keyboard shortcuts
    [Ctrl]+[1] : Open Activity
    [Ctrl]+[2] : Open Chat
    [Ctrl]+[3] : Open Teams
    [Ctrl]+[4] : Open Calendar
    [Ctrl]+[5] : Open Calls
    [Ctrl]+[6] : Open Files

    [F1] : This help

-----------------------------------------------------------------------------------------
  🖱️ = done by a mouse click
)

Reactions =
(
[F5] 👍   [F6] ❤️   [F7] 👏   [F8] 😀     [F9] ✋
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

firstNavButton() {
    MouseGetPos, xpos, ypos 
    MouseClick, left, 240, 150
    Sleep, 2
    MouseClick, left, 240, 150
    MouseMove, %xpos%, %ypos%
    Sleep, 2
    Send, {Tab 2}{Left 10}
	Return
}

#IfWinActive, ahk_exe Teams.exe
    ^t:: ; Show participants
        WinMaximize
        ToolTip, 💡 Teams: 👨‍👩‍👧‍👦
        firstNavButton()
        Send, {Enter}
        SetTimer, RemoveToolTip, -3000
        Return
    ^u:: ; Show conversation
        WinMaximize
        ToolTip, 💡 Teams: 💬
        firstNavButton()
        Send, {Right 1}{Enter}
        SetTimer, RemoveToolTip, -3000
        Return
    F4::
        WinMaximize
        firstNavButton()
        Send, {Right 2}{Enter}
        MsgBox, 0, ✋ Reactions, %Reactions%, 5
        Return
    F5:: ; Thumbs Up
        WinMaximize
        ToolTip, 💡 Teams: 👍
        firstNavButton()
        Send, {Right 2}
        Sleep, 25
        Send, {Enter}
        Sleep, 40
        Send, {Left 5}
        Send, {Enter}
        SetTimer, RemoveToolTip, -3000
        Return
    F6:: ; Love
        WinMaximize
        ToolTip, 💡 Teams: ❤️
        firstNavButton()
        Send, {Right 2}
        Sleep, 25
        Send, {Enter}
        Sleep, 40
        Send, {Left 5}
        Send, {Right}{Enter}
        SetTimer, RemoveToolTip, -3000
        Return
    F7:: ; Applause
        WinMaximize
        ToolTip, 💡 Teams: 👏
        firstNavButton()
        Send, {Right 2}
        Sleep, 25
        Send, {Enter}
        Sleep, 40
        Send, {Left 5}
        Send, {Right 2}{Enter}
        SetTimer, RemoveToolTip, -3000
        Return
    F8:: ; Happy Face
        WinMaximize
        ToolTip, 💡 Teams: 😀
        firstNavButton()
        Send, {Right 2}
        Sleep, 25
        Send, {Enter}
        Sleep, 40
        Send, {Left 5}
        Send, {Right 3}{Enter}
        SetTimer, RemoveToolTip, -3000
        Return
    F9::
    ^h:: ; Raise your hand
        WinMaximize
        ToolTip, 💡 Teams: ✋
        firstNavButton()
        Send, {Right 2}
        Sleep, 25
        Send, {Enter}
        Sleep, 40
        Send, {Left 5}
        Send, {Right 4}{Enter}
        SetTimer, RemoveToolTip, -3000
        Return
    Home::
    ^j:: ; Join meeting
        WinMaximize
        ToolTip, 💡 Teams: Join meeting
        MouseGetPos, xpos, ypos 
        MouseClick, left, 1900, 300
        Sleep, 2
        MouseClick, left, 1900, 300
        MouseMove, %xpos%, %ypos%
        Sleep, 2
        Send, {Tab 8}{Enter}
        SetTimer, RemoveToolTip, -5000
        Return
    Insert:: ; Share screen
        Send, ^+E
        ToolTip, 💡 Teams: 🖥️
        SetTimer, RemoveToolTip, -5000
        Return
    End:: ; Leave meeting
        WinMaximize
        MouseClick, left, 3670, 141 ; Click "Leave" (German: Verlassen) button. Send, ^+B - not always work
        Sleep, 25
        Send, {Tab 2}{Enter}
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
    F1::
        MsgBox, 0, ⌨️ Help, %Help%
        Return

RemoveToolTip:
    ToolTip
    Return