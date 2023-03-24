require 'rails_helper'

RSpec.describe 'plants requests', type: :request do
	shared_examples 'a valid schema' do
		it 'should be a hash with five elements' do
			expect(datum).to be_a(Hash)
			expect(datum.count).to eq(5)
		end

		it 'should have the expected keys' do
			expect(datum[:id]).to be_a(Integer)
			expect(datum[:name]).to_not be_nil
			expect(datum[:species]).to_not be_nil
		end

		it 'should have timestamps' do
			expect(datum[:created_at].to_datetime).to_not be_nil
			expect(datum[:updated_at].to_datetime).to_not be_nil
		end
	end

	# NOTE: These test cases rely upon fixtures for pre-defined model instances
	describe 'GET /index' do
		before do
			get plants_url
		end

		let(:data) { JSON.parse(response.body, symbolize_names: true) }

		it 'retrieves a list of plants' do
			expect(response).to have_http_status(200)
			expect(data).to be_an(Array)
			expect(data.count).to eq(2)

			first_plant = data.first
			expect(first_plant[:id]).to be_an(Integer)
			expect(first_plant[:name]).to eq("Stefan's Plant")
			expect(first_plant[:species]).to eq('Peace Lily')

			second_plant = data.last
			expect(second_plant[:id]).to be_an(Integer)
			expect(second_plant[:name]).to eq('Other Plant')
			expect(second_plant[:species]).to eq('Parlor Palm')
		end

		it_behaves_like 'a valid schema' do
			let(:datum) { data.first }
		end

		it_behaves_like 'a valid schema' do
			let(:datum) { data.last }
		end
	end

	describe 'GET /:id' do
		before do
			plant = Plant.create!(name: 'Spec plant', species: 'Spec species')
			get plant_url(plant)
		end

		let(:datum) { JSON.parse(response.body, symbolize_names: true) }

		it_behaves_like 'a valid schema'

		it 'retrieves the plant' do
			expect(response).to have_http_status(200)

			expect(datum[:name]).to eq('Spec plant')
			expect(datum[:species]).to eq('Spec species')
		end
	end
end

