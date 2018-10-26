class Url < ApplicationRecord
  validates :url, uniqueness: true
  has_many :questions
  def self.search(search)
    if search
      Url.where(['url = ?', "#{search}"])
    else
      Url.all
    end
  end
end
