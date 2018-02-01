class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_account, only: [:edit, :update, :show, :destroy]

  def new
    @account = Account.new
  end

  def create
    nome = params["account"]["name"]
    email = params["account"]["email"]
    password = params["account"]["password"]
    #user = User.new(name: nome, email: email, password: password)
    #user.save
    User.create(name: nome, email: email, password: password)
    #binding.pry
    @account = Account.create(account_params)
    respond_with @account
  end

  def show
    respond_with @account
  end

  def update
    @account.update(account_params)
    respond_with @account
  end

  def destroy
    id = @account.id
    if id == current_user.id
      flash[:notice] = 'Ops!'
    else
      @account.deleted = true
      @account.save
      a = User.find(id)
      a.deleted = true
      a.save
      flash[:notice] = 'Deletado com sucesso!'
      redirect_to accounts_path
    end
  rescue
    flash[:notice] = 'Ops!'
    redirect_to accounts_path
  end

  def index
    if current_user && current_user.kind == "manager"
      @accounts = User.paginate(:page => params[:page], :per_page => 10)
                          .order(created_at: :asc).where(deleted: false)
    else

      @accounts = nil
    end
  end


  private

  def set_account
    if current_user.kind == "manager"
      @account = Account.find(params[:id])
    elsif current_user
      @account = Account.find(current_user.id)
    else
      @account = nil
    end
  end

  def account_params
    params.require(:account).permit( :name, :email, :password)
  end
end
