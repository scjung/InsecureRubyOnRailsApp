# frozen_string_literal: true

# Controller for users
class AttacksController < ApplicationController
  def index
    @cwes = { 22 => 'Path Traversal',
              78 => 'OS Command Injection',
              79 => 'Cross-Site Scripting' }
  end

  def show
    case params[:id]
    when '22'
      show_cwe22
    else
      render :"cwe#{params[:id]}"
    end
  end

  def update
  end


  private

  def show_cwe22
    dir = Rails.public_path.join('notes')
    @notes = Dir.glob('*.txt', base: dir)
    render :cwe22
  end
end
