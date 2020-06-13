# frozen_string_literal: true

# CWE-643
module Cwe643
  def edit_cwe643
    render :cwe643
  end

  def update_cwe643
    doc = Nokogiri::XML(File.open(Rails.root.join('private', 'books.xml')))
    @result = doc
    render :cwe643
  end
end
