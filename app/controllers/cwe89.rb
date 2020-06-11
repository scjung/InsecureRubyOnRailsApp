# frozen_string_literal: true

# CWE-89
module Cwe89
  def edit_cwe89
    @user = Article.first.user.name
    render :cwe89
  end

  def update_cwe89
    query = params[:query]
    @user = Article.first.user.name
    @article =
      if params[:defense] == '1'
        Article.joins(:user)
               .where('users.name LIKE ?', "%#{query}%")
               .order(updated_at: :desc)
               .first
      else
        Article.joins(:user)
               .where("users.name LIKE '%#{query}%'")
               .order(updated_at: :desc)
               .first
      end
    render :cwe89
  end
end
