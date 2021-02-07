class Family < ApplicationRecord
  has_many :members

  def self.search(query)
    where('families.name ILIKE ?', "%#{query}%")
  end
end
