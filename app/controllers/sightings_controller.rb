class SightingsController < ApplicationController
    skip_before_action :verify_authenticity_token

    # Story 1:
    # Get all sightings between the start date and end date
    # def index
    #     @sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    #     render json: @sightings
    # end
    # Story 3: 
    # See all sightings within a given time period. --> filter sightings by date 
    def index
        sightings = Sighting.where(date: params[:start_date]..params[:end_date])
        render json: sightings
    end

    def show
        render json: @sightings
    end

    def create
        @sighting = Sighting.new(sighting_params)
        if @sighting.save
            render json: @sighting, status: :created, location: @sighting
        else
            render json: @sighting.errors, status: :unprecessable_entity
        end
    end

    def update
        if @sighting.update(sighting_params)
            render json: @sighting
        else
            render json: @sighting.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @sighting.destroy
    end

    private
    def set_sighting
        @sighting = Sighting.find(params[:id])
    end

    def sighting_params
        params.require(:sighting).permit(:animal_id, :latitude, :longitude, :date)
    end
end
