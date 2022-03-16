class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def show
    @user = User.find(params[:user_id])
    @contact = Contact.find(params[:id])
    @phones = Phone.where(contact_id: @contact.id)
  end

  def new
    @user = User.find(params[:user_id])
    @contact = Contact.new
  end

  def create
    @user = User.find(params[:user_id])
    @contact = @user.contacts.new(contact_params)

    if @contact.save
      redirect_to "/users/#{@contact.user_id}/contacts/#{@contact.id}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @contact = Contact.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      redirect_to "/users/#{@contact.user_id}/contacts/#{@contact.id}"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :birthday, :user_id)
  end

end
