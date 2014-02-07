require 'test_helper'

class GwasResultsControllerTest < ActionController::TestCase
  setup do
    @gwas_result = gwas_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gwas_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gwas_result" do
    assert_difference('GwasResult.count') do
      post :create, gwas_result: { article_title: @gwas_result.article_title, article_url: @gwas_result.article_url, effect_size: @gwas_result.effect_size, p_value: @gwas_result.p_value, risk_allele: @gwas_result.risk_allele, snp_id: @gwas_result.snp_id }
    end

    assert_redirected_to gwas_result_path(assigns(:gwas_result))
  end

  test "should show gwas_result" do
    get :show, id: @gwas_result
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gwas_result
    assert_response :success
  end

  test "should update gwas_result" do
    patch :update, id: @gwas_result, gwas_result: { article_title: @gwas_result.article_title, article_url: @gwas_result.article_url, effect_size: @gwas_result.effect_size, p_value: @gwas_result.p_value, risk_allele: @gwas_result.risk_allele, snp_id: @gwas_result.snp_id }
    assert_redirected_to gwas_result_path(assigns(:gwas_result))
  end

  test "should destroy gwas_result" do
    assert_difference('GwasResult.count', -1) do
      delete :destroy, id: @gwas_result
    end

    assert_redirected_to gwas_results_path
  end
end
