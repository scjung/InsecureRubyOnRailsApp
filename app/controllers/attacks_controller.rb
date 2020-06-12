# frozen_string_literal: true

# Controller for attacks
class AttacksController < ApplicationController
  include Cwe22
  include Cwe78
  include Cwe79
  include Cwe89
  include Cwe95
  include Cwe113

  def initialize
    super
    @cwes = {
      '22' => 'Path Traversal',
      '78' => 'OS Command Injection',
      '79' => 'Cross-Site Scripting',
      '89' => 'SQL Injection',
      '95' => 'Eval Injection',
      '113' => 'HTTP Response Splitting'
    }
  end

  def index; end

  def show
    redirect_to edit_attack_path(params[:id])
  end

  def edit
    @title = title
    if @title
      send("edit_cwe#{params[:id]}")
    else
      render status: 404
    end
  end

  def update
    @title = title
    if @title
      send("update_cwe#{params[:id]}")
    else
      render status: 404
    end
  end

  private

  def title
    title = @cwes[params[:id]]
    title ? "CWE-#{params[:id]}: #{title}" : nil
  end
end
