class User < ApplicationRecord
    attr_accessor :remember_token, :activation_token
    before_save :downcase_email
    before_create :create_activation_digest
    validates(
        :name,
        presence: true,
        length: { maximum: 50 },
    )
    validates(
        :email,
        presence: true,
        length: { maximum: 255 },
        format: { with: URI::MailTo::EMAIL_REGEXP },
        uniqueness: true,
    )
    validates(
        :password,
        presence: true,
        length: { minimum: 8 },
        allow_nil: true,
    )
    has_secure_password

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
        SecureRandom.urlsafe_base64
    end

    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
        remember_digest
    end

    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end

    def forget
        update_attribute(:remember_digest, nil)
    end

    def session_token
        remember_digest || remember
    end

    private
        def downcase_email
            self.email = email.downcase
        end

        def create_activation_digest
            self.activation_token = User.new_token
            self.activation_digest = User.digest(activation_token)
        end
end
