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
  include Cwe321
  include Cwe326
  include Cwe327
  include Cwe330
  include Cwe494
  include Cwe539
  include Cwe601
  include Cwe643
  include Cwe759

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
      '321' => 'Hard-Coded Cryptographic Key',
      '326' => 'Inadequate Encryption Strength',
      '327' => 'Risky Cryptographic Algorithm',
      '330' => 'Insufficiently Random Values',
      '352' => 'Cross-Site Request Forgery',
      '434' => 'Unrestricted Upload of File with Dangerous Type',
      '494' => 'Download of Code Without Integrity Check',
      '521' => 'Weak Password Requirements',
      '539' => 'Persistent Cookies',
      '601' => 'Open Redirect',
      '643' => 'XPath Injection',
      '759' => 'One-Way Hash without a Salt'
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

  def edit_cwe434
    redirect_to uploads_path
  end

  def edit_cwe521
    redirect_to new_insecure_user_path
  end

  private

  def title
    title = @cwes[params[:id]]
    title ? "CWE-#{params[:id]}: #{title}" : nil
  end

  # CWE-615
  # db password is '1234'
end
