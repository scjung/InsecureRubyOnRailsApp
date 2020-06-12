# frozen_string_literal: true

# CWE-113
module Cwe113
  def edit_cwe113
    render :cwe113
  end

  def update_cwe113
    type = params[:type]
    response.set_header('Content-Type', type)
    # or response.headers['Content-Type'] = ...
    render :cwe113
  end
end
