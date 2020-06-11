# frozen_string_literal: true

# Controller for attacks
class AttacksController < ApplicationController
  include Cwe22
  include Cwe78
  include Cwe79
  include Cwe89
  include Cwe95

  def initialize
    super
    @cwes = {
      '22' => 'Path Traversal',
      '78' => 'OS Command Injection',
      '79' => 'Cross-Site Scripting',
      '89' => 'SQL Injection',
      '95' => 'Eval Injection'
    }
  end

  def index; end

  def show
    redirect_to edit_attack_path(params[:id])
  end

  def edit
    if @cwes[params[:id]]
      send("edit_cwe#{params[:id]}")
    else
      render status: 404
    end
  end

  def update
    if @cwes[params[:id]]
      send("update_cwe#{params[:id]}")
    else
      render status: 404
    end
  end
end
