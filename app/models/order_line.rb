class OrderLine < ApplicationRecord
    belongs_to :order
    has_one :user, :through =>:order, foreign_key: 'user_id'
    validates :item_name, presence: true
    validates :quantity, presence: true
  end
  