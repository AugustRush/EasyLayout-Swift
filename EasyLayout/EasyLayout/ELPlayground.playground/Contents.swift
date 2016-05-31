//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let container = UIView(frame: CGRectMake(0,0,1000,400))
container.backgroundColor = UIColor(red: 0.97,green: 0.97,blue: 0.97,alpha: 1.0)

let view1 = UIView()
view1.backgroundColor = UIColor.redColor()
container.addSubview(view1)

let view2 = UIView()
view2.backgroundColor = UIColor.greenColor()
container.addSubview(view2)

let view3 = UIView()
view3.backgroundColor = UIColor.blackColor()
container.addSubview(view3)

view1.makeConstraints { (make) in
    make.ELLeft == 20
    make.ELSize.equalTo(300,300)
    make.ELTop == 20
}

view2.makeConstraints { (make) in
    make.ELLeft == view1.ELRight + 20
    make.ELTop == view1.ELTop
    make.ELSize.equalTo(200,300)
}

view3.makeConstraints { (make) in
    make.ELLeft == view2.ELRight + 20
    make.ELTop == view1
    make.ELSize.equalTo(100,300)
}


XCPlaygroundPage.currentPage.liveView = container
