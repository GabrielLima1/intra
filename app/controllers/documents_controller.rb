class DocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_document, only: [:edit, :update, :show, :destroy]

  def new
    @document = Document.new
  end

  def create
    @document = Document.create(document_params)
    respond_with @document
  end

  def show
    respond_with @document
  end

  def update
    @document.update(document_params)
    respond_with @document
  end

  def destroy
    @document.destroy
    redirect_to documents_path, alert: "Documento deletado com Sucesso"
  rescue
    redirect_to documents_path, alert: "Não foi possivel deletar o Documento!"
  end

  def index
    if current_user.kind == "manager"
      @documents = Document.paginate(:page => params[:page], :per_page => 10)
                          .order(created_at: :asc)
    else
      @documents = Document.paginate(:page => params[:page], :per_page => 10)
                          .order(created_at: :asc).where(user_id: current_user.id)
    end
  end


  private

  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.require(:document).permit(:title, :file, :description, :user_id)
  end

end
