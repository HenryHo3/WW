@echo off
::=========================================================================================
::V0.1	-->	Initial version							2019/11/27
::V0.2	-->	Modify to show as concise content				2019/11/28
::V0.3	-->	Increase filtering conditions to 50Kb				2019/12/2
::		Reduce the waiting time of the welcome screen to 3 seconds	
::
::Created by Henry Ho
::=========================================================================================
Set C=0
::Echo ***List All Files***
::For /R %userprofile%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets %%G IN (*.*) do Echo %%~nG
Echo.
Echo ==================================================================
Echo.
Echo Welcome!!!
Echo This is a tool for catch Windows lockscreen wallpaper easily
Echo.
Echo ==================================================================
Echo.
Echo The tool will start in 3 seconds.
ping -n 3 127.0.0.1 >nul
Echo ***Filter Out Wallpapaers***
Echo.
For /R %userprofile%\AppData\Local\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\LocalState\Assets %%G IN (*.*) do (
	If %%~zG GEQ 51200 (
		Echo Found a wallpaper file:
		Echo %%~nG
		Echo Copy to current folder...
		Copy %%~fG %cd%\%%~nG.jpg
		Echo Done!!!
		Echo.
		set /a "C=C+1"
	)
)
ping -n 3 127.0.0.1 >nul
Echo.
Echo ==================================================================
Echo.
Echo Success!!! Bravo!!!
Echo Today's Windows lockscreen wallpapers are all catch finished!!!
Echo Total %C% wallpapers.
Echo.
Echo ==================================================================
Echo.
Echo The tool will close in 10 seconds.
Timeout 10