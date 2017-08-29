class User < ActiveRecord::Base
   has_many :organizations, dependent: :destroy
   has_many :members, dependent: :destroy
   has_many :joined_organizations, through: :members, source: :organization

   has_secure_password

   before_save :downcase_fields

   validates :first_name, :last_name, presence: true, length: 2..30
   validates_format_of :first_name, :last_name, with: /\A[-a-z ']+\Z/i
   validates :email, presence: true, uniqueness: true
   validates_format_of :email,with:  /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
   validates :password, presence: true, length: { minimum: 8 }




   def downcase_fields
      self.first_name.downcase!
      self.last_name.downcase!
      self.email.downcase!
   end

end
