Pod::Spec.new do |s|
  s.name         = "UIButton+HitExtension"
  s.version      = "1.1.0"
  s.summary      = "Extension of UIButton to control it's touch area."
  s.homepage     = "https://github.com/KimDarren/UIButton-Hit"
  s.license      = { :type => 'WTFPL', :file => 'LICENSE' }
  s.author       = { "KimDarren" => "korean.darren@gmail.com" }
  s.source       = { :git => "https://github.com/KimDarren/UIButton-Hit.git",
                     :tag => "#{s.version}" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Classes/*.{h,m}'
  s.frameworks   = 'Foundation', 'UIKit'
end
