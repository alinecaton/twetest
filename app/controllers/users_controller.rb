# encoding: utf-8

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find params[:id]
    @tweets = @user.tweets.order('created_at DESC')

    @tweet = Tweet.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]

    if @user.save
      flash[:notice] = 'Usuario criado com sucesso!'
      redirect_to @user
    else
      flash.now[:error] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]

    if @user.update_attributes params[:user]
      flash[:notice] = "Usuário atualizado com sucesso!"
      redirect_to @user
    else
      flash.now[:error] = @user.errors.full_messages.join (', ')
      render :edit
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:notice] = "Usuário excluido com sucesso"
    redirect_to users_url
  end
end
