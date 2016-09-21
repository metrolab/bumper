Pod::Spec.new do |s|
  s.name             = 'bumper'
  s.version          = '0.1.0'
  s.summary          = 'A/B Testing debug helper framework for iOS'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/letgoapp/bumper'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Eli Kohen' => 'eli.kohen@letgo.com' }
  s.source           = { :git => "git@github.com:letgoapp/bumper.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/letgo'

  s.ios.deployment_target = '8.0'
  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'bumper/**/*'

  s.frameworks = 'UIKit'
end
