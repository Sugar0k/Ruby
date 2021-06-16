class Mark < ApplicationRecord
  belongs_to :post

  validates :points, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
end
