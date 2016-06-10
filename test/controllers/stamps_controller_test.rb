require 'test_helper'

class StampsControllerTest < ActionController::TestCase


  setup do
    @some_stamp = stamps(:some_stamp)
    @another_stamp = stamps(:another_stamp)
  end


  test "should get index" do
    get :index
    assert_response :success
  end


  test "should get show" do
    get :show
    assert_response :success
  end


  test "should get edit" do
    get :edit
    assert_response :success
  end


  test "should PUT update" do
    patch :update, id: @some_stamp, stamp: { sg_number: @some_stamp.sg_number + '-e' }
  end


  test "should POST a new stamp" do
    assert_difference('Stamp.count') do
      post :create, stamp: {sg_number: 'hello world' }
    end
  end


  test "should get delete" do
    assert_difference('Stamp.count', -1) do
      delete :destroy, id: @some_stamp
    end
  end


end
