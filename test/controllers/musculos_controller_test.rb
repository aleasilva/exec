require 'test_helper'

class MusculosControllerTest < ActionController::TestCase
  setup do
    @musculo = musculos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:musculos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create musculo" do
    assert_difference('Musculo.count') do
      post :create, musculo: { nome: @musculo.nome, observacao: @musculo.observacao, selecionado: @musculo.selecionado }
    end

    assert_redirected_to musculo_path(assigns(:musculo))
  end

  test "should show musculo" do
    get :show, id: @musculo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @musculo
    assert_response :success
  end

  test "should update musculo" do
    patch :update, id: @musculo, musculo: { nome: @musculo.nome, observacao: @musculo.observacao, selecionado: @musculo.selecionado }
    assert_redirected_to musculo_path(assigns(:musculo))
  end

  test "should destroy musculo" do
    assert_difference('Musculo.count', -1) do
      delete :destroy, id: @musculo
    end

    assert_redirected_to musculos_path
  end
end
