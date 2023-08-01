require "rails_helper"

RSpec.describe WateringsController, type: :routing do
	describe "routing" do
		it "routes to #index" do
			expect(get: "/waterings").to route_to("waterings#index")
		end

		it "routes to #show" do
			expect(get: "/waterings/1").to route_to("waterings#show", id: "1")
		end


		it "routes to #create" do
			expect(post: "/waterings").to route_to("waterings#create")
		end

		it "routes to #update via PUT" do
			expect(put: "/waterings/1").to route_to("waterings#update", id: "1")
		end

		it "routes to #update via PATCH" do
			expect(patch: "/waterings/1").to route_to("waterings#update", id: "1")
		end

		it "routes to #destroy" do
			expect(delete: "/waterings/1").to route_to("waterings#destroy", id: "1")
		end
	end
end
