require 'test_helper'

class SubTransactionsControllerTest < ActionController::TestCase
  setup do
    @sub_transaction = sub_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_transaction" do
    assert_difference('SubTransaction.count') do
      post :create, sub_transaction: { amount: @sub_transaction.amount, category_id: @sub_transaction.category_id, description: @sub_transaction.description, transaction_id: @sub_transaction.transaction_id }
    end

    assert_redirected_to sub_transaction_path(assigns(:sub_transaction))
  end

  test "should show sub_transaction" do
    get :show, id: @sub_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_transaction
    assert_response :success
  end

  test "should update sub_transaction" do
    patch :update, id: @sub_transaction, sub_transaction: { amount: @sub_transaction.amount, category_id: @sub_transaction.category_id, description: @sub_transaction.description, transaction_id: @sub_transaction.transaction_id }
    assert_redirected_to sub_transaction_path(assigns(:sub_transaction))
  end

  test "should destroy sub_transaction" do
    assert_difference('SubTransaction.count', -1) do
      delete :destroy, id: @sub_transaction
    end

    assert_redirected_to sub_transactions_path
  end
end
