Pod::Spec.new do |s|

  s.name         = "PDTSimpleCalendar"
  s.version      = "17.04.24.12"
  s.summary      = "A simple Calendar/Date Picker with a nice iOS7/iOS8 design."

  s.description  = <<-DESC
                   Inspired by Square's TimesSquare & Apple Calendar.

                   Simple Calendar is a simple Date Picker/Calendar View Controller using UICollectionView and a flowLayout.
                   DESC

  s.homepage     = "https://github.com/jivesoftware/PDTSimpleCalendar"
  s.license      = 'Apache License, Version 2.0'
  s.author       = { "Jerome Miglino" => "jerome.miglino@jivesoftware.com" }
  s.platform     = :ios, '6.0'
  s.source       = { :git => "git@github.com:sunwei415/PDTSimpleCalendar.git", :tag => s.version.to_s }
  s.source_files  = 'PDTSimpleCalendar/**/*.{h,m}'
  s.requires_arc = true

end
