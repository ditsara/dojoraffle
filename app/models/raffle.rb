class Raffle < ActiveRecord::Base
  has_many :players, dependent: :destroy, primary_key: "sig"
  accepts_nested_attributes_for :players, :reject_if => :players_filter, :allow_destroy => true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates_presence_of :sig

  def players_filter(a)
    a[:name].blank? || a[:tickets].blank?
  end
end
