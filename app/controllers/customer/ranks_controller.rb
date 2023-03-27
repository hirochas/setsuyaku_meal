class Customer::RanksController < ApplicationController

  def index
  # 投稿のいいね数ランキング
    @all_ranks = Resipe.find(Like.group(:resipe_id).order('count(resipe_id) desc').limit(5).pluck(:resipe_id))
  end
end
