class WateringsController < ApplicationController
	before_action :set_watering, only: %i[ show update destroy ]

	# GET /plants/:plant_id/waterings
	def index
		@waterings = Plant.find(params[:plant_id]).waterings

		render json: @waterings
	end

	# GET /plants/:plant_id/waterings/1
	def show
		render json: @watering
	end

	# POST /plants/:plant_id/waterings
	def create
		@watering = Watering.new(watering_params)

		if @watering.save
			render json: @watering, status: :created
		else
			render json: @watering.errors, status: :unprocessable_entity
		end
	end

	# PATCH/PUT /plants/:plant_id/waterings/1
	def update
		if @watering.update(watering_params)
			render json: @watering
		else
			render json: @watering.errors, status: :unprocessable_entity
		end
	end

	# DELETE /plants/:plant_id/waterings/1
	def destroy
		@watering.destroy
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_watering
		@watering = Watering.find_by(plant_id: params[:plant_id], id: params[:id])
	end

	# Only allow a list of trusted parameters through.
	def watering_params
		params.require(:watering)
					.permit(:timestamp, :quantity, :method, :plant_id)
	end
end
