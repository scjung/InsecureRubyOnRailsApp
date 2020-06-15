# frozen_string_literal: true

# Controller for attacks
class AttacksController < ApplicationController
  include Cwe22
  include Cwe78
  include Cwe79
  include Cwe89
  include Cwe90
  include Cwe95
  include Cwe113
  include Cwe134
  include Cwe326
  include Cwe327
  include Cwe601
  include Cwe643

  def initialize
    super
    @cwes = {
      '22' => 'Path Traversal',
      '78' => 'OS Command Injection',
      '79' => 'Cross-Site Scripting',
      '89' => 'SQL Injection',
      '90' => 'LDAP Injection',
      '95' => 'Eval Injection',
      '113' => 'HTTP Response Splitting',
      '134' => 'Format String Injection',
      '326' => 'Inadequate Encryption Strength',
      '327' => 'Risky Cryptographic Algorithm',
      '352' => 'Cross-Site Request Forgery',
      '601' => 'Open Redirect',
      '643' => 'XPath Injection'
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

  def edit_cwe352
    redirect_to new_csrf_path
  end

  private

  def title
    title = @cwes[params[:id]]
    title ? "CWE-#{params[:id]}: #{title}" : nil
  end
end
