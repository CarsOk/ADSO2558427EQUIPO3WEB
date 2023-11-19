document.addEventListener("DOMContentLoaded", function () {
    // Selecciona el elemento de carga
    var loading = document.getElementById("loading");

    // Simula una solicitud al servicio (puedes reemplazar esto con tu código real)
    function simulateServiceRequest() {
        // Muestra el loading antes de la solicitud
        loading.style.display = "block";

        // Simula una solicitud que tarda 3 segundos en completarse
        setTimeout(function () {
            // Oculta el loading después de que la solicitud se haya completado
            loading.style.display = "none";
        }, 3000); // 3000 milisegundos = 3 segundos (ajusta según sea necesario)
    }

    // Llama a la función que simula la solicitud al servicio
    simulateServiceRequest();
});


var headerIndex = `
        <div class="container-fluid">
            <div class="row main-top-w3l py-2">
                <div class="col-lg-4 header-most-top">
                    <p class="text-white text-lg-left text-center">Offer Zone Top Deals & Discounts
                        <i class="fas fa-shopping-cart ml-1"></i>
                    </p>
                </div>
                <div class="col-lg-8 header-right mt-lg-0 mt-2">
                    <!-- header lists -->
                    <ul>
                        <li class="text-center border-right text-white">
                            <a href="#" data-toggle="modal" data-target="#exampleModal" class="text-white">
                                <i class="fas fa-truck mr-2"></i>Track Order</a>
                        </li>
                        <li class="text-center border-right text-white">
                            <i class="fas fa-phone mr-2"></i> 001 234 5678
                        </li>
                        <li class="text-center border-right text-white">
                            <a href="#" data-toggle="modal" data-target="#exampleModal" class="text-white">
                                <i class="fas fa-sign-in-alt mr-2"></i> Iniciar Sesion </a>
                        </li>
                        <li class="text-center text-white">
                            <a href="#" data-toggle="modal" data-target="#exampleModal2" class="text-white">
                                <i class="fas fa-sign-out-alt mr-2"></i> Registrate </a>
                        </li>
                    </ul>
                    <!-- //header lists -->
                </div>
            </div>
        </div>
`;



document.addEventListener('DOMContentLoaded', function() {
    
    const header = document.getElementById('main-header');
    const token = localStorage.getItem('token'); // Obtiene el token del almacenamiento local
    const name = localStorage.getItem('name'); // Obtiene el token del almacenamiento local
    
    if (token) {
        // Si el token existe, el usuario ha iniciado sesión, cambia el encabezado
        header.innerHTML = `
        <div class="container-fluid">
            <div class="row main-top-w3l py-2">
                <div class="col-lg-4 header-most-top">
                    <p class="text-white text-lg-left text-center">Offer Zone Top Deals & Discounts
                        <i class="fas fa-shopping-cart ml-1"></i>
                    </p>
                </div>
                <div class="col-lg-8 header-right mt-lg-0 mt-2">
                    <!-- header lists -->
                    <ul>
                        <li class="text-center border-right text-white">
                            <a href="#" data-toggle="modal" data-target="#exampleModal" class="text-white">
                                <i class="fas fa-truck mr-2"></i>Track Order</a>
                        </li>
                        <li class="text-center border-right text-white">
                            <i class="fas fa-phone mr-2"></i> 001 234 5678
                        </li>
                        <li class="text-center border-right text-white">
                            <a href="#" data-toggle="modal" data-target="#exampleModal" class="text-white">
                                <i class="fas fa-sign-in-alt mr-2"></i> `+ name +` </a>
                        </li>
                        <li class="text-center text-white">
                            <a href="#" class="text-white" id="logoutButton">
                                <i class="fas fa-sign-out-alt mr-2"></i> Cerrar sesión </a>
                        </li>
                    </ul>
                    <!-- //header lists -->
                </div>
            </div>
        </div>
`;
        // Puedes realizar otros cambios en el encabezado o en la interfaz aquí
    } else {
        console.log("else")
        // Si no hay token, el usuario no ha iniciado sesión
        header.innerHTML = headerIndex;
        // Otras modificaciones en el encabezado si el usuario no ha iniciado sesión
    }
});


document.addEventListener("DOMContentLoaded", function () {
    // ... (tu código existente)

    // Agrega la lógica para cerrar sesión
    const logoutButton = document.getElementById("logoutButton");

    logoutButton.addEventListener("click", function () {
        // Muestra una confirmación antes de cerrar la sesión
        const confirmLogout = confirm("¿Seguro desea cerrar sesión?");

        if (confirmLogout) {
            // Eliminar el token y el nombre del almacenamiento local
            localStorage.removeItem('token');
            localStorage.removeItem('name');

            // Redirigir al usuario a la página de inicio de sesión
            window.location.href = "index.html";
        }
    });
});

function redirectToPage(select) {
    var selectedValue = select.value;
    // Realizar la redirección según la opción seleccionada
    if (selectedValue === "Camisa") {
        window.location.href = "camisa.html"; // Cambia "camisa.html" a la URL de la página a la que deseas redirigir.
    
    } else if (selectedValue === "Busos") {
        window.location.href = "buso.html"; // Cambia "sueter.html" a la URL de la página correspondiente.
    
    } else if (selectedValue === "Jeans") {
        window.location.href = "jeans.html"; // Cambia "jeans.html" a la URL deseada.
    
    } else if (selectedValue === "Accessorio") {
        window.location.href = "product.html"; // Cambia "accesorio.html" a la URL de la página respectiva.
    
    } else if (selectedValue === "Vestidos") {
        window.location.href = "vestidos.html";
    
    } else if (selectedValue === "Blusas") {
        window.location.href = "blusas.html";
}
}