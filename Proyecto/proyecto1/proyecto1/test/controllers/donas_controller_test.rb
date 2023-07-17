require "test_helper"

class DonasControllerTest < ActionDispatch::IntegrationTest
  test "should get comprar" do
    get donas_comprar_url
    assert_response :success
  end

  test "should get carrito" do
    get donas_carrito_url
    assert_response :success
  end

  test "should get favorito" do
    get donas_favorito_url
    assert_response :success
  end
end
