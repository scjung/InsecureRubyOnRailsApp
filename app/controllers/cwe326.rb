# frozen_string_literal: true

# CWE-326
module Cwe326
  def edit_cwe326
    render :cwe326
  end

  def update_cwe326
    text = params[:text]
    key =
      if params[:length] == 'short'
        OpenSSL::PKey::RSA.new(1024)
      else
        OpenSSL::PKey::RSA.new(2048)
      end
    @enc =
      Base64.encode64(
        key.public_encrypt(text, OpenSSL::PKey::RSA::PKCS1_OAEP_PADDING)
      )
    @key = key.public_key
    render :cwe326
  end
end
