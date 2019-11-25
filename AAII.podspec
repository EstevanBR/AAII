# Pod::Spec.new do |spec|
#   spec.name         = "AAII"
#   spec.version      = "0.0.1"
#   spec.summary      = "Automatic Accessibility Identifier Injection"
#   spec.description  = "This is a framework which lets you automatically inject accessibility ids into UIViewControllers and UIViews"
#   spec.homepage     = "http://github.com/EstevanBR"
#   spec.license      = "MIT"
#   spec.author       = { "EstevanBR" => "estevan@bluerocket.us" }
#   spec.source       = { :git => "https://github.com/EstevanBR/AAII-Source.git", :tag => "#{spec.version}" }
#   spec.source_files  = "Classes", "Classes/**/*.{h,m,swift}"
#   #spec.exclude_files = "Classes/Exclude"
# end

#
#  Be sure to run `pod spec lint AAII.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#
Pod::Spec.new do |s|
# ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #
s.name          = "AAII"
#s.version      = "INITIAL_VERSION OR TAG"
s.version       = "0.0.2"
s.summary       = "AAII is a framework"
s.homepage      = "http://github.com/EstevanBR"
s.description   = "AAII is a swift framework which injects accessibility identifiers into UIViewControllers and UIViews"
s.license       = "MIT"
s.author        = { "Estevan" => "estevan@bluerocket.us" }
s.platform      = :ios, "12.0"
s.ios.vendored_frameworks = 'AAII.framework'
#s.swift_version = "Swift version of the framework"
s.swift_version = "4.1"
s.source        = { :git => "https://gitlab.com/YOUR_USERNAME/AAII.git", :tag => "#{s.version}" }
s.exclude_files = "Classes/Exclude"
end