module Api
    module V1
        class CustomersController < ApplicationController

            def index
                @customers = Customer.all
                render json: @customers
            end

            def show
                @customers = Customer.find(params[:id])
                render json: @customers
            end

            def create
                @customers = Customer.new(customers_params)

                if @customers.save
                    render json: @customers
                else
                    render json: @customers.errors, status: :wrong_entity
                end
            end

            def update
                @customers = Customer.find(params[:id])

                if @customers.update(customers_params)
                    render json: @customers
                else
                    render json: @customers.errors, status: :wrong_entity
                end
            end

            def destroy
                @customers = Customer.find(params[:id])

                if @customers.present?
                    @customers.destroy
                    render json: @customers
                else
                    render json: {"customer's not found!"}
                end
            end

            private

            def customers_params
                params.require(:customer).permit(:name, :address)
            end

        end
    end
end
