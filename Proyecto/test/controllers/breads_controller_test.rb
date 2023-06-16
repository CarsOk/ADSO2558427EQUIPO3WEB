require "test_helper"

class BreadsControllerTest < ActionDispatch::IntegrationTest
  test "should get comprar" do
    get breads_comprar_url
    assert_response :success
  end

  test "should get carrito" do
    get breads_carrito_url
    assert_response :success
  end

  test "should get favorito" do
    get breads_favorito_url
    assert_response :success
  end
end
