class UsersController < ApplicationController
  before_action :checklogin,except:[:new,:create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout :products_layout,except:[:new]
  skip_before_action :verify_authenticity_token,:only =>:create
  skip_before_action :verify_authenticity_token,:only =>:savepassword
  skip_before_action :verify_authenticity_token,:only =>:saveinviterequired
  skip_before_action :verify_authenticity_token,:only =>:saveuserinfo
  skip_before_action :verify_authenticity_token,:only =>:savemarketerinfo
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit

  end
 

  # POST /users
  # POST /users.json
  def create
    #@user = User.new(user_params)
    username=params[:username]
    truename=params[:truename]
    password=params[:password]
    usertype=params[:usertype]
    @users=User.select("users.id").joins("where users.truename=#{truename}")
    if@users[0] !=nil
       respond_to do |format|
          format.html { redirect_to register_path,notice: '手机号已被注册.' }
       end

    else
      curTime =Time.now.strftime("%Y-%m-%d %H:%M:%S") #Date.today
      sql = ActiveRecord::Base.connection()  
        sql.insert "INSERT INTO users SET username='#{username}',truename='#{truename}', password='#{password}',usertype='#{usertype}',
      created_at='#{curTime}',updated_at='#{curTime}',avatar='default_small.png'"  
    respond_to do |format|
      #if @user.save
        #format.html { redirect_to @user, notice: 'User was successfully created.' }
        #format.json { render :show, status: :created, location: @user }
       @users=User.select( "max(users.id) id");
      
       @user=User.find_by_id(@users[0].id)     
        #session[:user_id] =  @users[0].id
        #session[:avatar] =@user.avatar
        log_in(@user)
        user_id=@users[0].id
      if(@user.usertype=="0")
         sql.insert "INSERT INTO creator_exts SET userid='#{user_id}',  
      created_at='#{curTime}',updated_at='#{curTime}'"    
        format.html { redirect_to login_path,notice: '注册成功，请登录.' }
      else
        sql.insert "INSERT INTO marketer_exts SET userid='#{user_id}',  
      created_at='#{curTime}',updated_at='#{curTime}'"  
        format.html { redirect_to login_path,notice: '注册成功，请登录.' }
      end
     end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
   def inviterequired
    current_user
    user_id=session[:user_id]
    @inviterequired=CreatorExt.find_by_userid(user_id)

   end
   def saveinviterequired
    current_user
    inviterequired =params[:inviterequired]
    productselected =params[:productselected]
    CreatorExt.where(userid: session[:user_id]).update_all(inviterequired: inviterequired,productselected:productselected)
   end
   def updatepassword
    current_user
    
   end
  def savepassword
    current_user
    user_id=session[:user_id]
    password = params[:password]
    User.where(id:user_id).update_all(password:password)

   end
    def userinfo
    current_user
    user_id=session[:user_id]
    @userinfo=User.select("users.avatar,creator_exts.category_id,users.sex,users.username,users.description,users.user_comment,creator_exts.tags_set,users.nickname").joins("left join creator_exts on users.id= creator_exts.userid where users.id=#{user_id}")
    @user_categories=Category.select("categories.id,categories.name").joins("where categories.parent=6")
      
    
   end
    def marketerinfo
    current_user
    user_id=session[:user_id]
    @marketerinfo=User.select("marketer_exts.id,marketer_exts.taxcode,marketer_exts.bankname,marketer_exts.bankaccount,marketer_exts.companyname,marketer_exts.companyaddress,marketer_exts.contactname,marketer_exts.contactmobile").joins("left join marketer_exts on users.id= marketer_exts.userid where marketer_exts.userid=#{user_id}")
   end

  def savemarketerinfo
     taxcode=params[:taxcode]
     user_id=session[:user_id]
     bankname=params[:bankname]
     marketerinfoid=params[:marketerinfoid]
     bankaccount=params[:bankaccount]
     companyname=params[:companyname]
     contactname=params[:contactname]
     contactmobile=params[:contactmobile]
     companyaddress=params[:companyaddress]
    sch = MarketerExt.find_by_id(marketerinfoid)
    sch.update_attribute('taxcode','123')
    sch.update_attribute('bankname', bankname)
    sch.update_attribute('bankaccount',bankaccount)
    sch.update_attribute('companyname', companyname)
    sch.update_attribute('contactname', contactname)
    sch.update_attribute('contactmobile', contactmobile)
    sch.update_attribute('companyaddress', companyaddress)
   end

  def saveuserinfo
    #file
     current_user
     user_avatar=params[:inputImage]
     if(user_avatar!=nil)
     dir = Rails.root.join('public', 'uploads')
     Dir.mkdir(dir) unless Dir.exist?(dir)
     
    #user_avatar=params[:fileUpload]
     file_data=user_avatar.read
     @filename=user_avatar.original_filename
     root = Rails.root.to_s
     File.open(root+"/public/uploads/"+@filename,"wb"){|f|f.write(file_data)}
    end
     user_id=session[:user_id]
     nickname=params[:nickname]
     usercategory=params[:user_category]
     sex=params[:sex]
     user_description=params[:user_description]
     user_comment=params[:user_comment]
    

    sch = User.find_by_id(user_id)
    sch.update_attribute('nickname',nickname)
    sch.update_attribute('sex', sex)
    sch.update_attribute('description',user_description)
    sch.update_attribute('user_comment', user_comment)
    if(user_avatar!=nil)
    sch.update_attribute('avatar', @filename)
    session[:avatar]=@filename
    end
    sch = CreatorExt.find_by_userid(user_id)
    #sch.update_attribute('avatar', @filename)
    sch.update_attribute('category_id', usercategory)

    user_id=session[:user_id]
    @userinfo=User.select("users.avatar,creator_exts.category_id,users.sex,users.username,users.description,users.user_comment,creator_exts.tags_set,users.nickname").joins("left join creator_exts on users.id= creator_exts.userid where users.id=#{user_id}")
    @user_categories=Category.select("categories.id,categories.name").joins("where categories.parent=6")
      
 respond_to do |format|
      format.html { render :userinfo, status: :ok, location: @user}
    end
   
   end
  private
    def checklogin
    logged_in_user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      logged_in_userz
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:status, :usertype, :username, :truename, :password)
    end
    def products_layout 
    @user=User.find_by_id(session[:user_id]) 
    if @user.usertype=="0"
       return 'creator'
    else
      return 'marketer'
    end
   
 end  
end
