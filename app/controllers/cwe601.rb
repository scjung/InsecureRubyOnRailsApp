# frozen_string_literal: true

# CWE-601
module Cwe601
  def edit_cwe601
    render :cwe601
  end

  def update_cwe601
    url = params[:url]
    if params[:defense]
      if url.match(%r{^/[a-z]+$})
        redirect_to url
      else
        render :cwe601
      end
    else
      redirect_to url
    end
  end
end
