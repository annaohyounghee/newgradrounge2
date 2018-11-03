require 'test_helper'

class ReachoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reachout = reachouts(:one)
  end

  test "should get index" do
    get reachouts_url
    assert_response :success
  end

  test "should get new" do
    get new_reachout_url
    assert_response :success
  end

  test "should create reachout" do
    assert_difference('Reachout.count') do
      post reachouts_url, params: { reachout: { description: @reachout.description, title: @reachout.title } }
    end

    assert_redirected_to reachout_url(Reachout.last)
  end

  test "should show reachout" do
    get reachout_url(@reachout)
    assert_response :success
  end

  test "should get edit" do
    get edit_reachout_url(@reachout)
    assert_response :success
  end

  test "should update reachout" do
    patch reachout_url(@reachout), params: { reachout: { description: @reachout.description, title: @reachout.title } }
    assert_redirected_to reachout_url(@reachout)
  end

  test "should destroy reachout" do
    assert_difference('Reachout.count', -1) do
      delete reachout_url(@reachout)
    end

    assert_redirected_to reachouts_url
  end
end
