# frozen_string_literal: true

# CWE-79
module Cwe79
  def edit_cwe79
    render :cwe79
  end

  def update_cwe79
    @note = params[:note]
    @defense = params[:defense] == '1'
    render :cwe79
  end
end
