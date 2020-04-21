require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.blank?
    assert_template 'users/new'
    assert_select   'div#error_explanation'                                       # divタグの中のid error_explanationをが描画されていれば成功
    assert_select   'div.field_with_errors' 
    assert_select   'form[action="/signup"]'
  end
end
