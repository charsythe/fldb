import psycopg2
from config import config

def connect():
	"""Connect to the PostgreSQL database server"""
	conn = None
	try:
		# read connection parameters
		params = config()

		# connect to the postgresql server
		print('Connecting to the PostgreSQL database...')
		conn = psycopg2.connect(**params)

		# create a cursor
		cur = conn.cursor()

	# execute a statement
		print('PostgreSQL database version:')
		cur.execute('SELECT version()')

		#display the postgresql db server version
		db_version = cur.fetchone()
		print(db_version)

		# close the comm with postgresql
		cur.close()
	except (Exception, psycopg.DatabaseError) as error:
		print(error)
	finally:
		if conn is not None:
			conn.close()
			print('Database connection closed.')


if __name__ == '__main__':
	connect()
