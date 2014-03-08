require 'sinatra'
require 'json'
require 'active_support/core_ext/hash/indifferent_access'

class TwilioApp < Sinatra::Base
  post '/send_sms' do
    content_type :json
    payload = JSON.parse(request.body.read).with_indifferent_access
    request_id = payload[:request_id]

    begin
      # Add real Twilio calls here later
      raise "Simulated problem" # HACK - for testing error handling
    rescue
      status 500
      return { request_id: request_id, summary: "Unable to send SMS message" }.to_json + "\n"
    end

    # acknowledge the successful delivery of the message
    { request_id: request_id, summary: "SMS message sent" }.to_json + "\n"
  end
end