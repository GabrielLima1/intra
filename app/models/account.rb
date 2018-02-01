class Account < ApplicationRecord
  validates_presence_of :name, :email, :password, message: "Ops! Preencha esse Aqui!"
  validates :email, uniqueness: {  message: "Este E-mail já Existe!" }

  default_value_for :deleted, false
end
