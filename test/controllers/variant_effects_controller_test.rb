require 'test_helper'

class VariantEffectsControllerTest < ActionController::TestCase
  setup do
    @variant_effect = variant_effects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:variant_effects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create variant_effect" do
    assert_difference('VariantEffect.count') do
      post :create, variant_effect: { description: @variant_effect.description, snp_id: @variant_effect.snp_id, variant: @variant_effect.variant }
    end

    assert_redirected_to variant_effect_path(assigns(:variant_effect))
  end

  test "should show variant_effect" do
    get :show, id: @variant_effect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @variant_effect
    assert_response :success
  end

  test "should update variant_effect" do
    patch :update, id: @variant_effect, variant_effect: { description: @variant_effect.description, snp_id: @variant_effect.snp_id, variant: @variant_effect.variant }
    assert_redirected_to variant_effect_path(assigns(:variant_effect))
  end

  test "should destroy variant_effect" do
    assert_difference('VariantEffect.count', -1) do
      delete :destroy, id: @variant_effect
    end

    assert_redirected_to variant_effects_path
  end
end
