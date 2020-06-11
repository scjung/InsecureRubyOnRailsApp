# frozen_string_literal: true

# CWE-95
module Cwe95
  def edit_cwe95
    render :cwe95
  end

  def update_cwe95
    expr = params[:expr]
    val = eval expr
    @result = "#{expr} = #{val}"
    render :cwe95
  end
end
