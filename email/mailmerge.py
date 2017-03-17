#!/usr/bin/python

import smtplib

fromaddr = 'from@example.com'
toaddr  = 'to@example.com'
msg = """Hi {},

{}

- someone"""

name = "Some Guy"
link = "http://some.example.com"
#print msg.format(name, link)

# Credentials (if needed)
username = 'example@gmail.com'
password = 'ThisIsATerriblePassword'

# The actual mail send
server = smtplib.SMTP('smtp.gmail.com:587')
server.ehlo()
server.starttls()
server.login(username,password)
server.sendmail(fromaddr, toaddr, msg)
server.quit()
