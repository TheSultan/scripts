#!/usr/bin/python

import smtplib

fromaddr = 'from@example.com'
toaddr  = 'to@example.com'
msg = 'There was a terrible error that occured and I wanted you to know!'


# Credentials (if needed)
username = 'example@gmail.com'
password = 'ThisIsATerriblePassword'

# The actual mail send
server = smtplib.SMTP('smtp.gmail.com:587')
server.ehlo()
server.starttls()
server.login(username,password)
server.sendmail(fromaddr, toaddrs, msg)
server.quit()
