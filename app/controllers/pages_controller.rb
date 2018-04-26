class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @tweets = Tweet.all.order(:post_time)
    @tweet = Tweet.new
  end
end
