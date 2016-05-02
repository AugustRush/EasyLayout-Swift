# EasyLayout
#### Easy to use Autolayout, easier is stronger.

### Objective-C version
##### https://github.com/AugustRush/EasyLayout

## Demo GIf
<img src="https://github.com/AugustRush/EasyLayout/blob/develop/demo.gif" width="320">

## How to use

```
view.makeConstraints { (make) in
   make.ELLeft == 10
   make.ELTop == 10
   make.ELWidth == self.view.ELWidth / 2 - 30
   make.ELHeight == self.view.ELHeight / 3 - 30
}
```
OR:

```
view.makeConstraints { (make) in
   	make.ELLeft.equalTo(10)
   	make.ELTop.equalTo(10)
	make.ELWidth.equalTo(self.view).mutiplier(0.5).constant(-30)
   	make.ELHeight.equalTo(self.view).mutiplier(0.5).constant(-30)
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