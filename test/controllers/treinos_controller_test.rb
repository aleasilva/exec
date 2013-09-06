require 'test_helper'

class TreinosControllerTest < ActionController::TestCase
  setup do
    @treino = treinos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:treinos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create treino" do
    assert_difference('Treino.count') do
      post :create, treino: { aluno_id: @treino.aluno_id, criacao: @treino.criacao, observacao: @treino.observacao, validade: @treino.validade }
    end

    assert_redirected_to treino_path(assigns(:treino))
  end

  test "should show treino" do
    get :show, id: @treino
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @treino
    assert_response :success
  end

  test "should update treino" do
    patch :update, id: @treino, treino: { aluno_id: @treino.aluno_id, criacao: @treino.criacao, observacao: @treino.observacao, validade: @treino.validade }
    assert_redirected_to treino_path(assigns(:treino))
  end

  test "should destroy treino" do
    assert_difference('Treino.count', -1) do
      delete :destroy, id: @treino
    end

    assert_redirected_to treinos_path
  end
end
