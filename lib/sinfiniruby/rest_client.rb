
module Sinfini

  class RestClient

    attr_reader :api_key, :host
    
    def initialize
       @api_key = Sinfini.api_key
       @host = Sinfini.host
       @sender = Sinfini.sender
    end

    def method
      'sms'
    end

    def format
      'json'
    end

    def api_url
      "/api/v3/index.php?"
    end
    

    def create(to, text)
      Net::HTTP.get(@host, (api_url + params(to, text)))
    end

    def params(to, text)
      URI.encode_www_form(
        {
         method: method,
         api_key: @api_key,
         to: to,
         sender: @sender,
         message: text,
         format: format 
        }
      )
    end

  end

end


