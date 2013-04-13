# == Schema Information
#
# Table name: polls
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  rank_1_medium_id :integer
#  rank_2_medium_id :integer
#  rank_3_medium_id :integer
#  vote_1           :integer          default(0)
#  vote_2           :integer          default(0)
#  vote_3           :integer          default(0)
#  is_active        :boolean          default(TRUE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Poll < ActiveRecord::Base
  attr_accessible :client_id, :rank_1_medium_id, :rank_2_medium_id, :rank_3_medium_id, :vote_1, :vote_2, :vote_3
  belongs_to :client, :inverse_of => :polls

  def get_client_ranks
    if self.client.rank_1.present?
      self.rank_1_medium_id = self.client.rank_1.id
    end
    if self.client.rank_2.present?
      self.rank_2_medium_id = self.client.rank_2.id
    end
    if self.client.rank_3.present?
      self.rank_3_medium_id = self.client.rank_3.id
    end
  end

  def rank_1
    medium = Medium.find(self.rank_1_medium_id)
  end

  def rank_2
    medium = Medium.find(self.rank_2_medium_id)
  end

  def rank_3
    medium = Medium.find(self.rank_3_medium_id)
  end

  def add_to_vote(rank)
    if rank == 'rank_1'
      self.vote_1 += 1
    elsif rank == 'rank_2'
      self.vote_2 += 1
    elsif rank == 'rank_3'
      self.vote_3 += 1
    else
    end
  end

  def add_to_vote_1
    self.vote_1 += 1
  end

  def add_to_vote_2
    self.vote_2 += 1
  end

  def add_to_vote_3
    self.vote_3 += 1
  end

  def winner
    if vote_1 == 0 && vote_2 == 0 && vote_3 == 0
      []
    elsif vote_1 > vote_2 && vote_1 > vote_3
      [self.rank_1.id]
    elsif vote_2 > vote_1 && vote_2 > vote_3
      [self.rank_2.id]
    elsif vote_3 > vote_1 && vote_3 > vote_2
      [self.rank_3.id]
    elsif vote_1 == vote_2 && vote_1 > vote_3
      [self.rank_1.id, self.rank_2.id]
    elsif vote_1 == vote_3 && vote_1 > vote_2
      [self.rank_1.id, self.rank_3.id]
    elsif vote_2 == vote_3 && vote_2 > vote_1
      [self.rank_2.id, self.rank_3.id]
    elsif vote_1 == vote_2 && vote_1 == vote_3
      [self.rank_1.id, self.rank_2.id, self.rank_3.id]
    else
    end

  end

  def date
    self.created_at.strftime("%m/%d/%Y at %I:%M%p")
  end


end
