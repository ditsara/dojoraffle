class Player < ActiveRecord::Base
  belongs_to :raffle, primary_key: "sig"
  validates_presence_of :name
  validates :tickets, :numericality => { greater_than: 0 }
end
