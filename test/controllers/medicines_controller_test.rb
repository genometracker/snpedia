require 'test_helper'

class MedicinesControllerTest < ActionController::TestCase
  setup do
    @medicine = medicines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicine" do
    assert_difference('Medicine.count') do
      post :create, medicine: { description: @medicine.description, title: @medicine.title }
    end

    assert_redirected_to medicine_path(assigns(:medicine))
  end

  test "should show medicine" do
    get :show, id: @medicine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicine
    assert_response :success
  end

  test "should update medicine" do
    patch :update, id: @medicine, medicine: { description: @medicine.description, title: @medicine.title }
    assert_redirected_to medicine_path(assigns(:medicine))
  end

  test "should destroy medicine" do
    assert_difference('Medicine.count', -1) do
      delete :destroy, id: @medicine
    end

    assert_redirected_to medicines_path
  end
end
