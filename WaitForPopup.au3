#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/sf /sv
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
Global $pidmdm
Global $programname = "\TOPNCK MDM BYPASS.exe"
Global $f = 0


MsgBox(0,"Starting..", "Please place your phone in Restore mode and start the itunes recovery process then wait.")
WinWait("iTunes", "Your iPhone has been restored to factory settings")
$pidmdm = Run(@ScriptDir & $programname)
If @error Then Exit MsgBox(0,"Error", "MDM tool is missing or has been renamed, make sure this tool is in the same folder as TN-iOS12_MDM-64bit.exe")
Sleep(1000)
MsgBox(0,"Part 1", "Part 1 of the MDM bypass was successful, please leave your iPhone or iPad connected and wait till the MDM tool no longer appears.", 7)

While $f = 0
	If WinExists("iUnlock Tool 12.1.2", "Bypass MDM") Then
		$f = 1
		WinActivate("iUnlock Tool 12.1.2")
		ControlClick("iUnlock Tool 12.1.2 ", "", "[CLASSNN:WindowsForms10.BUTTON.app.0.141b42a_r6_ad11]", "Left", 1)
;~ 		SoundPlay(@WindowsDir & "\media\tada.wav", 1)
		WinWait("iUnlock Tool 12.1.2", "MDM Bypass Done")
		ProcessClose($pidmdm)
		SoundPlay(@WindowsDir & "\media\tada.wav", 1)
		SoundPlay(@WindowsDir & "\media\tada.wav", 1)
		MsgBox(0,"Success", "Your MDM process is complete.")
	Else
		ProcessClose($pidmdm)
		$pidmdm = Run(@ScriptDir & $programname)
		Sleep(10000)
	EndIf
WEnd
