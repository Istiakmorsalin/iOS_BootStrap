platform :ios, '12.0'

def shared_pods
  use_frameworks!

  pod 'RxSwift', '4.3.1'
  pod 'RxCocoa', '4.3.1'
  pod 'RxFlow', '1.6.0'
  pod 'Reusable', '4.0.3'
  pod 'SwiftLint', '0.27.0'
  pod 'Alamofire', '4.7.3'
  pod 'XCGLogger', '~> 7.0.1'
  pod 'Kingfisher', '~> 5.0'
  pod 'Firebase/Core'
  pod 'KeychainAccess', '3.1.1'
  pod 'SnapKit', '~> 5.0.0'
  pod 'IQKeyboardManagerSwift', '6.3.0'
  pod 'SkeletonView', '1.4.0'
  pod 'CryptoSwift', '~> 1.4.1'
  pod 'UITextView+Placeholder'
  pod 'XLPagerTabStrip', '~> 9.0'
  pod 'ReachabilitySwift'
end

target 'dev' do
  shared_pods
end

target 'stg' do
    shared_pods
end

target 'prod' do
    shared_pods
end
