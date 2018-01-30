class Document < ApplicationRecord
  validates_presence_of :title, :file, :user_id, message: "Ops! Preencha esse Aqui!"
  belongs_to :user
  mount_uploader :file, FileUploader

  after_create :email_admin_user

  def email_admin_user
    UserMailer.email_admin_user.deliver
  end
end
