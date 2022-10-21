require 'html-proofer'

task default: %w[lint]

task :lint do
  exec 'find . -name "*.md" | grep -v "^.\/vendor\/" | xargs mdl'
end

task :htmlproofer do
  options = { :only_4xx => true, :allow_hash_href => true, :allow_missing_href => true, :disable_external => true }
  HTMLProofer.check_directory("./_site", options).run
end
