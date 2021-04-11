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
        if @good.save 
            redirect_to controller: "orders", action: "show", id: @good.order_id, notice: "Your good just send"
        else
            redirect_to :action => "index", notice: "Your good no send"
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
