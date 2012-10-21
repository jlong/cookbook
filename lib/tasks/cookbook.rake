desc 'start a unicorn server on port 3000'
task :server do
  system "unicorn -p 3000 config.ru"
end