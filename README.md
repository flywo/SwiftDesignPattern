# Swfit-DesignPattern
设计模式在Swift中的应用，使用的是Swift3.0。

##01.策略模式（Strategy），它定义了算法家族，分别封装起来，让它们之间可以互相替换，此模式让算法的变化，不会影响到使用算法的客户。

实现：
```swift
import Foundation
import UIKit

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
print("Normal结果：\(context.getResult(money: 100))")

let retur = CashContext(type: .Return)
print("Retrun结果：\(retur.getResult(money: 100))")

let robate = CashContext(type: .Robate)
print("Robate结果：\(robate.getResult(money: 100))")
```

##02.装饰模式（Decorator），动态地给一个对象添加一些额外的职责，就增加功能来说，装饰模式比生成子类更为灵活。

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


final class PhoneDecoratorNet: PhoneDecorator {

    override func call() -> String {
        return "流量-\(phone.call())"
    }

    override func video() -> String {
        return "流量-\(phone.video())"
    }
}


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

var decorator = PhoneDecorator(phone: phone)
print(decorator.call())
print(decorator.video())

decorator = PhoneDecoratorNet(phone: phone)
print(decorator.call())
print(decorator.video())

decorator = PhoneDecoratorWifi(phone: phone)
print(decorator.call())
print(decorator.video())
```

##03.代理模式（Proxy），为其他对象提供一种代理以控制对这个对象的访问。

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
//虚拟代理
let virtual = Youth()
virtual.run()
virtual.cry()

//保护代理
let parent = Parent()
parent.open()
parent.haveChild(have: true)
parent.open()
```

##04.工厂方法模式（Factory Method），定义一个用于创建对象的接口，让子类决定实例化哪一个类。工厂方法使一个类的实例化延迟到其子类。

##05.原型模式（Prototype），用原型实例指定创建对象的种类，并且通过拷贝这些原型创建新的对象。

##06.模板方法模式（Template Method），定义一个操作中的算法的骨架，而将一些步骤延迟到子类中。模板方法使得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤。

##07.外观模式（Facade），为子系统中的一组接口提供一个一致的界面，此模式定义了一个高层接口，这个接口使得这一子系统更加容易使用。

##08.建造者模式（Builder），将一个复杂对象的构建与它的表示分离，使得同样的构建过程可以创建不同的表示。

##09.观察者模式（Observer），定义了一种一对多的依赖关系，让多个观察者对象同时监听某一个主题对象。这个主题对象在状态发生变化时，会通知所有观察者对象，使它们能够自动更新自己。

##10.抽象工厂模式（Abstract Factory），提供一个创建一系列相关或相互依赖对象的接口，而无需指定它们具体的类。

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
