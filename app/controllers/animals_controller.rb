class AnimalsController < ApplicationController
    skip_before_action :verify_authenticity_token

    # In Localhost:3000 and Postman: GET /animals
    def index
        @animals = Animal.all
        render json: @animals
    end

    #Story 1: 
    # GET /animals/1
    # def show
    #     render json: @animal
    # end
    # Story 3: 
    # See one animal with all its associated sightings --> include the animal's sightings
    def show
        @animal = Animal.includes(:sightings).find(params[:id])
        render json: @animal, include: :sightings
    end

    # POST /animals
    def create
        @animal = Animal.new(animal_params)
        if @animal.save
            render json: @animal, status: :created, location: @animal
        else
            render json: @animal.errors, status: :unprocessable_entity
        end
    end

    # PUT/PATCH /animnals/1
    def update
        if @animal.update(animal_params)
            render json: @animal
        else 
            render json: @animal.errors, status: :unprocessable_entity
        end
    end

    # DELETE /animals/1
    def destroy
        @animal.destroy
    end

    # GET /animals/1/animal_type
    private
    # Returns the animal with the given id
    def set_animal
        @animal = Animal.find(params[:id])
    end

    # Allows certain data to be passed
    def animal_params
        params.require(:animal).permit(:common_name, :scientific_binomial)
    end
end
