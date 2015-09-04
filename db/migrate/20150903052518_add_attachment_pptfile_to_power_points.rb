class AddAttachmentPptfileToPowerPoints < ActiveRecord::Migration
  def self.up
    change_table :power_points do |t|
      t.attachment :pptfile
    end
  end

  def self.down
    remove_attachment :power_points, :pptfile
  end
end
