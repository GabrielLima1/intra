class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  skip_before_filter :require_no_authentication, only: [:new, :create, :index, :update]

  def new
    super
  end

  def create_user
    @user = User.new(:email => params[:email], :password => params[:password], :kind => params[:kind], :name => params[:name] )
    @user.save
    #redirect_to documents_path, alert: "Documento deletado com Sucesso"
  end

  def index
    @users = User.all
  end
end
