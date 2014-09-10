class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def create_raffle(raffle)
    @raffle = raffle
    mail(to: @raffle.email, subject: 'New Dojo Raffle')
  end
end
