class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
          enum role: [:member, :organizer, :admin, :superadmin]

          has_many :admin
          has_many :organizer
          has_many :member


end
