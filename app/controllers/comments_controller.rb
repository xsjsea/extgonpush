class CommentsController < ApplicationController
   before_action :checklogin
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  layout :products_layout

  
  # GET /comments
  # GET /comments.json
  def index
  #  @comments = Comment.all
  current_user
  if @current_user.usertype=="1"
@comments=Comment.select("campaigns.name, comments.comment_content,users.username,comments.created_at
 ").joins("left join users on comments.user_id=users.id left JOIN orders
 on comments.order_id=orders.id left join campaigns
 on orders.campaign_id=campaigns.id where comments.order_id is not NULL and orders.marketer_id=#{@current_user.id} and comments.user_id not in ( #{@current_user.id})")
  
  else
  @comments=Comment.select("campaigns.name, comments.comment_content,users.username,comments.created_at
 ").joins("left join users on comments.user_id=users.id left JOIN orders
 on comments.order_id=orders.id left join campaigns
 on orders.campaign_id=campaigns.id where comments.order_id is not NULL and orders.creator_id=#{@current_user.id} and comments.user_id not in (#{@current_user.id})")
  end
   @comments = @comments.paginate(:page => params[:page], :per_page => 10)
  end


  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def checklogin
    logged_in_user
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      logged_in_user
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:post_id, :comment_content, :user_id)
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
