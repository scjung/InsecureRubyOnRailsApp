# frozen_string_literal: true

# Controller for attacks
class AttacksController < ApplicationController
  def index
    @cwes = { 22 => 'Path Traversal',
              78 => 'OS Command Injection',
              79 => 'Cross-Site Scripting' }
  end

  def show
    redirect_to edit_attack_path(params[:id])
  end

  def edit
    case params[:id]
    when '22'
      edit_cwe22
    when '78'
      edit_cwe78
    else
      render status: 404
    end
  end

  def update
    case params[:id]
    when '22'
      update_cwe22
    when '78'
      update_cwe78
    else
      render status: 404
    end
  end

  private

  def notes
    dir = Rails.public_path.join('notes')
    Dir.glob('*.txt', base: dir).map { |f| File.basename(f, '.txt') }
  end

  # CWE-22 -------------------------------------------------------------------

  def edit_cwe22
    @notes = notes
    render :cwe22
  end

  def update_cwe22
    dir = Rails.public_path.join('notes')
    note = params[:note]
    if params[:defense] == '1'
      note = note.gsub(%r{[\\/]}, '')
      note_file = File.join(dir, note + '.txt')
    else
      note_file = File.join(dir, params[:note] + '.txt')
    end

    @note = if File.exist?(note_file)
              File.read(note_file)
            else
              "Note does not exist: #{note}"
            end

    @notes = notes
    render :cwe22
  end

  # CWE-78 -------------------------------------------------------------------

  def edit_cwe78
    render :cwe78
  end

  def update_cwe78
    dir = Rails.public_path.join('notes')
    pattern = params[:pattern]
    if params[:defense] == '0' || pattern.match(/^[A-Za-z]+$/)
      cmd = "cd #{dir}; grep '#{pattern}' *.txt"
      @result = `#{cmd}`
    else
      @result = 'Invalid pattern.'
    end

    render :cwe78
  end
end
