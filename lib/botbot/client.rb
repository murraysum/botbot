module Botbot
  class Client

    def self.get(data)
      url = "https://www.google.com/speech-api/v1/recognize?xjerr=1&client=speech2text&lang=en"
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri)
      request.body = data
      request.content_type = 'audio/x-flac; rate=16000'
      http.use_ssl = true 
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      response = http.request(request)
      json_response = JSON.parse(response.body)
      hypotheses = json_response["hypotheses"]

      if !hypotheses.nil? && hypotheses.any?
        utterance = hypotheses.first["utterance"]
      else
        Botbot.log("No utterance")
        nil
      end
    end
  end
end