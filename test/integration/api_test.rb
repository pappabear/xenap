require 'test_helper'
require 'httparty'

class ApiTest < ActionDispatch::IntegrationTest

  # test "the truth" do
  #   assert true
  # end

  test "api is working" do
    r = HTTParty.get "http://localhost:3000/api/v1/stamps"
    assert_not_equal 0, r["stamps"].count
    assert_equal 1000, r["stamps"].count
  end

end
