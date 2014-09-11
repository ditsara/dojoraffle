class PlayersController < ApplicationController
  before_action :set_player, only: [:destroy]

  def destroy
    @raffle = @player.raffle
    @player.destroy
    respond_to do |format|
      format.html { redirect_to controller: "raffles", action: "show",
        id: @raffle.sig}
    end
  end

  private
  
    def set_player
      @player = Player.find(params[:id])
    end
    # whitelist name and tickets only
    def player_params
      params.require(:player).permit(:name, :tickets, :raffle_id)
    end
end