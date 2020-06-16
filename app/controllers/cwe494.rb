# frozen_string_literal: true

# CWE-494
module Cwe494
  def edit_cwe494
    render :cwe494
  end

  def update_cwe494
    uri =
      if params[:code] == 'unsafe'
        URI.join(root_url, 'unsafe.rb')
      else
        URI.join(root_url, 'safe.rb')
      end

    code = uri.read
    @checksum = Digest::MD5.hexdigest(code)

    if params[:defense] == '1'
      if @checksum == 'a1d0c6e83f027327d8461063f4ac58a6'
        @result = eval(code)
      else
        @result = 'Checksum unmatched!'
      end
    else
      @result = eval(code)
    end
    render :cwe494
  end
end
