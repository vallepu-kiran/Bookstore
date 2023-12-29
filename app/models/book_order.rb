class BookOrder < ApplicationRecord
  belongs_to :order
  belongs_to :Book 
end
