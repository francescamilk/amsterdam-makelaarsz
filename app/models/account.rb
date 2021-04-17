class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :company, presence: true
  
  has_one_attached :photo
  has_many :properties

  def full_name
    "#{first_name} #{last_name}"
  end
end
