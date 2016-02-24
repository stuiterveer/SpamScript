display dialog "Specify the service with which to send messages" buttons {"AIM", "Bonjour", "iMessage"}
set the target_service to the button returned of the result

if the target_service is "iMessage" then
	display dialog "Please enter the Apple ID you used to log in to iMessage with" default answer ""
end if

if the target_service is "Bonjour" then
	display dialog "Target user (please enter it in the following format: username@computername)" default answer ""
else
	display dialog "Target username" default answer ""
end if

set the target_buddy to the text returned of the result

display dialog "Message to send:" default answer ""
set the target_message to the text returned of the result

display dialog "Amount of times to send message:" default answer ""
set the target_amount to the text returned of the result

tell application "Messages"
	repeat target_amount times
		set theBuddy to buddy target_buddy of service target_service
		send target_message to theBuddy
	end repeat
end tell

display dialog "Done!" buttons {"OK"} default button 1
