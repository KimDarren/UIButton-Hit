UIButton+HitExtension
======================

![CocoaPods](https://cocoapod-badges.herokuapp.com/v/UIButton+HitExtension/badge.png)

Extension of `UIButton` to control its touch area.

Installation
------------

Use [CocoaPods](http://cocoapods.org).

```ruby
pod 'UIButton+HitExtension'
```


Usage
-----

Create `UIButton`, then set `hitEdgeInsets`.

```objc
UIButton *button = [[UIButton alloc] init];
button.hitEdgeInsets = UIEdgeInsetsMake(-100.0f, -30.0f, -100.0f, -30.0f);
```

Congratulations! You're done.

License
-------

UIButton+HitExtension is under [WTFPL](http://www.wtfpl.net/). You can do what the fuck you want with this shit. See [LICENSE](LICENSE) file for more info.
