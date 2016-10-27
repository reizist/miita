namespace :miita do
  task import: :environment do
    MiitaImporter.new.import
  end
end
