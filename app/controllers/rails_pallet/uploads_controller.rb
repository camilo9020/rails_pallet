module RailsPallet
  class UploadsController < ApplicationController
    self.responder = RailsPalletResponder
    respond_to :json

    skip_before_action :verify_authenticity_token

    def create
      new_upload = RailsPallet::Upload.create(permitted_params)
      respond_with new_upload, status: :created
    end

    private

    def permitted_params
      params.permit(:file)
    end
  end
end
