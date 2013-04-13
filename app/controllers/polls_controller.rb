class PollsController < ApplicationController
  def create
    @poll = Poll.new
    client = @auth.client
    @poll.client = client
    @poll.save
    @poll.get_client_ranks
    @poll.save
    redirect_to(polls_path)
  end
  def index
    @user = User.new
    @polls = Poll.where(:client_id => @auth.id)
  end
  def show
    @user = User.new
    @poll = Poll.find(params[:id])
  end
  def update_poll
    rank = params[:poll_rank]
    @poll = Poll.find(params[:id])
    @poll.add_to_vote(rank)
    @poll.save
    @user = User.new
  end
end