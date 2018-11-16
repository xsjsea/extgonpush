class ApplicationController < ActionController::Base
 include SessionsHelper
  before_action :prepare_exception_notifier
  private
  def prepare_exception_notifier
    request.env["exception_notifier.exception_data"] = {
      :current_user => "test"
    }
  end
 protect_from_forgery with: :null_session
  
  def new
    #@user_id = AES.encrypt(current_user.id.to_s, "自定义密钥")
  end

  def create
   # @user_id = AES.decrypt(params[:uid], "自定义密钥")
   # @attachment = Attachment.new(params[:attachment])
   # @attachment.user_id = @user_id
   # @attachment.save
  end
 
 
end
