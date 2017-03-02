#
# Be sure to run `pod lib lint EFImageLoader.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EFImageLoader'
  s.version          = '0.1.0'
  s.summary          = 'A loader like HUD, but that uses a sequence of images'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
🏞 🙃🙂 A loader like HUD, but that uses a sequence of images [UIImage]
                       DESC

  s.homepage         = 'https://github.com/ezefranca/EFImageLoader'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ezefranca' => 'ezequiel.ifsp@gmail.com' }
  s.source           = { :git => 'https://github.com/ezefranca/EFImageLoader.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/ezefranca'

  s.ios.deployment_target = '9.0'

  s.source_files = 'EFImageLoader/Classes/**/*'
  
  # s.resource_bundles = {
  #   'EFImageLoader' => ['EFImageLoader/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
