require 'rails_helper'

RSpec.describe "plants requests", type: :request do
	shared_examples "a valid schema" do
		context "a list of plants" do
			it "should be a top-level array with two elements" do
				expect(data).to be_a(Array)
				expect(data.count).to eq(2)
			end

			it "should have timestamps" do
				data.each do |datum|
					expect(datum[:created_at].to_datetime).to_not be_nil
					expect(datum[:updated_at].to_datetime).to_not be_nil
				end
			end
		end
	end

  describe "GET /index" do
		before do
			get plants_url
		end

		let(:data) { JSON.parse(response.body, symbolize_names: true) }

		it 'retrieves a list of plants' do
			expect(response).to have_http_status(200)

			first_plant = data.first
			expect(first_plant[:id]).to be_a(Integer)
			expect(first_plant[:name]).to eq("Stefan's Plant")
			expect(first_plant[:species]).to eq('Peace Lily')

			second_plant = data.last
			expect(second_plant[:id]).to be_a(Integer)
			expect(second_plant[:name]).to eq('Other Plant')
			expect(second_plant[:species]).to eq('Parlor Palm')
		end

		it_behaves_like "a valid schema"
  end
end

