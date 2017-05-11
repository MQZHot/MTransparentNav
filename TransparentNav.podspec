

Pod::Spec.new do |s|

  s.name         = "TransparentNav"
  s.version      = "1.0.2"
  s.summary      = "Change NavigationBar's color and transparency when push pop scroll"

  s.homepage     = "https://github.com/MQZHot/MTransparentNav"

  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "mqz" => "mqz1228@163.com" }     
  s.platform     = :ios, "8.0"                     
  s.source       = { :git => "https://github.com/MQZHot/MTransparentNav.git", :tag => " 1.0.2"  }
  s.source_files  = "TransparentNav/TransparentNav", "TransparentNav/TransparentNav/*.{h,m}"                
  s.requires_arc = true
  s.dependency 'RTRootNavigationController'

end
