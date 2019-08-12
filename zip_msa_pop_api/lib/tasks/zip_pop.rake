namespace :zip_pop do
  task :sync_models => [ :environment ] do
    puts 'Syncing...'
    sync_zip_cbsa_model
    sync_msa_model
  end

  task :sync_zip_cbsa_model => [ :environment ] do
    puts 'Syncing...'
    sync_zip_cbsa_model
  end

  task :sync_msa_model => [ :environment ] do
    puts 'Syncing...'
    sync_msa_model
  end

  def sync_msa_model
    Sync::SyncMsa.perform
  end
  
  def sync_zip_cbsa_model
    Sync::SyncZipCbsa.perform
  end
end
