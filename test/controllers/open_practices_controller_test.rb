require 'test_helper'

class OpenPracticesControllerTest < ActionController::TestCase
  setup do
    @open_practice = open_practices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:open_practices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create open_practice" do
    assert_difference('OpenPractice.count') do
      post :create, open_practice: { approved: @open_practice.approved, city: @open_practice.city, cost: @open_practice.cost, country: @open_practice.country, deleted: @open_practice.deleted, friday: @open_practice.friday, friday_end: @open_practice.friday_end, friday_start: @open_practice.friday_start, league_name: @open_practice.league_name, league_website: @open_practice.league_website, monday: @open_practice.monday, monday_end: @open_practice.monday_end, monday_start: @open_practice.monday_start, postal_code: @open_practice.postal_code, practice_contact: @open_practice.practice_contact, saturday: @open_practice.saturday, saturday_end: @open_practice.saturday_end, saturday_start: @open_practice.saturday_start, state: @open_practice.state, submission_contact: @open_practice.submission_contact, sunday: @open_practice.sunday, sunday_end: @open_practice.sunday_end, sunday_start: @open_practice.sunday_start, thursday: @open_practice.thursday, thursday_end: @open_practice.thursday_end, thursday_start: @open_practice.thursday_start, tuesday: @open_practice.tuesday, tuesday_end: @open_practice.tuesday_end, tuesday_start: @open_practice.tuesday_start, venue: @open_practice.venue, venue: @open_practice.venue, wednesday: @open_practice.wednesday, wednesday_end: @open_practice.wednesday_end, wednesday_start: @open_practice.wednesday_start }
    end

    assert_redirected_to open_practice_path(assigns(:open_practice))
  end

  test "should show open_practice" do
    get :show, id: @open_practice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @open_practice
    assert_response :success
  end

  test "should update open_practice" do
    patch :update, id: @open_practice, open_practice: { approved: @open_practice.approved, city: @open_practice.city, cost: @open_practice.cost, country: @open_practice.country, deleted: @open_practice.deleted, friday: @open_practice.friday, friday_end: @open_practice.friday_end, friday_start: @open_practice.friday_start, league_name: @open_practice.league_name, league_website: @open_practice.league_website, monday: @open_practice.monday, monday_end: @open_practice.monday_end, monday_start: @open_practice.monday_start, postal_code: @open_practice.postal_code, practice_contact: @open_practice.practice_contact, saturday: @open_practice.saturday, saturday_end: @open_practice.saturday_end, saturday_start: @open_practice.saturday_start, state: @open_practice.state, submission_contact: @open_practice.submission_contact, sunday: @open_practice.sunday, sunday_end: @open_practice.sunday_end, sunday_start: @open_practice.sunday_start, thursday: @open_practice.thursday, thursday_end: @open_practice.thursday_end, thursday_start: @open_practice.thursday_start, tuesday: @open_practice.tuesday, tuesday_end: @open_practice.tuesday_end, tuesday_start: @open_practice.tuesday_start, venue: @open_practice.venue, venue: @open_practice.venue, wednesday: @open_practice.wednesday, wednesday_end: @open_practice.wednesday_end, wednesday_start: @open_practice.wednesday_start }
    assert_redirected_to open_practice_path(assigns(:open_practice))
  end

  test "should destroy open_practice" do
    assert_difference('OpenPractice.count', -1) do
      delete :destroy, id: @open_practice
    end

    assert_redirected_to open_practices_path
  end
end
