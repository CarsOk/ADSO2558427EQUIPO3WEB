require "test_helper"

class DeditoControllerTest < ActionDispatch::IntegrationTest
  test "should get comprar" do
    get dedito_comprar_url
    assert_response :success
  end

  test "should get carrito" do
    get dedito_carrito_url
    assert_response :success
  end

  test "should get favorito" do
    get dedito_favorito_url
    assert_response :success
  end
end
