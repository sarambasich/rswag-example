require "test_helper"

# These test cases use fixtures for pre-defined model instances
class PlantsControllerTest < ActionDispatch::IntegrationTest
	test "should get index" do
		get plants_url
		assert_response :success

		data = JSON.parse(response.body)
		assert(data.is_a?(Array))
		assert_equal(2, data.count)

		first_plant = data.first.symbolize_keys
		assert(first_plant[:id].is_a?(Integer))
		assert_equal("Stefan's Plant", first_plant[:name])
		assert_equal("Peace Lily", first_plant[:species])
		assert_has_timestamps(first_plant)

		second_plant = data.last.symbolize_keys
		assert(second_plant[:id].is_a?(Integer))
		assert_equal("Other Plant", second_plant[:name])
		assert_equal("Parlor Palm", second_plant[:species])
		assert_has_timestamps(second_plant)
	end

	test "should get show" do
		plant = Plant.first!
		get plant_url(plant)
		assert_response :success

		data = JSON.parse(response.body).deep_symbolize_keys
		assert_equal(plant.name, data[:name])
		assert_equal(plant.species, data[:species])
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
		plant = Plant.first!
		put plant_url(plant), params: {
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

		plant.reload

		assert_equal('Updated plant', plant.name)
		assert_equal('Dracaena', plant.species)
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
