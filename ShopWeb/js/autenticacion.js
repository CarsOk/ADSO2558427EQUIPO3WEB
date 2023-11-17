document.addEventListener("DOMContentLoaded", function () {
    const registerForm = document.getElementById("registerForm");

    registerForm.addEventListener("submit", function (event) {
        event.preventDefault();

        // Obtener los valores del formulario
        const name = document.getElementById("name").value;
        const email = document.getElementById("email").value;
        const password = document.getElementById("password").value;
        console.log("contraseña", password)

        // Crear un objeto con los datos del usuario
        const user = {
            name: name,
            email: email,
            password: password,
        };

        // Realizar la solicitud Fetch para enviar los datos al servidor
        fetch("http://127.0.0.1:4000/CrearUsuario", {
            method: "POST",
            mode: "cors",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(user),
        })
            .then((response) => response.json())
            .then((data) => {
                // Manejar la respuesta del servidor (puede ser un mensaje de éxito o error)
                if (data.success) {
                    // Registro exitoso, puedes redirigir al usuario o mostrar un mensaje de éxito
                    alert("Registro exitoso");
                } else {
                    // Mostrar un mensaje de error
                    alert("Error en el registro: " + data.message);
                }
            })
            .catch((error) => {
                // Manejar errores de la solicitud Fetch
                console.error("Error en la solicitud Fetch: " + error);
            });
    });
});


document.addEventListener("DOMContentLoaded", function () {
    const loginForm = document.getElementById("loginForm");  // Asegúrate de tener un formulario con el id "loginForm" en tu HTML.

    registerForm.addEventListener("submit", function (event) {
        event.preventDefault();
        // ... (código para el registro, igual al que proporcionaste)

    });

    loginForm.addEventListener("submit", function (event) {
        event.preventDefault();

        // Obtener los valores del formulario de inicio de sesión
        const username = document.getElementById("username").value;
        const password = document.getElementById("pass").value;

        // Crear un objeto con los datos del usuario para iniciar sesión
        const userLogin = {
            username: username,
            password: password,
        };

        // Realizar la solicitud Fetch para enviar los datos al servidor para iniciar sesión
        fetch("http://127.0.0.1:4000/IniciarSesion", {
            method: "POST",
            mode: "cors",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify(userLogin),
        })
            .then((response) => response.json())
            .then((data) => {
            console.log(data);
                // Manejar la respuesta del servidor para iniciar sesión
                if (data.success) {
                    const token = data.Respuesta[1];
                    const name = data.Respuesta[0];
                    localStorage.setItem('token', token);
                    localStorage.setItem('name', name);
                    window.location.reload();
                } else {
                    // Mostrar un mensaje de error
                    alert("Error en el inicio de sesión: " + data.Mensaje);
                }
            })
            .catch((error) => {
                // Manejar errores de la solicitud Fetch
                console.error("Error en la solicitud Fetch: " + error);
            });
    });
});


