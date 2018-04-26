class TweetsController < ApplicationController
  def index
    @tweet = current_user.tweets.build if signed_in?
    render "static_pages/home"
  end

  def new
    @tweet = Tweet.new()
  end

  def create
    @tweet= Tweet.new(tweet_params)
    if @tweet.save
      flash[:success] = "Tweet posted!"
      redirect_to root_url
    else
      flash[:danger] = @tweet.errors.full_messages.to_sentence
      redirect_to root_url
    end
  end


  def destroy
    @tweet.destroy
    redirect_to root_url
  end

  private

  def tweet_params
    params.require(:tweet).permit(:post_time, :content)
  end

end
