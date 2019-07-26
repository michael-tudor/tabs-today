class User < ApplicationRecord
  # rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :marks, dependent: :destroy

  # def admin?
  #   has_role?(:admin)
  # end

  # def client?
  #   has_role?(:client)
  # end

  # def user?
  #   has_role?(:user)
  # end
end