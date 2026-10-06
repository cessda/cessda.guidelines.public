require 'html-proofer'

task :htmlproofer do
  options = { :only_4xx => true, :allow_hash_href => true, :allow_missing_href => true, :enforce_https => false, :ignore_status_codes => [403] }
  HTMLProofer.check_directory("./_site", options).run
end
