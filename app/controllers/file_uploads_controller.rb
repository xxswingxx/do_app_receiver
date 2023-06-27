# frozen_string_literal: true

# Receive a file in multipart format from DO app platform and saves it into the public folder
class FileUploadsController < ApplicationController
  skip_before_action :verify_authenticity_token
  http_basic_authenticate_with name: 'strapi', password: '12345'

  def create
    FileUtils.cp(params[:data].tempfile.path, Rails.root.join('tmp', 'uploads',"#{Time.zone.now.to_i}-#{params[:data].original_filename}"))

    render(json: { status: :file_uploaded })
  end
end
