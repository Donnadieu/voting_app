class VotesController < ApplicationController
  skip_before_action :check_session_timeout, only: [:index]
  skip_before_action :current_user, only: [:index]
  skip_before_action :check_session, only: [:index]

  def index
    @results = Candidate.joins(:votes).group(:name).order('count(votes.id) desc').count
  end

  # GET /votes/new
  def new
    @candidates = Candidate.all
    @candidate = Candidate.new
    @candidate.votes.build
    @vote = Vote.new
  end

  # POST /votes or /votes.json
  def create
    @vote = Vote.new(vote_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @vote.save
        format.html { redirect_to new_vote_path, notice: "Vote was casted for #{@vote.candidate.name}." }
      else
        format.html { redirect_to new_vote_path, notice: @vote.errors.full_messages.join(', ') }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def vote_params
      params
        .require(:vote)
        .permit(:candidate_id, :user_id)
    end
end
