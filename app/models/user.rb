class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  validates :name, presence: true, format: {with: /\A[^0-50`.,~!@#\$%\^&*+_=]+\z/i, message: "Only allows letters" }
  validates :phone, format: {with: /\d[0-9]\)*\z/, message: "Only allows numbers" }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :image, ImageUploader

  has_many :categories
  has_many :tickets
  has_many :user_tickets
  has_many :tickets, through: :user_tickets
end
