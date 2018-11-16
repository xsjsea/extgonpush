class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
def my_messages 
@messages=User.select("users.id,users.username,users.description,creator_exts.avatar,view_metric.fans, view_metric.reader,view_metric.price")
 .joins("left join view_metric on users.id = view_metric.creator_id left join creator_exts on users.id = creator_exts.userid where users.usertype='0'") 

@messages = @messages.paginate(page: params[:page], per_page: 1)

# @messages = Information.where(:user_id => @user_expand.user_id).order("created_at desc").paginate(page: params[:page], per_page: 7)   
 #@mess = Information.where(:user_id => @user_expand.user_id)    
 respond_to do |format| 
 # <- 这里      
 format.html #这是默认请求的处理，渲染html(my_messages.html.erb)     
 format.js 
 # 
 # # <- 这里是ajax请求处理，渲染js模板(my_messages.js.erb)   
 end 
end




  # GET /tasks
  # GET /tasks.json
  def index
    count=0
    count=15/count
    #@tasks = Task.all
    @tasks = Task.paginate(:page => params[:page], :per_page => 2)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def sendemail
#@nm=NotificationMailer.new
#@nm.sendemail
NotificationMailer.send
#UserMailer.account_activation.deliver_now
  respond_to do |format|
      format.html  
    end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :duration, :due_date, :complete,:testAdd)
    end
end
