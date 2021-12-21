class Genre < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :title, uniqueness: true, presence: true
end
