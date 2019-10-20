class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :massages
         has_many :group_users
         has_many :groups, through: :group_users
end
