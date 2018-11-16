class MarketerExtsController < ApplicationController
  before_action :set_marketer_ext, only: [:show, :edit, :update, :destroy]

  # GET /marketer_exts
  # GET /marketer_exts.json
  def index
    @marketer_exts = MarketerExt.all
  end

  # GET /marketer_exts/1
  # GET /marketer_exts/1.json
  def show
  end

  # GET /marketer_exts/new
  def new
    @marketer_ext = MarketerExt.new
  end

  # GET /marketer_exts/1/edit
  def edit
  end

  # POST /marketer_exts
  # POST /marketer_exts.json
  def create
    @marketer_ext = MarketerExt.new(marketer_ext_params)

    respond_to do |format|
      if @marketer_ext.save
        format.html { redirect_to @marketer_ext, notice: 'Marketer ext was successfully created.' }
        format.json { render :show, status: :created, location: @marketer_ext }
      else
        format.html { render :new }
        format.json { render json: @marketer_ext.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marketer_exts/1
  # PATCH/PUT /marketer_exts/1.json
  def update
    respond_to do |format|
      if @marketer_ext.update(marketer_ext_params)
        format.html { redirect_to @marketer_ext, notice: 'Marketer ext was successfully updated.' }
        format.json { render :show, status: :ok, location: @marketer_ext }
      else
        format.html { render :edit }
        format.json { render json: @marketer_ext.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marketer_exts/1
  # DELETE /marketer_exts/1.json
  def destroy
    @marketer_ext.destroy
    respond_to do |format|
      format.html { redirect_to marketer_exts_url, notice: 'Marketer ext was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marketer_ext
      @marketer_ext = MarketerExt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marketer_ext_params
      params.require(:marketer_ext).permit(:userid, :category_id, :companyname, :companyaddress, :taxcode, :bankname, :bankaccount, :contactname, :contactmobile)
    end
end
