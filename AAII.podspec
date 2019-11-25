Pod::Spec.new do |s|
  s.name          = "AAII"
  s.version       = "0.0.2"
  s.summary       = "AAII is a framework"
  s.homepage      = "http://github.com/EstevanBR"
  s.description   = "AAII is a swift framework which injects accessibility identifiers into UIViewControllers and UIViews"
  s.license       = "MIT"
  s.author        = { "Estevan" => "estevan@bluerocket.us" }
  s.platform      = :ios, "12.0"
  s.ios.vendored_frameworks = 'AAII.framework'
  s.swift_version = "5.0"
  s.source        = { :git => "https://gitlab.com/YOUR_USERNAME/AAII.git", :tag => "#{s.version}" }
  s.exclude_files = "Classes/Exclude"
end
