class Restaurant < ActiveRecord::Base
  validates :name, presence: true, format: { with: /\A[A-Z]/ }
  validates :address, presence: true, length: { minimum: 3 }
  validates :cuisine, presence: true
end
