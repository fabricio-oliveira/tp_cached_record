# frozen_string_literal: true
class FooController < ActionController::Base
  def create
    foo = Foo.create(uuid: params[:uuid], other: params[:other])
    return render json: foo.errors, status: :bad_request unless foo.errors.empty?
    render nothing: true, status: :ok
  end
end
