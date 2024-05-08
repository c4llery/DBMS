#!/usr/bin/python3

import csv
import sqlite3
import sys


def main():
	data =[]
	with open('users.csv', encoding = 'koi8_r') as fin:
		fin.readline()
		for string in fin.readlines():
			line = string.split('\t')
			user_id = int(line[0].split('_')[1]) 
			email = (line[1])
			geo = line[2].rstrip()
			data.append((user_id, email, geo))
			print(data[len(data) - 1])
	
	with sqlite3.connect('bets.s3db') as conn:
		cur = conn.cursor()
		for user_id, email, geo in data:
			cur.execute('INSERT INTO USERS (USER_ID, EMAIL, GEO) VALUES (?, ?, ?)', (user_id, email, geo))
		conn.commit()

	data = []
	with open('log.csv') as fin:
		for string in fin.readlines():
			string = string.split(',')
			id = -1
			bet = 0
			win = 0
			time = 0
			# print(string)
			if (string[0].split('_')[0] == '#error'):
				pass
			else:
				id = str(string[0].split('_')[1])
				time = str(string[1][1::])
				if (time[12] == ':'):
					time = time[:11:] + '0' + time[11::]

				if (string[2] != ''):
					bet = str(string[2])
				if (string[3] != '\n'):
					win = str(string[3])
				print(time)
			if (id == -1):
				pass
			else:
				data.append((int(id), time, int(bet), int(win)))
		for i in data:
			print(i)

	with sqlite3.connect('bets.s3db') as conn:
		cur=conn.cursor()
		for id, time, bet, win in data:
			cur.execute('INSERT INTO LOG (USER_ID, TIME, BET, WIN) VALUES (?, ?, ?, ?)', (id, time, bet, win))
		conn.commit()
				
			

if __name__ =='__main__':
	main()
    # main(sys.argv[1])
    
