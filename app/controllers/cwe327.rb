# frozen_string_literal: true

# CWE-327
module Cwe327
  def edit_cwe327
    render :cwe327
  end

  def update_cwe327
    text = params[:text]
    if params[:length] == 'des'
      cipher = OpenSSL::Cipher::DES.new.encrypt
      @key = cipher.random_key
      @enc = cipher.update(text) + cipher.final
    else
      cipher = OpenSSL::Cipher::AES256.new(:CBC).encrypt
      @key = cipher.random_key
      cipher.random_iv
      @enc = cipher.update(text) + cipher.final
    end
    @enc = Base64.encode64(@enc)
    @key = Base64.encode64(@key)
    render :cwe327
  end
end
