class RoomsController < ApplicationController
  def show
  	if session[:user_id] ==nil
          redirect_to login_path
  	else
    render :layout => "order_detail"
    end
  end
end
