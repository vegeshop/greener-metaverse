echo "$(date)" >> greener-logs
TOKEN=$1

git add -A
git commit -m "daily commit"

expect <<EOF
set timeout 10
spawn git push
expect "Username for 'https://github.com':"
	send "$TOKEN\r"
expect "Password for 'https://($TOKEN)@github.com':"
	send "\r"
expect eof
EOF
