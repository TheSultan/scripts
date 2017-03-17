#!/usr/bin/python

import mysql.connector

cnx = mysql.connector.connect(user='root', password='password', host='host', database='terriblepassword')
cnx.close()
