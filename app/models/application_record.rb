class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class



  class << self 
    def digest(string) 
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token 
      SecureRandom.urlsafe_base64
    end
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest") 
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def remember
    self.remember_token = self.class.new_token
    update_attribute(:remember_digest, self.class.digest(remember_token))
  end

  def forget 
    update_attribute(:remember_digest, nil)
  end
end
