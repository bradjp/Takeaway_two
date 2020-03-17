require 'twilio-ruby'
require 'dotenv/load'

client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])

from = ENV['TWILIO_NUMBER']
to = ENV['TWILIO_CUSTOMER']

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)