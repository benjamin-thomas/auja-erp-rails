class Family < ApplicationRecord
  has_many :members

  validates :name, presence: true

  def self.search(query)
    where('families.name ILIKE ?', "%#{query}%")
  end

  def to_s
    name
  end
end
