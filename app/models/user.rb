class User < ApplicationRecord
   has_many :entries
   has_secure_password

   validates :name, presence: true
   validates :email, presence: true, uniqueness: true
end
