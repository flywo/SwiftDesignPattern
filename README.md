# Swfit-DesignPattern
设计模式在Swift中的应用，使用的是Swift3.0。

<span id="jump"></span>

* [1.策略模式](#1)
* [2.装饰模式](#2)
* [3.代理模式](#3)
* [4.工厂方法模式](#4)
* [5.原型模式](#5)
* [6.模板方法模式](#6)
* [7.外观模式](#7)
* [8.建造者模式](#8)
* [9.观察者模式](#9)
* [10.抽象工厂模式](#10)
* [11.状态模式](#11)
* [12.适配器模式](#12)
* [13.备忘录模式](#13)
* [14.组合模式](#14)
* [15.迭代器模式](#15)
* [16.单例模式](#16)
* [17.桥接模式](#17)
* [18.命令模式](#18)
* [19.职责链模式](#19)
* [20.中介者模式](#20)
* [21.享元模式](#21)
* [22.解释器模式](#22)
* [23.访问者模式](#23)
<h1 id="1">1.策略模式</h1>
策略模式（Strategy），它定义了算法家族，分别封装起来，让它们之间可以互相替换，此模式让算法的变化，不会影响到使用算法的客户。

实现：
```swift
import Foundation
import UIKit

//定义了金钱的算法acceptcash，分别实现
protocol CashBase {
    //所有计算都要遵循该协议，实现该方法
    func acceptCash(cash: CGFloat) -> CGFloat
}

//正常
class CashNormal: CashBase {
    func acceptCash(cash: CGFloat) -> CGFloat {
        return cash
    }
}

//打折
class CashRobate: CashBase {

    var moneyRebate: CGFloat

    init(rebate: CGFloat) {
        moneyRebate = rebate
    }

    func acceptCash(cash: CGFloat) -> CGFloat {
        return moneyRebate * cash
    }
}


//减免
class CashReturn: CashBase {

    var moneyReturn: CGFloat

    init(retur: CGFloat) {
        moneyReturn = retur
    }

    func acceptCash(cash: CGFloat) -> CGFloat {
        return cash - moneyReturn
    }
}


enum CashType {
    case Normal
    case Robate
    case Return
}

class CashContext {

    var cashBase: CashBase

    init(type: CashType) {
        switch type {
        case .Normal:
            cashBase = CashNormal()
        case .Robate:
            cashBase = CashRobate(rebate: 0.5)
        case .Return:
            cashBase = CashReturn(retur: 10)
        }
    }

    func getResult(money: CGFloat) -> CGFloat {
        return cashBase.acceptCash(cash: money)
    }
}
```
使用：
```swift
//使用不同的算法，获得不同的结果
let context = CashContext(type: .Normal)
print("Normal结果：\(context.getResult(money: 100))")//Normal结果：100

let retur = CashContext(type: .Return)
print("Retrun结果：\(retur.getResult(money: 100))")//Retrun结果：90

let robate = CashContext(type: .Robate)
print("Robate结果：\(robate.getResult(money: 100))")//Robate结果：50
```
[回到顶部](#jump)
<h1 id="2">2.装饰模式</h1>
装饰模式（Decorator），动态地给一个对象添加一些额外的职责，就增加功能来说，装饰模式比生成子类更为灵活。

实现：
```swift
import Foundation


protocol Phone {

    func call() -> String

    func video() -> String
}


class iPhone: Phone {

    func call() -> String {
        return "苹果打电话"
    }

    func video() -> String {
        return "苹果看电影"
    }
}

//父装饰器
class PhoneDecorator: Phone {

    var phone: Phone

    init(phone: Phone) {
        self.phone = phone
    }

    func call() -> String {
        return phone.call()
    }

    func video() -> String {
        return phone.video()
    }
}

//增加流量功能
final class PhoneDecoratorNet: PhoneDecorator {

    override func call() -> String {
        return "流量-\(phone.call())"
    }

    override func video() -> String {
        return "流量-\(phone.video())"
    }
}

//增加wifi功能
class PhoneDecoratorWifi: PhoneDecorator {

    override func call() -> String {
        return "WIFI-\(phone.call())"
    }

    override func video() -> String {
        return "WIFI-\(phone.video())"
    }
}

```
使用：
```swift
let phone = iPhone()

//装饰器增加了功能
var decorator = PhoneDecorator(phone: phone)
print(decorator.call())//苹果打电话
print(decorator.video())//苹果看电影

decorator = PhoneDecoratorNet(phone: phone)
print(decorator.call())//流量-苹果打电话
print(decorator.video())//流量-苹果看电影

decorator = PhoneDecoratorWifi(phone: phone)
print(decorator.call())//WIFI-苹果打电话
print(decorator.video())//WIFI-苹果看电影
```
[回到顶部](#jump)
<h1 id="3">3.代理模式</h1>
代理模式（Proxy），为其他对象提供一种代理以控制对这个对象的访问。

实现：
```swift
import Foundation

//虚拟代理
protocol Action {

    func run()
    func cry()
}


class Children: Action {

    func run() {
        print("孩子跑了")
    }

    func cry() {
        print("孩子哭了")
    }
}


class Youth: Action {

    lazy private var children: Children = Children()

    func run() {
        children.run()
    }

    func cry() {
        children.cry()
    }
}


//保护代理

protocol Door {

    func open()
}


class Child: Door {

    func open() {
        print("好的，马上来开门！")
    }
}


class Parent: Door {

    private var child: Child!

    func haveChild(have: Bool) {

        guard have else {
            return
        }
        child = Child()
    }

    func open() {
        guard child != nil else {
            print("没有孩子，我自己来开门")
            return
        }
        child.open()
    }
}

```
使用
```swift
//虚拟代理，youth控制了child的行为
let virtual = Youth()
virtual.run()//孩子跑了
virtual.cry()//孩子哭了

//保护代理，对于控制孩子开门这个行为，增加了一个保护，如果没有孩子这个实例，则自己去开门
let parent = Parent()
parent.open()//没有孩子，我自己来开门
parent.haveChild(have: true)
parent.open()//好的，马上来开门
```
[回到顶部](#jump)
<h1 id="4">4.工厂方法模式</h1>
工厂方法模式（Factory Method），定义一个用于创建对象的接口，让子类决定实例化哪一个类。工厂方法使一个类的实例化延迟到其子类。

实现：
```swift
import Foundation

//定义一个总的工厂类，让其子类决定创建出什么样的对象
class Factory {
    func createProduct() -> String {
        return "电视"
    }
}

//长虹子类决定只创建长虹电视
class ChangHoneFactory: Factory {
    override func createProduct() -> String {
        return "长虹电视"
    }
}

//海尔子类只创建海尔电视
class HaierFactory: Factory {
    override func createProduct() -> String {
        return "海尔电视"
    }
}
```
使用：
```swift
//不同的工厂子类决定了要生成的实例
var factory: Factory = ChangHoneFactory()
print("创建出了:\(factory.createProduct())")//创建出了:长虹电视
factory = HaierFactory()
print("创建出了:\(factory.createProduct())")//创建出了:海尔电视
```
[回到顶部](#jump)
<h1 id="5">5.原型模式</h1>
原型模式（Prototype），用原型实例指定创建对象的种类，并且通过拷贝这些原型创建新的对象。

实现：
```swift
//定义了一个程序员原型，假设有一大群程序员，他们之间的区别就是姓名不同，其余都相同
class Programmer {

    var name: String?
    var age: Int
    var sex: String
    var language: String

    init(age: Int, sex: String, language: String) {
        self.language = language
        self.age = age
        self.sex = sex
    }

//可以克隆自己
    func clone() -> Programmer {
        return Programmer(age: age, sex: sex, language: language)
    }

}
```
使用：
```swift
//从打印结果可以得出，韩梅梅我们只要克隆李雷，然后修改他的名字就可以了，无需重新创建
let a = Programmer(age: 18, sex: "M", language: "swift")
a.name = "李雷"
print(dump(a))
/*
▿ Prototype.Programmer #0
▿ name: Optional("李雷")
- some: "李雷"
- age: 18
- sex: "M"
- language: "swift"
Prototype.Programmer
*/
let b = a.clone()
b.name = "韩梅梅"
print(dump(b))
/*
▿ Prototype.Programmer #0
▿ name: Optional("韩梅梅")
- some: "韩梅梅"
- age: 18
- sex: "M"
- language: "swift"
Prototype.Programmer
*/
```
[回到顶部](#jump)
<h1 id="6">6.模板方法模式</h1>
模板方法模式（Template Method），定义一个操作中的算法的骨架，而将一些步骤延迟到子类中。模板方法使得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤。

定义：
```swift

import Foundation

//定义了一套问题模板
class Question {

    final func question() {
        print("如果有一天，不写程序了，你会去做什么？")
        print("我会去：\(answer())")
    }

//默认是养猪
    func answer() -> String {
        return "养猪"
    }
}

//子类修改answer方法来修改结果
class PersonA: Question {

    override func answer() -> String {
        return "下海经商"
    }
}


class PersonB: Question {

    override func answer() -> String {
        return "自己开公司"
    }
}
```
使用：
```swift
let s = Question()
s.question()
//如果有一天，不写程序了，你会去做什么？
//我会去：养猪

let a = PersonA()
a.question()
//如果有一天，不写程序了，你会去做什么？
//我会去：下海经商

let b = PersonB()
b.question()
//如果有一天，不写程序了，你会去做什么？
//我会去：自己开公司
```
[回到顶部](#jump)
<h1 id="7">7.外观模式</h1>
外观模式（Facade），为子系统中的一组接口提供一个一致的界面，此模式定义了一个高层接口，这个接口使得这一子系统更加容易使用。

定义：
```swift
import Foundation

class Robot {
//只需要调用该接口即可，内部的子系统无需使用者依次调用
    static func creatRobot() {
        Head.createHead()
        Body.createBody()
        Arm.createArm()
        Leg.createLeg()
    }
}


class Head {
    static func createHead() {
        print("制造头")
    }
}

class Body {
    static func createBody() {
        print("制造身体")
    }
}

class Arm {
    static func createArm() {
        print("制造手臂")
    }
}

class Leg {
    static func createLeg() {
        print("制造腿")
    }
}
```
使用：
```swift
Robot.creatRobot()
/*
制造头
制造身体
制造手臂
制造腿
*/
```
[回到顶部](#jump)
<h1 id="8">8.建造者模式</h1>
建造者模式（Builder），将一个复杂对象的构建与它的表示分离，使得同样的构建过程可以创建不同的表示。

实现：
```swift
//创建对象需要的表示，需要用户自己定制
struct LabelBuilder {

    var text: String
    var color: UIColor
    var rect: CGRect
}


class LabelDirector {

//对象的构建，需要传入表示
    static func creatLableWithBuilder(builder: LabelBuilder) -> UILabel {

        let label = UILabel(frame: builder.rect)
        label.text = builder.text
        label.textColor = builder.color
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }
}
```
使用：
```swift
let builder = LabelBuilder(text: "按钮", color: .orange, rect: CGRect(x: 100, y: 100, width: view.frame.width-200, height: 30))
//通过自定义标签的表示，用同一个构造方法构建标签
let label = LabelDirector.creatLableWithBuilder(builder: builder)
view.addSubview(label)
```
[回到顶部](#jump)
<h1 id="9">9.观察者模式</h1>
观察者模式（Observer），定义了一种一对多的依赖关系，让多个观察者对象同时监听某一个主题对象。这个主题对象在状态发生变化时，会通知所有观察者对象，使它们能够自动更新自己。

实现：
```swift
import Foundation

enum NoticeType {
    case Lev1 //老板到公司门口了
    case Lev2 //老板进来办公室了
}


protocol ObserverProtocol {
//定义了一个协议，实现
    func notice(type: NoticeType)
}


//公司前台小妹
final class Reception {

    var observers: [ObserverProtocol]?

    func noticeLev1() {
        noticeEveryOne(lev: .Lev1)
    }

    func noticeLev2() {
        noticeEveryOne(lev: .Lev2)
    }

    private func noticeEveryOne(lev: NoticeType) {
        for obj in observers! {
            obj.notice(type: lev)
        }
    }
}


//好员工
class Staff: ObserverProtocol {

    func notice(type: NoticeType) {
        print("员工\(String(describing: self))说：老板来了就来了呗，一直在专心工作")
    }
}


//员工a
final class StaffA: Staff {

    override func notice(type: NoticeType) {
        switch type {
        case .Lev1:
            print("员工\(String(describing: self))说：不怕，继续看动画。")
        default:
            print("员工\(String(describing: self))说：不怕，我是老板侄儿，他不会骂我的。")
        }
    }
}


//员工B
final class StaffB: Staff {

    override func notice(type: NoticeType) {
        switch type {
        case .Lev1:
            print("员工\(String(describing: self))说：赶紧关了，打开Xcode。")
        default:
            print("员工\(String(describing: self))说：恩，这破电脑，现在才打开Xcode，还好老板一进来已经打开了。")
        }
    }
}
```
使用：
```swift
let staff1 = Staff()
let staff2 = StaffA()
let staff3 = StaffB()
let reception = Reception()
reception.observers = [staff1, staff2, staff3]
//公司员工123都关注前台小妹的通知，当老板快要进办公室时，小妹会通知所有人
reception.noticeLev1()//老板到公司门口了，小妹发通知
/*
员工Observer.Staff说：老板来了就来了呗，一直在专心工作
员工Observer.StaffA说：不怕，继续看动画。
员工Observer.StaffB说：赶紧关了，打开Xcode。
*/
reception.noticeLev2()//老板进办公室了，小妹发通知
/*
员工Observer.Staff说：老板来了就来了呗，一直在专心工作
员工Observer.StaffA说：不怕，我是老板侄儿，他不会骂我的。
员工Observer.StaffB说：恩，这破电脑，现在才打开Xcode，还好老板一进来已经打开了。
*/
```
[回到顶部](#jump)
<h1 id="10">10.抽象工厂模式</h1>
抽象工厂模式（Abstract Factory），提供一个创建一系列相关或相互依赖对象的接口，而无需指定它们具体的类。

实现：
```swift
import Foundation

//产品
protocol ProductProtocol {
    var factory: String { get set }
    func showYouself()
}


struct Television: ProductProtocol {
    var factory: String
    func showYouself() {
        print("\(factory)生产的电视")
    }
}


struct Refrigerator: ProductProtocol {
    var factory: String
    func showYouself() {
        print("\(factory)生产的冰箱")
    }
}


//工厂
enum ProductType {
    case Television, Refrigerator
}


class Factory {
    static func createProduct(type: ProductType) -> ProductProtocol {
        switch type {
        case .Television:
            return Television(factory: "工厂")
        default:
            return Refrigerator(factory: "工厂")
        }
    }
}
```
使用：
```swift
//工厂类提供了生产所有产品的接口，使用者无需知道要生产的具体类，只需要告诉工厂要的产品类型即可
let tv = Factory.createProduct(type: .Television)
let bx = Factory.createProduct(type: .Refrigerator)
tv.showYouself()//工厂生产的电视
bx.showYouself()//工厂生产的冰箱
```
[回到顶部](#jump)
##11.状态模式（State），当一个对象的内在状态改变时允许改变其行为，这个对象看起来像是改变了其类。

##12.适配器模式（Adapter），将一个类的接口转换成客户希望的另外一个接口。Adapter 模式使得原本由于接口不兼容而不能一起工作的那些类可以一起工作。

##13.备忘录模式（Memento），在不破坏封装性的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态。这样以后就可将该对象恢复到原先保存的状态。

##14.组合模式（Composite），将对象组合成树形结构以表示‘部分-整体’的层次结构。组合模式使得用户对单个对象和组合对象的使用具有一致性。

##15.迭代器模式（Iterator），提供一种方法顺序访问一个聚合对象中各个元素，而又不暴露该对象的内部表示。

##16.单例模式（Singleton），保证一个类仅有一个实例，并提供一个访问它的全局访问点。

##17.桥接模式（Bridge），将抽象部分与它的实现部分分离，使它们都可以独立地变化。

##18.命令模式（Command），将一个请求封装为一个对象，从而使你可用不同的请求对客户进行参数化；对请求排队或记录请求日志，以及支持可撤销的操作。

##19.职责链模式（Chain of Responsibility），使多个对象都有机会处理请求，从而避免请求的发送者和接收者之间的耦合关系。将这个对象连成一条链，并沿着这条链传递该请求，直到有一个对象处理它为止。

##20.中介者模式（Mediator），用一个中介对象来封装一系列的对象交互。中介者使各对象不需要显式地相互引用，从而使其耦合松散，而且可以独立地改变它们之间的交互。

##21.享元模式（Flyweight），运用共享技术有效地支持大量细粒度的对象。

##22.解释器模式（Interpreter），给定一个语言，定义它的文法的一种表示，并定义一个解释器，这个解释器使用该表示来解释语言中的句子。

##23.访问者模式（Visitor），表示一个作用于某对象结构中的各元素的操作。它使你可以在不改变各元素的类的前提下定义作用于这些元素的新操作。
