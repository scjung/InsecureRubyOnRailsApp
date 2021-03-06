# frozen_string_literal: true

# CWE-22
module Cwe22
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
      @note = if File.exist?(note_file)
                File.read(note_file)
              else
                "Note does not exist: #{note}"
              end
    else
      note = params[:note]
      note_file = File.join(dir, note + '.txt')
      @note = if File.exist?(note_file)
                File.read(note_file)
              else
                "Note does not exist: #{note}"
              end
    end

    @notes = notes
    render :cwe22
  end
end
