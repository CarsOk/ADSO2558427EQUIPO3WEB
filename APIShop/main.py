from flask import Flask, jsonify, request, render_template
from dataBase import PostgreSQLDB
from flask_cors import CORS
import jwt
import secrets
import bcrypt


app = Flask(__name__)
app.config['SECRET_KEY']= secrets.token_hex(16)

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
    username = data.get('username')
    password = data.get('password')
    resultado = db.read(f"SELECT * FROM Usuarios WHERE nombre = '{username}' AND password = '{password}'")

    if len(resultado) != 0: 
    
        payload = {'username': username, 'password': password}
        token = jwt.encode(payload, app.config['SECRET_KEY'], algorithm='HS256')

        lista = [username,token]
         
        res = {
            "success": True,
            "statusCode": 200,
            "Respuesta": lista
        }
        return jsonify(res)
    else:
        res = {
            "success": False,
            "statusCode": 500,
            "Respuesta": "Error al iniciar sesion"
        }
        return jsonify(res)


@app.route("/CrearUsuario", methods=['POST'])
def CrearUsuario():
    data = request.get_json()
    nombre = data.get('name')
    correo = data.get('email')
    password = data.get('password')
    encrypted_password = encrypt_password(password)

    resultado = db.create("INSERT INTO Usuarios (nombre, correo_electronico, password) VALUES (%s, %s, %s)", (nombre, correo, encrypted_password))

    if resultado:
        res = {
            "success": True,
            "statusCode": 200,
            "Respuesta": "Se insertó correctamente"
        }
        return jsonify(res)
    else:
        res = {
            "success": False,
            "statusCode": 500,
            "Respuesta": "Error al insertar el usuario en la Base de Datos"
        }
        return jsonify(res)  
    

def encrypt_password(password):
    # Generar una sal (salt) aleatoria
    salt = bcrypt.gensalt()

    # Cifrar la contraseña con la sal
    hashed_password = bcrypt.hashpw(password.encode('utf-8'), salt)

    return hashed_password




if __name__ ==  "__main__":
    app.run(debug=True, port=4000)


 