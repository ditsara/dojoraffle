class RafflesController < ApplicationController
  before_action :set_raffle, only: [:show, :edit, :update, :destroy]

  # GET /raffles
  # GET /raffles.json
  # this will be deleted / moved to admin only interface
  def index
    @raffles = Raffle.all
  end

  # Show raffles only by their signature to provide a small amount of security
  # GET /raffles/8nvP59hpJdZ2Czabyvxh..
  def show
    @new_player = @raffle.players.build
  end

  # GET /raffles/new
  def new
    @raffle = Raffle.new
  end

  # GET /raffles/8nvP59hpJdZ2Czabyvxh../edit
  def edit
  end

  # POST /raffles
  # POST /raffles.json
  def create
    @raffle = Raffle.new(raffle_params)
    @raffle.sig = SecureRandom.urlsafe_base64 64

    respond_to do |format|
      if @raffle.save
        UserMailer.create_raffle(@raffle).deliver
        format.html { redirect_to action: "show", id: @raffle.sig, notice: 'Raffle was successfully created.' }
        # format.json { render :show, status: :created, location: @raffle }
      else
        format.html { render :new }
        # format.json { render json: @raffle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /raffles/1
  # PATCH/PUT /raffles/1.json
  def update
    respond_to do |format|
      if @raffle.update(raffle_params)
        format.html { redirect_to action: "show", id: @raffle.sig, notice: 'Raffle was successfully updated.' }
        # format.json { render :show, status: :ok, location: @raffle }
      else
        format.html { render :show }
        # format.json { render json: @raffle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raffles/1
  # DELETE /raffles/1.json
  def destroy
    @raffle.destroy
    respond_to do |format|
      format.html { redirect_to action: "new", notice: 'Raffle was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_raffle
      # replace finding by id with signature to provide security through obscurity
      @raffle = Raffle.find_by(sig: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def raffle_params
      params.require(:raffle).permit(:sig, :email,
        players_attributes: [:id, :name, :tickets, :_destroy],
        drawings_attributes: [])
    end
end
