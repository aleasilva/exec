require 'test_helper'

class TipovendasControllerTest < ActionController::TestCase
  setup do
    @tipovenda = tipovendas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipovendas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipovenda" do
    assert_difference('Tipovenda.count') do
      post :create, tipovenda: { nome: @tipovenda.nome }
    end

    assert_redirected_to tipovenda_path(assigns(:tipovenda))
  end

  test "should show tipovenda" do
    get :show, id: @tipovenda
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipovenda
    assert_response :success
  end

  test "should update tipovenda" do
    patch :update, id: @tipovenda, tipovenda: { nome: @tipovenda.nome }
    assert_redirected_to tipovenda_path(assigns(:tipovenda))
  end

  test "should destroy tipovenda" do
    assert_difference('Tipovenda.count', -1) do
      delete :destroy, id: @tipovenda
    end

    assert_redirected_to tipovendas_path
  end
end
