class LineItem < ApplicationRecord
  belongs_to :line_item_date
  has_one :quote, through: :line_item_date

  validates :name, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :unit_price, presence: true, numericality: { greater_than: 0 }
end
