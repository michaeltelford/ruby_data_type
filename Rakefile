require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "."
  t.test_files = FileList["./test_*.rb"]
end

task default: :test
