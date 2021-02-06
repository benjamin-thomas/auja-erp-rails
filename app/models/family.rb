class Family < ApplicationRecord
  def self.search(query)
    where('families.name ILIKE ?', "%#{query}%")
  end
end
