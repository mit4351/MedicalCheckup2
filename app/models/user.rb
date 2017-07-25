class User < ApplicationRecord
    before_save { enpno.downcase! }
    
    has_secure_password
    
    # for authlogic
    acts_as_authentic do |c|
        c.login_field = :enpno
    end

    def self.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def self.encrypt(token)
        Digest::SHA1.hexdigest(token.to_s)
    end
end
