document.addEventListener("DOMContentLoaded", function () {
    const registerForm = document.getElementById("registerForm");

    registerForm.addEventListener("submit", function (event) {
        event.preventDefault();

        // Obtener los valores del formulario
        const name = document.getElementById("name").value;
        const email = document.getElementById("email").value;
        const password = document.getElementById("password").value;

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
            credentials: "include",
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
