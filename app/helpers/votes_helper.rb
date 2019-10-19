module VotesHelper
  def user_vote
    !ActsAsVotable::Vote.where(voter_id: current_user, votable_id: @post.id).present?
  end
end
