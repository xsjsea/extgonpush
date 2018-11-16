class Campaign < ApplicationRecord
	validates_presence_of :name, :message =>"项目名称不能为空" 
	validates_presence_of :description, :message =>"关键信息不能为空" 
	validates_presence_of :budget, :message =>"预算不能为空" 
 def new
    @campaign = Campaign.new
    @users = User.all
  end
end
