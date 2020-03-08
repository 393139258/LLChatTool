#
# Be sure to run `pod lib lint LHChat.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LHChat'
  s.version          = '0.1.1'
  s.summary          = '这是一个简单的工具类的库, 都可以使用'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  这是一个简单的工具类的库, 都可以使用, 大家都来用的看看
                       DESC

  s.homepage         = 'https://github.com/393139258/LLChatTool'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liheng' => '393139248@qq.com' }
  s.source           = { :git => 'https://github.com/393139258/LLChatTool.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LHChat/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LHChat' => ['LHChat/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
