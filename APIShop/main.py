from flask import Flask, jsonify, request, render_template
from dataBase import PostgreSQLDB

app = Flask(__name__)


db = PostgreSQLDB(
    host='localhost',
    user='postgres',
    password='123456',
    database='dev_shop',

)
db.connect()

@app.route("/IniciarSesion", methods=['POST'])
def IniciarSesion():
    data = request.get_json()
    correo = data.get('correo')
    password = data.get('password')
    resultado = db.read(f"SELECT *FROM Usuarios where correo_electronico = '{correo}' and password = '{password}'")
    print(resultado)
    if len(resultado) != 0: 
        return "ingreso correctamente"
    return "Usuario Incorrecto"
    # return jsonify({"message": "Solicitud Post Exitosa", "resultado": resultado})


@app.route("/CrearUsuario", methods=['POST'])
def CrearUsuario():
    data = request.get_json()
    nombre = data.get('nombre')
    correo = data.get('correo')
    password = data.get('password')

    resultado = db.create("INSERT INTO Usuarios (nombre, correo_electronico, password) VALUES (%s, %s, %s)", (nombre, correo, password))
    return resultado
    # return jsonify({"message": "Solicitud Post Exitosa", "resultado": resultado})



if __name__ ==  "__main__":
    app.run(debug=True, port=4000)