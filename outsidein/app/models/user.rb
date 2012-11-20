class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_confirmation_of :password, :message => "Passwords should match", :if => :password
  validates_presence_of :username, :message => "Username cannot be empty"
  validates_presence_of :email, :message => "Email cannot be empty"

  ROLES = %w[user admin]

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
