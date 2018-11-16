class CasesController < ApplicationController
  before_action :set_case, only: [:show, :edit, :update, :destroy]
  layout :products_layout

  # GET /cases
  # GET /cases.json
  def index
    #@cases = Case.all
     current_user
    #@reports = Report.all
    @cases =Case.select("cases.id,cases.case_title,cases.id,users.username")
    .joins("left join users on cases.case_author=users.id where cases.case_author=#{@current_user.id}")

  end

  # GET /cases/1
  # GET /cases/1.json
  def show
     current_user
    #@reports = Report.all
    @reports =Report.select("reports.report_title,reports.id,users.username")
    .joins("left join users on reports.report_author=users.id where reports.report_author=#{@current_user.id}")
 
  end

  # GET /cases/new
  def new
  
    current_user
   @case = Case.new
  end

  # GET /cases/1/edit
  def edit
      current_user
    @reports =Report.select("reports.report_title,reports.id,users.username")
    .joins("left join users on reports.report_author=users.id where reports.report_author=#{@current_user.id}")
 
  end

  # POST /cases
  # POST /cases.json
  def create
    @case = Case.new(case_params)

    respond_to do |format|
      if @case.save
        format.html { redirect_to @case, notice: 'Case was successfully created.' }
        format.json { render :show, status: :created, location: @case }
      else
        format.html { render :new }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cases/1
  # PATCH/PUT /cases/1.json
  def update
    respond_to do |format|
      if @case.update(case_params)
        format.html { redirect_to @case, notice: 'Case was successfully updated.' }
        format.json { render :show, status: :ok, location: @case }
      else
        format.html { render :edit }
        format.json { render json: @case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cases/1
  # DELETE /cases/1.json
  def destroy
    @case.destroy
    respond_to do |format|
      format.html { redirect_to cases_url, notice: 'Case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_case
      @case = Case.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def case_params
      params.require(:case).permit(:case_author, :case_date, :case_title, :case_content, :case_status, :case_modified, :case_type)
    end
      def products_layout 
       return 'creator'
 end  
end
