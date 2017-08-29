class Organization < ActiveRecord::Base
  belongs_to :user, required: true
  has_many :members, dependent: :destroy
  has_many :users, through: :members, source: :user

  validates :name, presence: true, length: { minimum:5 }
  validates :description, presence: true, length: { minimum:10 }

end
