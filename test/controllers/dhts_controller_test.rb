require 'test_helper'

class DhtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dht = dhts(:one)
  end

  test "should get index" do
    get dhts_url, as: :json
    assert_response :success
  end

  test "should create dht" do
    assert_difference('Dht.count') do
      post dhts_url, params: { dht: { humidity: @dht.humidity, name: @dht.name, temperature: @dht.temperature } }, as: :json
    end

    assert_response 201
  end

  test "should show dht" do
    get dht_url(@dht), as: :json
    assert_response :success
  end

  test "should update dht" do
    patch dht_url(@dht), params: { dht: { humidity: @dht.humidity, name: @dht.name, temperature: @dht.temperature } }, as: :json
    assert_response 200
  end

  test "should destroy dht" do
    assert_difference('Dht.count', -1) do
      delete dht_url(@dht), as: :json
    end

    assert_response 204
  end
end
