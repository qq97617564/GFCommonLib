
Pod::Spec.new do |spec|


  spec.name         = "GFCommonLib"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of GFCommonLib."
 
  spec.description  = <<-DESC
                   DESC

  spec.homepage     = "https://github.com/qq97617564/GFCommonLib"
  
  spec.license      = "MIT (example)"
  

  spec.author             = { "王刚锋" => "597617564@qq.com" }


  spec.source       = { :git => "https://github.com/qq97617564/GFCommonLib.git", :tag => "#{spec.version}" }


  spec.source_files  = "GFCommonLib.{h,m}"
  spec.exclude_files = "Classes/Exclude"

  

end
