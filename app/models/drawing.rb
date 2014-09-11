class Drawing < ActiveRecord::Base
  belongs_to :raffle, primary_key: "sig"
end
