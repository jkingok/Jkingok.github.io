#!/usr/bin/env ruby
#
# Check for changed posts

require 'open3'

if RUBY_PLATFORM.include?('android')
  GIT_BIN = '/data/data/xyz.jekyllex/files/usr/bin/git'
else
  GIT_BIN = 'git'
end

Jekyll::Hooks.register :posts, :post_init do |post|
  stdout, status = Open3.capture2(GIT_BIN, 'rev-list', '--count', 'HEAD', post.path)
  commit_num = stdout.strip 
  # commit_num = `/data/data/xyz.jekyllex/files/usr/bin/git rev-list --count HEAD "#{ post.path }"`

  if commit_num.to_i > 1
    stdout, status = Open3.capture2(GIT_BIN, 'log', '-1', '--pretty=%ad', '--date=iso', post.path)
    lastmod_date = stdout.strip
    # lastmod_date = `/data/data/xyz.jekyllex/files/usr/bin/git log -1 --pretty="%ad" --date=iso "#{ post.path }"
    post.data['last_modified_at'] = lastmod_date
  end
end