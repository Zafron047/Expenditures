class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :expenses, foreign_key: 'author_id'
  has_many :groups

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
end
