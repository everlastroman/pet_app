class User < ApplicationRecord
  ADMIN     = 'admin'.freeze
  MEMBER    = 'member'.freeze
  MODERATOR = 'moderator'.freeze

  ROLES = [ADMIN, MEMBER, MODERATOR].freeze

  enum role: { member: MEMBER, admin: ADMIN, moderator: MODERATOR }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  validates :role, inclusion: { in: roles.values }

  def full_name
    "#{first_name} #{last_name}"
  end
end
