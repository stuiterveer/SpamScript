display dialog "Specify the service with which to send messages" buttons {"AIM", "Bonjour", "iMessage"}
set the targetService to the button returned of the result

if the targetService is "iMessage" then
	display dialog "Please enter the Apple ID you used to log in to iMessage with:" default answer ""
	set targetService to "E:" & the text returned of the result
end if

if the targetService is "Bonjour" then
	display dialog "Target recipient (please enter it in the following format: username@computername):" default answer ""
else
	display dialog "Target recipient:" default answer ""
end if

set the targetBuddy to the text returned of the result

display dialog "Message to send:" default answer ""
set the targetMessage to the text returned of the result

display dialog "Amount of times to send message:" default answer ""
set the targetAmount to the text returned of the result

tell application "Messages"
	repeat targetAmount times
		set theBuddy to buddy targetBuddy of service targetService
		send targetMessage to theBuddy
	end repeat
end tell

display dialog "Done!" buttons {"OK"} default button 1
