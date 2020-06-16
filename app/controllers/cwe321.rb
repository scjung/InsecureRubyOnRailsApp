# frozen_string_literal: true

# CWE-321
module Cwe321
  def edit_cwe321
    render :cwe321
  end

  def update_cwe321
    text = params[:text]
    digest = Digest::SHA256.new
    if params[:defense] == '1'
      cipher = OpenSSL::Cipher::AES256.new(:CBC).encrypt
      key = Rails.application.credentials.dig(:cwe321_key)
      cipher.key = digest.digest(key)
      cipher.random_iv
      @enc = cipher.update(text) + cipher.final
    else
      cipher = OpenSSL::Cipher::AES256.new(:CBC).encrypt
      cipher.key = digest.digest('cwe321')
      cipher.random_iv
      @enc = cipher.update(text) + cipher.final
    end
    @enc = Base64.encode64(@enc)
    render :cwe321
  end
end
