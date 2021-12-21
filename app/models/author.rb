class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :name, :citizenship, presence: true
  validates :name, uniqueness: true
end
