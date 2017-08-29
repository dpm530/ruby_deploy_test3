class Member < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :organization, required: true
end
