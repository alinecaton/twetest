# encoding: utf-8
class TweetsController < ApplicationController
  def create
    @tweet = Tweet.new params[:tweet]

    if @tweet.save
      flash[:notice] = "Teewt criado com sucesso"
      redirect_to @tweet.user
    else
      flash.now[:error] = @tweet.errors.full_messages.join(', ')
       @user = @tweet.user
       @tweets = @user.tweets
       render 'users/show'
    end
  end

  def destroy
    @tweet = Tweet.find params[:id]
    @tweet.destroy
    flash[:notice] = "Tweet excluído com sucesso."
    redirect_to @tweet.user
  end
end
















