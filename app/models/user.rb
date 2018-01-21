class User < ApplicationRecord
  #validates_presence_of :email, :password, message: "Ops! Preencha esse Aqui!"
  has_many :documents
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  default_value_for :kind, "client"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
