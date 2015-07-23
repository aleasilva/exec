require 'test_helper'

class VendaplanosControllerTest < ActionController::TestCase
  setup do
    @vendaplano = vendaplanos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendaplanos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendaplano" do
    assert_difference('Vendaplano.count') do
      post :create, vendaplano: { aluno_id: @vendaplano.aluno_id, dtVenda: @vendaplano.dtVenda, nuDia: @vendaplano.nuDia, pagamento: @vendaplano.pagamento, plano_id: @vendaplano.plano_id, qtVenda: @vendaplano.qtVenda, tipovenda: @vendaplano.tipovenda }
    end

    assert_redirected_to vendaplano_path(assigns(:vendaplano))
  end

  test "should show vendaplano" do
    get :show, id: @vendaplano
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendaplano
    assert_response :success
  end

  test "should update vendaplano" do
    patch :update, id: @vendaplano, vendaplano: { aluno_id: @vendaplano.aluno_id, dtVenda: @vendaplano.dtVenda, nuDia: @vendaplano.nuDia, pagamento: @vendaplano.pagamento, plano_id: @vendaplano.plano_id, qtVenda: @vendaplano.qtVenda, tipovenda: @vendaplano.tipovenda }
    assert_redirected_to vendaplano_path(assigns(:vendaplano))
  end

  test "should destroy vendaplano" do
    assert_difference('Vendaplano.count', -1) do
      delete :destroy, id: @vendaplano
    end

    assert_redirected_to vendaplanos_path
  end
end
