class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :birth_date, :occupation, :citizenship, :description,
            presence: true, on: :profile_complete?

  validate :email_domain

  private

  def email_domain
    domain = email.split('@').last
    errors.add(:email, 'is of an invalid domain') if domain.match('am4zon.com')
  end
end
