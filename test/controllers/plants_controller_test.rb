require "test_helper"

class PlantsControllerTest < ActionDispatch::IntegrationTest
	test "should get index" do
		get plants_index_url
		assert_response :success
	end

	test "should get show" do
		p = Plant.first! # 2 in fixtures
		get plants_show_url(p)
		assert_response :success
	end

	test "should get create" do
		get plants_create_url
		assert_response :success
	end

	test "should get update" do
		get plants_update_url
		assert_response :success
	end

	test "should get destroy" do
		get plants_qdestroy_url
		assert_response :success
	end
end
