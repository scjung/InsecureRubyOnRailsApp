# frozen_string_literal: true

# CWE-643
module Cwe643
  def edit_cwe643
    render :cwe643
  end

  def update_cwe643
    doc = Nokogiri::XML(File.open(Rails.root.join('private', 'books.xml')))
    title = params[:title]
    if params[:defense] == '1'
      nodes = doc.xpath('//book[./title[contains(text(),$title)]]',
                        nil, { title: title })
    else
      nodes = doc.xpath("//book[./title[contains(text(),'#{title}')]]")
    end
    @books = []
    nodes.each do |node|
      book = { author: node.xpath('./author/text()'),
               title: node.xpath('./title/text()') }
      @books << book
    end
    render :cwe643
  end
end
