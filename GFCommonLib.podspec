
Pod::Spec.new do |spec|

  spec.name         = "GFCommonLib"

  spec.version      = "0.0.1"

  spec.summary      = "A short description of GFCommonLib."


  spec.homepage     = "https://github.com/qq97617564/GFCommonLib"
  
  spec.license      = "MIT"
  

  spec.author       = { "WGF" => "597617564@qq.com" }

  spec.framework     = 'Foundation','UIKit','MediaPlayer','AVFoundation'

  spec.source        = { :git => "https://github.com/qq97617564/GFCommonLib.git", :tag => "#{spec.version}" }
  
  spec.dependency    'Masonry'

  spec.dependency    'SDWebImage'

  spec.dependency    'MJExtension'

  spec.dependency    'MBProgressHUD'
  
  spec.requires_arc  = true

  spec.prefix_header_contents = '#import <objc/runtime.h>','#import "GFCommonManager.h"'

  spec.platform      = :ios, '9.0'

  spec.source_files  = "GFCommonLib/*.{h,m}","GFCommonLib/**/*.{h,m}","GFCommonLib/Classes/**/*.{h,m}"



end
