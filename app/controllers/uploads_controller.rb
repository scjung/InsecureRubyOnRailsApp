# frozen_string_literal: true

# Uploads Controller (CWE-434)
class UploadsController < ApplicationController
  def index
    @upload = Upload.new
    @uploads = Upload.all
  end

  def create
    upload = Upload.new
    upload.file.attach(params[:upload][:file])
    upload.save
  end
end
