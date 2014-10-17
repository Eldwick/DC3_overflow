class User < ActiveRecord::Base
  attr_accessor :password
  before_save :encrypt_password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  def self.authenticate(email, password)
    user = User.where(email:email).first
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def questions_asked
    Question.where(user_id:id).count
  end

  def answers_given
    Answer.where(user_id:id).count
  end
end
