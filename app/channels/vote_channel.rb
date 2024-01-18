class VoteChannel < ApplicationCable::Channel
  def subscribed
    stream_from "vote_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def vote_count(data)
    ActionCable.server.broadcast "vote_channel", data['vote_count'], data['candidate_id']
  end
end
