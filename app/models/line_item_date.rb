class LineItemDate < ApplicationRecord
  belongs_to :quote
  has_many :line_items, dependent: :destroy

  validates :date, presence: true, uniqueness: { scope: :quote_id }

  scope :ordered, -> { order(date: :asc) }

  def previous_date
    quote.line_item_dates.where('date < ?', date).order(date: :desc).first
  end
end
