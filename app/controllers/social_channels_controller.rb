class SocialChannelsController < ApplicationController
  before_action :set_social_channel, only: [:show, :edit, :update, :destroy]

  # GET /social_channels
  # GET /social_channels.json
  def index
    @social_channels = SocialChannel.all
  end

  # GET /social_channels/1
  # GET /social_channels/1.json
  def show
  end

  # GET /social_channels/new
  def new
    @social_channel = SocialChannel.new
  end

  # GET /social_channels/1/edit
  def edit
  end

  # POST /social_channels
  # POST /social_channels.json
  def create
    @social_channel = SocialChannel.new(social_channel_params)

    respond_to do |format|
      if @social_channel.save
        format.html { redirect_to @social_channel, notice: 'Social channel was successfully created.' }
        format.json { render :show, status: :created, location: @social_channel }
      else
        format.html { render :new }
        format.json { render json: @social_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_channels/1
  # PATCH/PUT /social_channels/1.json
  def update
    respond_to do |format|
      if @social_channel.update(social_channel_params)
        format.html { redirect_to @social_channel, notice: 'Social channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @social_channel }
      else
        format.html { render :edit }
        format.json { render json: @social_channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_channels/1
  # DELETE /social_channels/1.json
  def destroy
    @social_channel.destroy
    respond_to do |format|
      format.html { redirect_to social_channels_url, notice: 'Social channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_channel
      @social_channel = SocialChannel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def social_channel_params
      params.require(:social_channel).permit(:name)
    end
end
