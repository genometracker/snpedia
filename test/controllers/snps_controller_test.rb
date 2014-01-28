require 'test_helper'

class SnpsControllerTest < ActionController::TestCase
  setup do
    @snp = snps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:snps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create snp" do
    assert_difference('Snp.count') do
      post :create, snp: { rs_number: @snp.rs_number, snpedia_revision: @snp.snpedia_revision }
    end

    assert_redirected_to snp_path(assigns(:snp))
  end

  test "should show snp" do
    get :show, id: @snp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @snp
    assert_response :success
  end

  test "should update snp" do
    patch :update, id: @snp, snp: { rs_number: @snp.rs_number, snpedia_revision: @snp.snpedia_revision }
    assert_redirected_to snp_path(assigns(:snp))
  end

  test "should destroy snp" do
    assert_difference('Snp.count', -1) do
      delete :destroy, id: @snp
    end

    assert_redirected_to snps_path
  end
end
