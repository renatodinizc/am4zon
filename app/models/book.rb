class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre

  validates :title, :description, presence: true
end
