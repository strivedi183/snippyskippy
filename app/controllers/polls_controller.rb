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
    @polls = Poll.where(:client_id => @auth.client.id).order(:created_at).reverse
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
    flash[:message] = "Thank you for voting for #{@poll.client.user.name}'s hairstyle!"
  end
  def end_poll
    poll = Poll.find(params[:id])
    poll.is_active = false
    poll.save
    @polls = Poll.where(:client_id => @auth.client.id).order(:created_at).reverse
  end
end