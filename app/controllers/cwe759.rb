# frozen_string_literal: true

# CWE-759
module Cwe759
  def edit_cwe759
    render :cwe759
  end

  def update_cwe759
    text = params[:text]
    if params[:defense] == '1'
      @hash = BCrypt::Password.create(text)
    else
      @hash = Digest::SHA256.hexdigest(text)
    end
    render :cwe759
  end
end
