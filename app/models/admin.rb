class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :email_domain

  private

  def email_domain
    domain = email.split('@').last
    error_message = 'is of an invalid domain'
    return errors.add(:email, error_message) unless domain.match('am4zon.com')
  end
end
