# frozen_string_literal: true

# CWE-134
module Cwe134
  def edit_cwe134
    render :cwe134
  end

  def update_cwe134
    label = params[:label]
    user = User.first
    if params[:defense] == '1'
      user = { label: label, name: user.name,
               password: user.password_digest }
      @result = format('%<label>s %<name>s', user)
    else
      user = { name: user.name, password: user.password_digest }
      @result = format("#{label} %<name>s", user)
    end

    render :cwe134
  end
end
