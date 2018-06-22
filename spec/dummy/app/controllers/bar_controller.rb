# frozen_string_literal: true
class BarController < ActionController::Base
  def create
    bar = Bar.create(uuid: params[:uuid], other: params[:other])
    return render json: foo.errors, status: :bad_request unless bar.errors.empty?
    render nothing: true, status: :ok
  end
end
