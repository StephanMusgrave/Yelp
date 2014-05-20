class Restaurant < ActiveRecord::Base
  validates :name, presence: true, format: { with: /\A[A-Z]/, message: 'must begin with a capital letter' }
  validates :address, presence: true, length: { minimum: 3 }
  validates :cuisine, presence: true
end
