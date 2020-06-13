# frozen_string_literal: true

# CWE-78
module Cwe78
  def edit_cwe78
    render :cwe78
  end

  def update_cwe78
    dir = Rails.public_path.join('notes')
    pattern = params[:pattern]
    if params[:defense] == '1'
      if pattern.match(/^[A-Za-z]+$/)
        cmd = "cd #{dir}; grep '#{pattern}' *.txt"
        @result = `#{cmd}`
      else
        @result = 'Invalid pattern.'
      end
    else
      cmd = "cd #{dir}; grep '#{pattern}' *.txt"
      @result = `#{cmd}`
    end

    render :cwe78
  end
end
