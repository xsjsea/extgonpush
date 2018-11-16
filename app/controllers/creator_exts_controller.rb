class CreatorExtsController < ApplicationController
  before_action :set_creator_ext, only: [:show, :edit, :update, :destroy]

  # GET /creator_exts
  # GET /creator_exts.json
  def index
    @creator_exts = CreatorExt.all
  end

  # GET /creator_exts/1
  # GET /creator_exts/1.json
  def show
  end

  # GET /creator_exts/new
  def new
    @creator_ext = CreatorExt.new
  end

  # GET /creator_exts/1/edit
  def edit
  end

  # POST /creator_exts
  # POST /creator_exts.json
  def create
    @creator_ext = CreatorExt.new(creator_ext_params)

    respond_to do |format|
      if @creator_ext.save
        format.html { redirect_to @creator_ext, notice: 'Creator ext was successfully created.' }
        format.json { render :show, status: :created, location: @creator_ext }
      else
        format.html { render :new }
        format.json { render json: @creator_ext.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creator_exts/1
  # PATCH/PUT /creator_exts/1.json
  def update
    respond_to do |format|
      if @creator_ext.update(creator_ext_params)
        format.html { redirect_to @creator_ext, notice: 'Creator ext was successfully updated.' }
        format.json { render :show, status: :ok, location: @creator_ext }
      else
        format.html { render :edit }
        format.json { render json: @creator_ext.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creator_exts/1
  # DELETE /creator_exts/1.json
  def destroy
    @creator_ext.destroy
    respond_to do |format|
      format.html { redirect_to creator_exts_url, notice: 'Creator ext was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creator_ext
      @creator_ext = CreatorExt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creator_ext_params
      params.require(:creator_ext).permit(:userid, :tags_set, :avatar, :category_id)
    end
end
