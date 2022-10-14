# Run a command on any .rb file change in the local directory.
guard :shell do
  directories %w[.]
  watch(/(.*).rb/) { `bundle exec rake` }
end
