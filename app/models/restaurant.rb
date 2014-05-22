class Restaurant < ActiveRecord::Base
  validates :name, presence: true, format: { with: /\A[A-Z]/, message: 'must begin with a capital letter' }
  validates :address, presence: true, length: { minimum: 3 }
  validates :cuisine, presence: true
  has_many  :reviews

  def average_rating
    if reviews.any?
      #  Full method:
      # reviews.inject(0) { |total, review| 
      #     total + review.rating
      #   } / reviews.count.to_f
        reviews.average(:rating)
    else
      'N/A'
    end
  end
end
