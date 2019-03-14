#!/usr/bin/expect -f 

lassign $argv appDir appName
send_user "dir: $appDir\n"
send_user "app: $appName\n"

#set timeout 10 

spawn vue-native init $appDir
expect "*name of your app*" { send "$appName\r" }
expect "Required: The name of your app visible on the home screen" { send "\r" }
expect "*to install dependencies*" { send "y\r" }
expect eof

