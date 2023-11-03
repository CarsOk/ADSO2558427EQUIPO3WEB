function searchProducts() {
    var searchInput = document.getElementById('search-input').value.toLowerCase();
    var productItems = document.querySelectorAll('.product-men');

    for (var i = 0; i < productItems.length; i++) {
        var productName = productItems[i].querySelector('h4 a').textContent.toLowerCase();
        var productContainer = productItems[i];

        if (productName.includes(searchInput)) {
            productContainer.style.display = 'block';
        } else {
            productContainer.style.display = 'none';
        }
    }
}
