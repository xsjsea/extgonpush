class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
  end

  def create
  	#user = User.find_by_truename_and_password(params[:session][:truename] , params[:session][:password])

    user = User.find_by_truename_and_password(params[:truename] , params[:password])  
      # 如果找不到对应用户，提示用户输入的用户名和密码不对
    if user == nil then
  	#ser= User.find_by(truename:params[:session] [:truename].downcase)
  	#f user && user.authenticate(params[:session] [:password])
  	flash.now[:notice] ='手机号或密码不正确!'
  	render 'new'
    else
         log_in user
         current_user
         redirect_to  orders_path
 
       
    end
  end
  def destrory
         session[:user_id] =  nil
         @current_user=nil
         redirect_to  login_path
  end

  # GET /users/login
  def login
    @users=User.new 
  end
   def getservices
   creator_id=params[:creator_id]
   @services=Service.select("services.creator_id,services.service_name,services.service_description,services.service_price").joins("where services.creator_id=#{creator_id}")
   #render 'creatorservices'
   render :json => @services.to_json  
  end

  
end
