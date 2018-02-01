class User < ApplicationRecord
  #validates_presence_of :email, :password, message: "Ops! Preencha esse Aqui!"
  has_many :documents
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  default_value_for :kind, "client"
  default_value_for :deleted, false

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
end
