class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_one :shop , dependent: :destroy
         belongs_to :city
         has_many :cart_items, through: :cart
         has_one :cart
  enum role: [
    :seller,
    :buyer,
    :admin
  ]
  # after_initialize :set_default_role, :if => :new_record?

  # def set_default_role
  #   self.role ||= :buyser
  # end
end
