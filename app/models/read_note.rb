class ReadNote
  #  require 'rubygems' 
  require 'zip/zip'
  require 'nokogiri'

  def self.list_file_content(id)
    filename = Note.find(id).attachment
    info = []
    file_names = []
    Zip::ZipFile.open("#{Rails.root}/public/#{filename}") do |zip_file|
       
      # Handle entries one by one
      zip_file.each do |entry|
        if entry.file?
          file_names << entry.name
          #          is_xml =   xml_check(entry.get_input_stream.read
          #data: entry.get_input_stream.read
          h = { file_id: id, unzipname: entry.name }
          info << h
          # Read into memory
          #        content = entry.get_input_stream.read
        end
      end
      # Find specific entry
      #      entry = zip_file.glob('*.csv').first
      #      puts entry.get_input_stream.read
    end
    return file_names ,info

  end
  
  def self.xml_check(xml)
    result = 'true'
    #    doc = Nokogiri::XML(xml)
    #    if doc.errors
    #      result = 'false'
    #    end
    result
  end
  
  def self.file_data(file_id, filename)
    note = Note.find(file_id) 
    data = ''
    Zip::ZipFile.open("#{Rails.root}/public/#{note.attachment}") do |zip_file|
       
     
      zip_file.each do |entry|
        if entry.file?
         
          #          is_xml =   xml_check(entry.get_input_stream.read
          data = entry.get_input_stream.read if entry.name == filename
          
          # Read into memory
          #        content = entry.get_input_stream.read
        end
      end
      # Find specific entry
      #      entry = zip_file.glob('*.csv').first
      #      puts entry.get_input_stream.read
    end
    data
  end
end
 