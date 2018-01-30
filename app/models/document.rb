class Document < ApplicationRecord
  validates_presence_of :title, :file, :user_id, message: "Ops! Preencha esse Aqui!"
  belongs_to :user
  
  mount_uploader :file, FileUploader
end
