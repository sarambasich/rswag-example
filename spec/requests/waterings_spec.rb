require 'rails_helper'

RSpec.describe 'watering requests - happy paths', type: :request do
	shared_examples 'a valid schema' do
		it 'should be a hash with seven elements' do
			expect(datum).to be_a(Hash)
			expect(datum.count).to eq(7)
		end

		it 'should have the expected keys' do
			expect(datum[:id]).to be_a(Integer)
			expect(datum[:plant_id]).to be_a(Integer)
			expect(datum[:timestamp]).to_not be_nil
			expect(datum[:quantity]).to_not be_nil
			expect(datum[:method]).to_not be_nil
		end

		it 'should have timestamps' do
			expect(datum[:created_at].to_datetime).to_not be_nil
			expect(datum[:updated_at].to_datetime).to_not be_nil
		end
	end

	# NOTE: These test cases rely upon fixtures for pre-defined model instances
	describe 'GET#index' do
		before do
			plant.waterings.create!(timestamp: timestamp, quantity: quantity, method: method)

			get plant_waterings_url(plant)
		end

		let(:plant) { Plant.first! }
		let(:timestamp) { DateTime.new(2023, 8, 1, 0, 0, 0) } # 2023-08-01T00:00:00Z
		let(:quantity) { 0.5 } # liters
		let(:method) { :over_the_soil }
		let(:data) { JSON.parse(response.body, symbolize_names: true) }

		it 'retrieves a list of plant waterings' do
			expect(response).to have_http_status(200)
			expect(data).to be_an(Array)
			expect(data.count).to eq(1)

			watering = data.first
			expect(watering[:timestamp]).to eq('2023-08-01T00:00:00.000Z')
			expect(watering[:quantity]).to eq('0.5')
			expect(watering[:method]).to eq('over_the_soil')
		end

		it_behaves_like 'a valid schema' do
			let(:datum) { data.first }
		end
	end

	describe 'GET#show' do
		before do
			watering = plant.waterings.create!(timestamp: timestamp, quantity: quantity, method: method)

			get plant_watering_url(plant, watering)
		end

		let(:plant) { Plant.first! }
		let(:timestamp) { DateTime.new(2023, 8, 1, 0, 0, 0) } # 2023-08-01T00:00:00Z
		let(:quantity) { 0.5 } # liters
		let(:method) { :over_the_soil }
		let(:datum) { JSON.parse(response.body, symbolize_names: true) }

		it 'retrieves a watering' do
			expect(response).to have_http_status(200)

			expect(datum[:timestamp]).to eq('2023-08-01T00:00:00.000Z')
			expect(datum[:quantity]).to eq('0.5')
			expect(datum[:method]).to eq('over_the_soil')
		end

		it_behaves_like 'a valid schema'
	end

	describe 'POST#create' do
		before do
			post plant_waterings_url(plant), params: {
				watering: {
					plant_id: plant.id,
					timestamp: timestamp,
					quantity: quantity,
					method: method,
				}
			}
		end

		let(:plant) { Plant.first! }
		let(:timestamp) { DateTime.new(2023, 8, 1, 0, 0, 0) } # 2023-08-01T00:00:00Z
		let(:quantity) { 0.5 } # liters
		let(:method) { :over_the_soil }
		let(:datum) { JSON.parse(response.body, symbolize_names: true) }

		it 'creates a `Watering` in the database' do
			expect(watering = plant.waterings.first).to_not be_nil

			expect(watering.timestamp).to eq('2023-08-01T00:00:00.000Z')
			expect(watering.quantity).to eq(0.5)
			expect(watering.method).to eq('over_the_soil')
		end

		it 'returns the plant' do
			expect(response).to have_http_status(201)

			expect(datum[:timestamp]).to eq('2023-08-01T00:00:00.000Z')
			expect(datum[:quantity]).to eq('0.5')
			expect(datum[:method]).to eq('over_the_soil')
		end

		it_behaves_like 'a valid schema'
	end

	describe 'PUT#update' do
		before do
			watering = plant.waterings.create!(
				timestamp: DateTime.new(2023, 8, 1, 0, 0, 0),
				quantity: 0.5,
				method: 'over_the_soil'
			)
			put plant_watering_url(plant, watering), params: {
				watering: {
					timestamp: '2023-08-02T00:00:00.000Z',
					quantity: '0.8',
					method: 'bottom'
				}
			}
		end

		let(:plant) { Plant.first! }
		let(:datum) { JSON.parse(response.body, symbolize_names: true) }

		it 'updates a `Watering` in the database' do
			expect(watering = plant.waterings.first).to_not be_nil

			expect(watering.timestamp).to eq(DateTime.new(2023, 8, 2, 0, 0, 0))
			expect(watering.quantity).to eq(0.8)
			expect(watering.method).to eq('bottom')
		end

		it 'returns the plant' do
			expect(response).to have_http_status(200)

			expect(datum[:timestamp]).to eq('2023-08-02T00:00:00.000Z')
			expect(datum[:quantity]).to eq('0.8')
			expect(datum[:method]).to eq('bottom')
		end
	end

	describe 'DELETE#destroy' do
		before do
			delete plant_watering_url(plant, watering)
		end

		let(:plant) { Plant.first }
		let(:watering) {
			plant.waterings.create!(
				timestamp: DateTime.new(2023, 8, 1, 0, 0, 0),
				quantity: 0.5,
				method: 'over_the_soil'
			)
		}

		it 'deletes the `Watering` from the database' do
			expect(Watering.find_by(id: watering.id)).to be_nil
		end

		it 'returns a valid response' do
			expect(response).to have_http_status(204)
			expect(response.body).to be_empty
		end
	end
end
