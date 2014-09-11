class DrawingsController < ApplicationController
  def create
    @raffle = Raffle.find_by(sig: params[:raffle_id])
    
    the_hat = []
    @raffle.players.each do |player|
      (player.tickets).times { the_hat.push(player)}
    end
    winner = the_hat[ SecureRandom.random_number(the_hat.length) ]
    puts ">", the_hat.map {|p| p.name}, winner.name, "<"
    @raffle.drawings.create(winner: winner.name, winner_id: winner.id,
      total_tickets: the_hat.length, winner_tickets: winner.tickets)

    respond_to do |format|
      format.html { redirect_to action: "show", controller: "raffles", 
        id: @raffle.sig, notice: 'Performed drawing.' }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def drawing_params
      params.require(:drawing).permit(:winner, :winner_id, :total_tickets,
        :winner_tickets, :raffle_id)
    end
end