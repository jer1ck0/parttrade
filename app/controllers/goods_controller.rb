class GoodsController < ApplicationController
    before_action :set_good, only: [:show, :edit, :update, :destroy]

    def index
        @goods = Good.all
    end

    def show
    end

    def new
        @good = Good.new
    end
    
    def create
        @good = Good.new(good_params)
        respond_to do |format|
            if @good.save 
                format.html { redirect_to controller: "orders", action: "show", id: @good.order_id, notice: "Your good just send" }
                format.js 
                format.json { render json: @user, status: :created, location: @user }
            else
                format.html { redirect_to :action => "index", notice: "Your good no send" }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end        
    end

    def edit
    end

    def update

    end

    def destroy
        @good.destroy
        redirect_to :back
    end

    private

    def good_params
        params.require(:good).permit(:partnumber, :price, :cost, :outercost, :expdate, :order_id)
    end

    def set_good
        @good = Good.find(params[:id])
    end

end
