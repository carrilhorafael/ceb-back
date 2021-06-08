class JsonWebToken
    Secret = 'asdasdasdfabdgfbjdfbvxckvjkaqsdgjkcvbjksfdjdbgk'

    def self.encode(payload)
        JWT.encode(payload, Secret)
    end

    def self.decode(token)
        begin
            JWT.decode(token, Secret)
        rescue => exception
            nil
        end
    end
end