# Load the bundled environment
require 'rubygems'
require 'bundler/setup'
require 'yaml'

# Require gems specified in the Gemfile
require 'octokit'

INTERCOM_REPO = "intercom/intercom"
TRANSLATIONS_REPO = "intercom/intercom-translations"

client = Octokit::Client.new(login: "colinfkennedy", password: "")
client.auto_paginate = true
# Fetch the current user
# user = client.user("colinfkennedy")
# puts user.name

# issue= client.issue("intercom/intercom", "74848")
#
# puts issue.title


localization_issues = client.list_issues(INTERCOM_REPO, state: "open", labels: "Localization")

count = 0

localization_issues.each do |issue|
  puts "------------- ISSUE --------------"
  puts YAML.dump(issue)
  count += 1
  puts "----------------------------------"
  puts
end

puts "Total Open Localization Issues: #{count}"