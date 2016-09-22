Pod::Spec.new do |s|
  s.name             = 'bumper'
  s.version          = '0.1.0'
  s.summary          = 'A/B Testing debug helper framework for iOS'
  s.description      = <<-DESC
    Letgo Feature flags library. 
    It not only allows Enabling/disabling parts of the code but select several cases for that parts.
    Includes a ruby script that generates all boilerplate for all A/B tests from a json file that 
    contains the info.  
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
  s.preserve_paths = [ 'scripts/**/*' ]

  s.frameworks = 'UIKit'
end
