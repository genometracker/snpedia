require 'test_helper'

class MedicalConditionsControllerTest < ActionController::TestCase
  setup do
    @medical_condition = medical_conditions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_conditions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_condition" do
    assert_difference('MedicalCondition.count') do
      post :create, medical_condition: { name: @medical_condition.name }
    end

    assert_redirected_to medical_condition_path(assigns(:medical_condition))
  end

  test "should show medical_condition" do
    get :show, id: @medical_condition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medical_condition
    assert_response :success
  end

  test "should update medical_condition" do
    patch :update, id: @medical_condition, medical_condition: { name: @medical_condition.name }
    assert_redirected_to medical_condition_path(assigns(:medical_condition))
  end

  test "should destroy medical_condition" do
    assert_difference('MedicalCondition.count', -1) do
      delete :destroy, id: @medical_condition
    end

    assert_redirected_to medical_conditions_path
  end
end
