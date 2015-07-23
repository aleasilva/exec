require 'test_helper'

class TabelaplanosControllerTest < ActionController::TestCase
  setup do
    @tabelaplano = tabelaplanos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tabelaplanos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tabelaplano" do
    assert_difference('Tabelaplano.count') do
      post :create, tabelaplano: { nome: @tabelaplano.nome, qtdMaxParcela: @tabelaplano.qtdMaxParcela, qtdMinParcela: @tabelaplano.qtdMinParcela }
    end

    assert_redirected_to tabelaplano_path(assigns(:tabelaplano))
  end

  test "should show tabelaplano" do
    get :show, id: @tabelaplano
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tabelaplano
    assert_response :success
  end

  test "should update tabelaplano" do
    patch :update, id: @tabelaplano, tabelaplano: { nome: @tabelaplano.nome, qtdMaxParcela: @tabelaplano.qtdMaxParcela, qtdMinParcela: @tabelaplano.qtdMinParcela }
    assert_redirected_to tabelaplano_path(assigns(:tabelaplano))
  end

  test "should destroy tabelaplano" do
    assert_difference('Tabelaplano.count', -1) do
      delete :destroy, id: @tabelaplano
    end

    assert_redirected_to tabelaplanos_path
  end
end
