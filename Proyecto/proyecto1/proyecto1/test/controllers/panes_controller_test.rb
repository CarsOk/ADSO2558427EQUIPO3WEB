require "test_helper"

class PanesControllerTest < ActionDispatch::IntegrationTest
  test "should get comprar" do
    get panes_comprar_url
    assert_response :success
  end

  test "should get carrito" do
    get panes_carrito_url
    assert_response :success
  end

  test "should get favorito" do
    get panes_favorito_url
    assert_response :success
  end
end
