;------------------------------------------------
; Add icon
Menu Tray, Icon, imageRes.dll, 123

#SingleInstance force
#NoEnv

Process Priority,,High
; Determines how fast a script will run.
SetBatchLines -1

; ON/OFF this script
; RCtrl + Q
>^vk51::Suspend,Toggle

;Other way, when key RShift is down
;RShift::Suspend, On
;RShift UP::Suspend, Off

;------------------------------------------------
