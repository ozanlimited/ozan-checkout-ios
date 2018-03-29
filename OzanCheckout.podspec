
Pod::Spec.new do |s|

  s.name         = 'OzanCheckout'
  s.version      = '0.0.2'
  s.summary      = 'Ozan Checkout iOS framework.'

  s.description  = 'The Ozan Checkout iOS SDK lets you accept payments in your iOS app.'

  s.homepage     = 'http://www.ozan.com'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Ozan' => 'kerem.keskin@codespacedev.com' }
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source       = { :http => 'https://github.com/ozanlimited/ozan-checkout-ios/releases/download/0.0.2/OzanCheckoutPod.zip'}
  s.source_files  = 'OzanCheckout.framework/Headers/CheckoutErrorModel.h', 'OzanCheckout.framework/Headers/CheckoutObject.h', 'OzanCheckout.framework/Headers/OzanCheckout.h', 'OzanCheckout.framework/Headers/OzanCheckoutManager.h'
  s.ios.vendored_frameworks = 'OzanCheckout.framework'

end
