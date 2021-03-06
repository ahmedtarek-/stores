class Store < ActiveRecord::Base
  has_many :spaces

  validates :title, presence: true
  validates :city, presence: true
  validates :street, presence: true
end