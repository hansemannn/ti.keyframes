# 🖼 Ti.Keyframes
[![Contact](http://hans-knoechel.de/shields/shield-twitter.svg)](http://twitter.com/hansemannnn)

> ⚠️ This module moved to the cross-platform reposiroty [Ti.Animation](https://github.com/m1ga/ti.animation) to support both the Keyframes and the Lottie library in on centralized repository for iOS and Android. Please update to Ti.Animation, thx! ⚠️

 Summary
---------------
Ti.Keyframes is an open-source project to support the Facebook Keyframes library in Appcelerator's 
Titanium Mobile. The module is currently supports starting, pausing, resuming and seeking a keyframe.

- For the Android version of this module, check out [m1ga/ti.keyframes](https://github.com/m1ga/ti.keyframes) :rocket:
- For the Airbnb Lottie library, check out [ti.lottie](https://github.com/hansemannn/ti.lottie) :rocket:

Requirements
---------------
- Titanium Mobile SDK 6.0.0.GA or later
- iOS 8.0 or later
- Xcode 8 or later

Features
---------------
- [x] Create a new vector view using `var vectorView = Keyframes.createVectorView({resource: 'my_json'})`
- [x] Start a keyframe animation using `vectorView.startAnimation()`
- [x] Pause a keyframe animation using `vectorView.pauseAnimation()`
- [x] Resume a keyframe animation using `vectorView.resumeAnimation()`
- [x] Seek to a certain progress of a keyframe animation using `vectorView.seekToProgress(0.5)`

Example
---------------
Please see the full-featured example in `example/app.js`.

Author
---------------
Hans Knoechel ([@hansemannnn](https://twitter.com/hansemannnn) / [Web](http://hans-knoechel.de))

License
---------------
Apache 2.0

Contributing
---------------
Code contributions are greatly appreciated, please submit a new [pull request](https://github.com/hansemannn/ti.keyframes/pull/new/master)!
