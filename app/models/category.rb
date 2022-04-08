class Category < ApplicationRecord
  belongs_to :user
  has_many :fundings
  validates :name, presence: true
  def total_funds
    fundings.sum(:amount)
  end
end
