json.array!(@raffles) do |raffle|
  json.extract! raffle, :id, :sig, :email
  json.url raffle_url(raffle, format: :json)
end
