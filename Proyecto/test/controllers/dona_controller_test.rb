require "test_helper"

class DonaControllerTest < ActionDispatch::IntegrationTest
  test "should get comprar" do
    get dona_comprar_url
    assert_response :success
  end

  test "should get carrito" do
    get dona_carrito_url
    assert_response :success
  end

  test "should get favoritos" do
    get dona_favoritos_url
    assert_response :success
  end
end
