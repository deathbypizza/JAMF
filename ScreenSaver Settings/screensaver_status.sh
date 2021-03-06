#!/bin/sh

#This script checks the settings assigned to the user screensaver.plist by QUAM SODJI

user=`defaults read /Library/Preferences/com.apple.loginwindow lastUserName`

user_settings_one=$(defaults read /Users/$user/Library/Preferences/com.apple.screensaver askForPassword)

user_settings_two=$(defaults read /Users/$user/Library/Preferences/com.apple.screensaver askForPasswordDelay)

user_settings_three=$(defaults read /Users/$user/Library/Preferences/com.apple.screensaver)

#These are the two values we want for our screensaver settings
ask_password=1
ask_Delay=0

#Evaluate the user settings against the desired settings and reports back

if [[ "$user_settings_one" == "$ask_password" && "$user_settings_two" == "$ask_Delay" ]]; then
    echo "<result>Secure</result>"
else
    echo "<result>Insecure</result>"
fi
