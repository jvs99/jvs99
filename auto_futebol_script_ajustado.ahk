
#Persistent
#NoEnv
SendMode Input
SetTitleMatchMode, 2

; Tecla para ativar/desativar script
toggle := false
~F12::
toggle := !toggle
if (toggle)
    ToolTip, Script Ativado
else
    ToolTip, Script Desativado
SetTimer, RemoveToolTip, 1500
return

RemoveToolTip:
ToolTip
return

; Automação de passes e dribles
~F1::
if (toggle) {
    Send, {w down}
    Sleep, 100
    Send, {w up}
    Sleep, 50
    MouseMove, 10, 0, 10, R
    Send, {a down}
    Sleep, 80
    Send, {a up}
}
return

; Controle de chute/finalização "green timed shot"
~F2::
if (toggle) {
    Send, {lbutton down}
    Sleep, 220
    Send, {lbutton up}
    Sleep, 30
    Send, {lbutton down}
    Sleep, 60
    Send, {lbutton up}
}
return

; Defesa agressiva (divididas mais firmes e reativas)
~F3::
if (toggle) {
    Loop, 4 {
        Send, {s down}
        Sleep, 80
        Send, {s up}
        Sleep, 30
        Send, {e down}  ; botão de tranco ou dividida (ajuste se necessário)
        Sleep, 100
        Send, {e up}
        Sleep, 30
        Send, {a down}
        Sleep, 60
        Send, {a up}
        Sleep, 20
    }
}
return

; Corrida infinita (segura shift constantemente)
~F4::
if (toggle) {
    SetTimer, HoldRun, 10
} else {
    SetTimer, HoldRun, Off
    Send, {Shift up}
}
return

HoldRun:
Send, {Shift down}
return
