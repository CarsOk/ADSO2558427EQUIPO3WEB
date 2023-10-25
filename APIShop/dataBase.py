import psycopg2

class PostgreSQLDB:
    def __init__(self, host, user, password, database):
        self.host = host
        self.user = user
        self.password = password
        self.database = database
        self.connection = None

    def connect(self):
        try:
            self.connection = psycopg2.connect(
                host=self.host,
                user=self.user,
                password=self.password,
                dbname=self.database
            )
            print("Conexión exitosa a la base de datos")
        except (Exception, psycopg2.Error) as error:
            print("Error al conectarse a la base de datos:", error)

    def disconnect(self):
        if self.connection:
            self.connection.close()

    def execute_query(self, query, data=None):
        if not self.connection:
            print("No se ha establecido una conexión a la base de datos.")
            return None

        cursor = self.connection.cursor()
        try:
            if data:
                cursor.execute(query, data)
            else:
                cursor.execute(query)
            self.connection.commit()
            return cursor
        except psycopg2.Error as error:
            print("Error al ejecutar la consulta:", error)
            return None

    def create(self, query, data=None):
        return self.execute_query(query, data)

    def read(self, query, data=None):
        cursor = self.execute_query(query, data)
        if cursor:
            return cursor.fetchall()
        return 0

    def update(self, query, data=None):
        return self.execute_query(query, data)

    def delete(self, query, data=None):
        return self.execute_query(query, data)
