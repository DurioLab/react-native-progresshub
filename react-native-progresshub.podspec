require 'json'
pjson = JSON.parse(File.read('package.json'))

Pod::Spec.new do |s|

  s.name            = pjson["name"]
  s.version         = pjson["version"]
  s.homepage        = "https://github.com/frontendhot/react-native-progresshub"
  s.summary         = pjson["description"]
  s.license         = pjson["license"]
  s.author          = { "frontendhot" => "developer_mp@163.com" }
  s.platform        = :ios, "9.3"
  s.source          = { :git => "https://github.com/frontendhot/react-native-progresshub.git", :tag => "v#{s.version}" }
  s.source_files    = 'RNProgressHUB/RNProgressHUB/*.{h,m}'

  s.dependency 'React'

end
