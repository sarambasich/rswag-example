require "test_helper"

class PlantsControllerTest < ActionDispatch::IntegrationTest
	test "should get index" do
		get plants_url
		assert_response :success
	end

	test "should get show" do
		p = Plant.first! # 2 in fixtures
		get plant_url(p)
		assert_response :success

		data = JSON.parse(response.body).deep_symbolize_keys
		assert_equal(p.name, data[:name])
		assert_equal(p.species, data[:species])
		assert_has_timestamps(data)
	end

	test "should POST create" do
		post plants_url, params: {
			plant: {
				name: 'New plant',
				species: 'Dracaena'
			}
		}
		assert_response :created

		data = JSON.parse(response.body).deep_symbolize_keys
		assert_equal('New plant', data[:name])
		assert_equal('Dracaena', data[:species])
		assert_has_timestamps(data)
	end

	test "should PUT update" do
		p = Plant.first!
		put plant_url(p), params: {
			plant: {
				name: 'Updated plant',
				species: 'Dracaena'
			}
		}
		assert_response :success

		data = JSON.parse(response.body).deep_symbolize_keys
		assert_equal('Updated plant', data[:name])
		assert_equal('Dracaena', data[:species])
		assert_has_timestamps(data)
	end

	test "should DELETE destroy" do
		p = Plant.first!
		delete plant_url(p)
		assert_response :no_content

		assert_raises(ActiveRecord::RecordNotFound) { Plant.find(p.id) }
	end

	private

	# Subroutine to check if the hash has expected timestamps
	# @param data [Hash] The hash to check
	def assert_has_timestamps(data)
		assert_not_empty(data[:created_at])
		assert_not_empty(data[:updated_at])
	end
end
