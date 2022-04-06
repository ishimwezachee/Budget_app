class Category < ApplicationRecord
    belongs_to :user
    has_many :fundings
    def total_funds
        fundings.sum(:amount)
    end
end
