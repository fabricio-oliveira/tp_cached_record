# frozen_string_literal: true
class PepeController < ActionController::Base
  def create
    Pepe.create!(uuid: params[:uuid], other: params[:other])
    render nothing: true, status: :ok
  end
end
