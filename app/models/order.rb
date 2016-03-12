class Order < ActiveRecord::Base
  validates :order_number, presence: true,
                           length: { minimum: 1 }
  validates :type, presence: true,
                   length: { minimum: 1 }
  belongs_to :customer
  belongs_to :warehouse
end
