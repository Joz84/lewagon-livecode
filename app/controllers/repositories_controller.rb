class RepositoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @batch = Batch.find_by(number: params[:batch_id].to_i)
    @repositories = @batch.repositories
  end
end

