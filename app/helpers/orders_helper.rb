module OrdersHelper
    def value_request
        puts "-----------Helper work"
        return User.where(phone: params[:phone]).first.present? ? User.where(phone: params[:phone]).first.id : nil 
    end
end