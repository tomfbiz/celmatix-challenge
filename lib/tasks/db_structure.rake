namespace :db do
  desc "Dump DB structure in SQL to a file"
  task :structure_with_name, [:file_name] => :environment do |_task, args|
    args.with_defaults(:file_name => 'sqldump.sql')
    file_name = "tmp/#{args.file_name}"
    configuration = {
      "adapter"  => ActiveRecord::Base.connection_config[:adapter],
      "database" => ActiveRecord::Base.connection_config[:database]
    }
    ActiveRecord::Tasks::DatabaseTasks.structure_dump(configuration, file_name)
  end
end
