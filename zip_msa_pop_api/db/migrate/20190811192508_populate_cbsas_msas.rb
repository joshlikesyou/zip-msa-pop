class PopulateCbsasMsas < ActiveRecord::Migration[6.0]
  def up
    Sync::SyncMsa.perform
  end

  def down
    Msa.delete_all
  end
end
