class PowerPoint < ActiveRecord::Base
  has_attached_file :pptfile, :url => "/images/:id/:basename.:extension",
                    :path => ":rails_root/public/images/:id/:basename.:extension"
  validates_attachment_content_type :pptfile, :content_type => ["application/mspowerpoint","application/powerpoint","application/vnd.ms-powerpoint","application/x-mspowerpoint"]
  
  def extract_slides
    folder_name = self.pptfile_file_name.split('.')[0]
    output_folder = "#{Rails.root}/public/images/#{self.id}/" + folder_name
    input_file = "#{Rails.root}/public" + self.pptfile.url.split("?")[0]
    Docsplit.extract_images(input_file, :format => [:jpg],:output=>output_folder)
    self.update_attributes(output_path: output_folder) 
  end
  
  def image_folder 
    img_folder = self.pptfile.url.split(".")[0]
  end
end
