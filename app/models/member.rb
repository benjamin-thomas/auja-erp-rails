class Member < ApplicationRecord
  belongs_to :family

  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.search(query)
    sql_frag = 'members.first_name ILIKE :q OR members.last_name ILIKE :q OR members.email ILIKE :q'
    where(sql_frag, { q: "%#{query}%" })
  end

  def to_s
    [first_name, last_name].join(' ')
  end
end
