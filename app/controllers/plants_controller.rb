# Manages a list of plants, such as household plants
class PlantsController < ApplicationController
	def index
		render json: Plant.all.to_json
	end

	def show
		p = Plant.find(params[:id])
		render json: p.to_json
	end

	def create
		p = Plant.create(plant_params)
		render json: p.to_json
	end

	def update
		p = Plant.find(params[:id])
		p.update(plant_params)
		render json: p.to_json
	end

	def destroy
		p = Plant.find(params[:id])
		p.destroy!
		head(:no_content)
	end

	private

	def plant_params
		params.require(:plant)
					.permit(:name, :species)
	end
end
