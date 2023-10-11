require "test_helper"

class DeditosControllerTest < ActionDispatch::IntegrationTest
  test "should get comprar" do
    get deditos_comprar_url
    assert_response :success
  end

  test "should get carrito" do
    get deditos_carrito_url
    assert_response :success
  end

  test "should get favorito" do
    get deditos_favorito_url
    assert_response :success
  end
end
