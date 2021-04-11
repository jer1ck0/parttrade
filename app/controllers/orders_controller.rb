class OrdersController < ApplicationController
    before_action :set_order, only: [:show, :edit, :update, :destroy]

    def index
        @orders = Order.all
    end

    def show
        @goods = Good.where(order_id: @order.id)
        @finances = Finance.where(order_id: @order.id)
    end

    def new
        @order = Order.new
    end
    
    def create
        @order = Order.new(order_params)
        if @order.save 
            redirect_to :action => "index", notice: "Your order just send"
        else
            redirect_to :action => "index", notice: "Your order no send"
        end
    end

    def edit
    end

    def update

    end

    def destroy
        @order.destroy
        redirect_to orders_path
    end

    private

    def order_params
        params.require(:order).permit(:user_id, :status, :comment, :manager, :message)
    end

    def set_order
        @order = Order.find(params[:id])
    end

end
