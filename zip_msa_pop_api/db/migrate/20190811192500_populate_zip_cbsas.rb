class PopulateZipCbsas < ActiveRecord::Migration[6.0]
  def up
    Sync::SyncZipCbsa.perform
  end

  def down
    ZipCbsa.delete_all
  end
end
