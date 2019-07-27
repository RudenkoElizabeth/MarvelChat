# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods
  pod 'SwiftyJSON'
  pod 'RealmSwift'
end

target 'MarvelChat' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  inhibit_all_warnings!
  use_frameworks!
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Alamofire'
  pod 'Kingfisher'
  shared_pods
  
  # Pods for MarvelChat

  target 'MarvelChatTests' do
    inherit! :search_paths
    shared_pods
  end

end
