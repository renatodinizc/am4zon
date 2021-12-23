class BookCollection < ApplicationRecord
  belongs_to :book1, class_name: 'Book'
  belongs_to :book2, class_name: 'Book'
  belongs_to :book3, class_name: 'Book'
  belongs_to :book4, class_name: 'Book', optional: true
  belongs_to :book5, class_name: 'Book', optional: true
  belongs_to :book6, class_name: 'Book', optional: true
  belongs_to :book7, class_name: 'Book', optional: true

  validates :title, :description, presence: true
  validates :title, uniqueness: true
  validate :uniq_collection?

  private

  def uniq_collection?
    error_message = 'Collection cannot have duplicated items'
    set = [book1, book2, book3, book4, book5, book6, book7].compact
    errors.add(:base, error_message) unless set.length == set.uniq.length
  end
end
