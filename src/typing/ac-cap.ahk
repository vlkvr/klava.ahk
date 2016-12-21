;----------------------------------------------------------------------------------------------------
; Скрипт позволяет автоматически начинать новое предложение с заглавной буквы (не использовать SHIFT)
; src: https://autohotkey.com/board/topic/10348-make-sentences-start-with-capitals/
;----------------------------------------------------------------------------------------------------
; Назначаем уникальную иконку для скрипта в трее.
Menu Tray, Icon, imageRes.dll, 119

#SingleInstance force
#NoEnv

Process Priority,,High
; Determines how fast a script will run.
SetBatchLines -1

Loop {

  If !onn {
    Sleep 100
    Continue
  }

  Input key, I L1 V,
(Join
{ScrollLock}{CapsLock}{NumLock}{Esc}{BS}{PrintScreen}{Pause}
{LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}
{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}
{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}
)
  ; NewInput, EndKey
  If StrLen(ErrorLevel) > 3
    state =
  ; Sentence end
  Else If InStr(".!?",key)
    state = 1
  ; White space
  Else If InStr("`t `n",key)
    ; state1 -> state2
    state += (state = 1)
  Else {
    StringUpper key, key
    ; End-Space*-Letter
    If (state = 2)
      ; Letter -> Upper case
      SendInput {BS}{%key%}
    state =
  }
}

Return

;~LButton::
;~RButton::
;~MButton::
;~WheelDown::
;~WheelUp::
;~XButton1::
;~XButton2::State =

; AppsKey Switches Capitalization ON/OFF
>^F12::
  onn:=!onn
  state = 1
  TrayTip,,% "Capital after space is now O" (onn ? "N" : "FF")
Return
