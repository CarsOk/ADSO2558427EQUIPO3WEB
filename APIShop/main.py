from flask import Flask, jsonify, request, render_template
from dataBase import PostgreSQLDB
from flask_cors import CORS

app = Flask(__name__)

CORS(app)

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
    nombre = data.get('nombre')
    password = data.get('password')
    resultado = db.read(f"SELECT * FROM Usuarios WHERE nombre = '{nombre}' AND password = '{password}'")

    if len(resultado) != 0: 
        res = {
            "success": True,
            "statusCode": 200,
            "Mensaje": "Inicio de sesión exitoso"
        }
        return jsonify(res)
    else:
        res = {
            "success": False,
            "statusCode": 401,
            "Mensaje": "Credenciales incorrectas"
        }
        return jsonify(res)
    # return jsonify({"message": "Solicitud Post Exitosa", "resultado": resultado})


@app.route("/CrearUsuario", methods=['POST'])
def CrearUsuario():
    data = request.get_json()
    print(data)
    nombre = data.get('name')
    correo = data.get('email')
    password = data.get('password')

    resultado = db.create("INSERT INTO Usuarios (nombre, correo_electronico, password) VALUES (%s, %s, %s)", (nombre, correo, password))
    res = {
        "status":True,
        "statusCode":200,
        "response": resultado,
        "Mensaje": "Se inserto correctamente"
    }
    return res



if __name__ ==  "__main__":
    app.run(debug=True, port=4000)