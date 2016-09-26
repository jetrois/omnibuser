class Document < ApplicationRecord
  belongs_to :story
  before_create :sanitize_filename
  after_create :build
  before_destroy :delete_file

  def sanitize_filename
    self.filename.gsub!(/[^\w]/, '_')
  end

  def path
    "/tmp/#{filename}.#{extension}"
  end

  def delete_file
    File.delete(self.path) if File.exist?(self.path)
  end

  def build
    builder = case extension
    when 'html'
      HTMLBuilder
    when 'mobi'
      MOBIBuilder
    when 'epub'
    #  EPUBBuilder
      HTMLBuilder
    when 'pdf'
      PDFBuilder
    end
    builder.new(doc: self).build
  end
end
