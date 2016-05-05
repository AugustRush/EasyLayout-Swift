# EasyLayout
#### Easy to use Autolayout for iOS/tvOS/OSX, easier is stronger.

### Objective-C version
##### https://github.com/AugustRush/EasyLayout

## Demo GIf
<img src="https://github.com/AugustRush/EasyLayout-Swift/blob/master/demo.gif" width="320">

## How to use
<img src="https://github.com/AugustRush/EasyLayout-Swift/blob/master/Simulator%20Screen%20Shot%20May%205%2C%202016%2C%202.58.19%20PM.png" width="320">

##### Code
```
firstView.remakeConstraints { (make) in
	make.ELAllEdges.equalTo(0)
}
        
secondView.remakeConstraints { (make) in
	make.ELAllEdges.equalTo(40,40,-40,-40)
}
        
thirdView.remakeConstraints { (make) in
   	make.ELAllEdges.equalTo(80,80,-80,-80)
}
        
fouthView.remakeConstraints { (make) in
	make.ELAllEdges.equalTo(120,120,-120,-120)
}

```
<img src="https://github.com/AugustRush/EasyLayout-Swift/blob/master/Simulator%20Screen%20Shot%20May%205%2C%202016%2C%202.59.52%20PM.png" width="320">

##### Code
```
firstView.remakeConstraints { (make) in
	make.ELLeft == 10
	make.ELTop == 10
	make.ELSize.equalTo(self.view).mutipliers(0.5).constants(-30)
}
        
secondView.remakeConstraints { (make) in
	make.ELTop == 10
	make.ELRight == -10
	make.ELSize.equalTo(self.firstView)
}
        
thirdView.remakeConstraints { (make) 
	make.ELTop == self.firstView.ELBottom + 10
	make.ELLeft == 10
	make.ELSize.equalTo(self.firstView)
}
        
fouthView.remakeConstraints { (make) in
	make.ELTop == self.secondView.ELBottom + 10
	make.ELRight == -10
	make.ELSize.equalTo(self.firstView)
}

```


## Next to do
##### add combination attributes method
##### More Easier?(how to do???)
##### file -> UIView

## License (MIT)
```
Copyright (c) 2016 

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```