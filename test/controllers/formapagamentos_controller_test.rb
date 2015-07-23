require 'test_helper'

class FormapagamentosControllerTest < ActionController::TestCase
  setup do
    @formapagamento = formapagamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formapagamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formapagamento" do
    assert_difference('Formapagamento.count') do
      post :create, formapagamento: { nome: @formapagamento.nome }
    end

    assert_redirected_to formapagamento_path(assigns(:formapagamento))
  end

  test "should show formapagamento" do
    get :show, id: @formapagamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formapagamento
    assert_response :success
  end

  test "should update formapagamento" do
    patch :update, id: @formapagamento, formapagamento: { nome: @formapagamento.nome }
    assert_redirected_to formapagamento_path(assigns(:formapagamento))
  end

  test "should destroy formapagamento" do
    assert_difference('Formapagamento.count', -1) do
      delete :destroy, id: @formapagamento
    end

    assert_redirected_to formapagamentos_path
  end
end
