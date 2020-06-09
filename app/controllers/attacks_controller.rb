# frozen_string_literal: true

# Controller for attacks
class AttacksController < ApplicationController
  def index
    @cwes = { 22 => 'Path Traversal',
              78 => 'OS Command Injection',
              79 => 'Cross-Site Scripting' }
  end

  def edit
    case params[:id]
    when '22'
      edit_cwe22
    else
      render status: 404
    end
  end

  def update
    case params[:id]
    when '22'
      update_cwe22
    else
      render status: 404
    end
  end

  private

  def notes
    dir = Rails.public_path.join('notes')
    Dir.glob('*.txt', base: dir).map { |f| File.basename(f, '.txt') }
  end

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
end
