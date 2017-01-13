<h1 id="jump">Swfit-DesignPattern</h1>

设计模式在Swift中的应用，使用的是Swift3.0。

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
<h1 id="11">11.状态模式</h1>
状态模式（State），当一个对象的内在状态改变时允许改变其行为，这个对象看起来像是改变了其类。

实现：
```swift
import Foundation

enum MoodState {
    case happy, sad, normal
}

//状态
struct State {
    var mood: MoodState
}


//一个程序员
class Programmer {

    var state: State

    init(state: State) {
        self.state = state
    }

    func programming() {
        switch state.mood {
        case .happy:
            print("心情不错，开开心心的写程序")
        case .sad:
            print("心情糟糕，不想写程序")
        case .normal:
            print("心情正常，慢慢悠悠的写程序")
        }
    }
}
```
使用：
```swift
//修改programmer的state状态，即修改了programmer的programming()的行为
let happy = State(mood: .happy)
let programmer = Programmer(state: happy)
programmer.programming()//心情不错，开开心心的写程序

let sad = State(mood: .sad)
programmer.state = sad
programmer.programming()//心情糟糕，不想写程序

let normal = State(mood: .normal)
programmer.state = normal
programmer.programming()//心情正常，慢慢悠悠的写程序
```
[回到顶部](#jump)
<h1 id="12">12.适配器模式</h1>
适配器模式（Adapter），将一个类的接口转换成客户希望的另外一个接口。Adapter 模式使得原本由于接口不兼容而不能一起工作的那些类可以一起工作。

定义：
```swift
//假如说游戏a中，asdw按钮分别代表游戏角色 左 下 右 上 移动，但是在游戏b中，asdw分别代表 左 蹲下 跳跃 右 的动作，此时，适配器模式就体现出用途了，游戏b写一个适配器即可使用asdw按键

//游戏协议，分别定义出asdw四个键按下后需要实现的方法
protocol AdapterProtocol {

    func a()
    func s()
    func d()
    func w()
}

//游戏对应的适配器
class AdapterGameA: AdapterProtocol {
    var game: GameA
    init(game: GameA) {
        self.game = game
    }
    func a() {
        game.left()
    }
    func s() {
        game.down()
    }
    func d() {
        game.right()
    }
    func w() {
        game.up()
    }
}

class AdapterGameB: AdapterProtocol {
    var game: GameB
    init(game: GameB) {
        self.game = game
    }
    func a() {
        game.left()
    }
    func s() {
        game.squat()
    }
    func d() {
        game.right()
    }
    func w() {
        game.jump()
    }
}

//两款游戏
class GameA {
    func left() {
        print("\(String(describing: self))左移动游戏角色")
    }
    func down() {
        print("\(String(describing: self))下移动游戏角色")
    }
    func right() {
        print("\(String(describing: self))右移动游戏角色")
    }
    func up() {
        print("\(String(describing: self))上移动游戏角色")
    }
}


class GameB {
    func left() {
        print("\(String(describing: self))左移动游戏角色")
    }
    func squat() {
        print("\(String(describing: self))蹲下游戏角色")
    }
    func right() {
        print("\(String(describing: self))右移动游戏角色")
    }
    func jump() {
        print("\(String(describing: self))跳起游戏角色")
    }
}
```
使用：
```swift
//定义出游戏ab，分别指定适配器
let gameA = GameA()
let gameB = GameB()
let adapterA = AdapterGameA(game: gameA)
let adapterB = AdapterGameB(game: gameB)
//游戏开始了，分别按下asdw按键
adapterA.a()//Adapter.GameA左移动游戏角色
adapterA.s()//Adapter.GameA下移动游戏角色
adapterA.d()//Adapter.GameA右移动游戏角色
adapterA.w()//Adapter.GameA上移动游戏角色
adapterB.a()//Adapter.GameB左移动游戏角色
adapterB.s()//Adapter.GameB蹲下游戏角色
adapterB.d()//Adapter.GameB右移动游戏角色
adapterB.w()//Adapter.GameB跳起游戏角色
```
[回到顶部](#jump)
<h1 id="13">13.备忘录模式</h1>
备忘录模式（Memento），在不破坏封装性的前提下，捕获一个对象的内部状态，并在该对象之外保存这个状态。这样以后就可将该对象恢复到原先保存的状态。

定义：
```swift

import Foundation

//假设一款游戏里，一个角色有生命，蓝量两个状态，当用户要打boss前，可以先备份一下，打之前状态，发现打不过时，可以重新开始，从头打BOSS

struct RollState {
    var life: Int
    var blue: Int
}

class Roll {
    var state: RollState
    init(state: RollState) {
        self.state = state
    }
    func saveState() -> RollState {
        return state
    }
    func restoreState(state: RollState) {
        self.state = state
    }
    func kill() {
        state.life = 0
        state.blue = 0
    }
}
```
使用：
```swift
let state = RollState(life: 100, blue: 100)//初始化角色
let roll = Roll(state: state)

let mementoState = roll.saveState()
print(dump(roll))
/*打印角色初始状态
▿ Memento.Roll #0
▿ state: Memento.RollState
- life: 100
- blue: 100
Memento.Roll
*/
roll.kill()
print(dump(roll))
/*角色死亡状态
▿ Memento.Roll #0
▿ state: Memento.RollState
- life: 0
- blue: 0
Memento.Roll
*/
roll.restoreState(state: mementoState)
print(dump(roll))
/*角色恢复后状态
▿ Memento.Roll #0
▿ state: Memento.RollState
- life: 100
- blue: 100
Memento.Roll
*/
```
[回到顶部](#jump)

<h1 id="14">14.组合模式</h1>
组合模式（Composite），将对象组合成树形结构以表示‘部分-整体’的层次结构。组合模式使得用户对单个对象和组合对象的使用具有一致性。

定义：
```swift
import Foundation

//画图案的协议
protocol DrawProtocol {
    func draw()
}

class Circle: DrawProtocol {
    func draw() {
        print("我负责画圆")
    }
}

class Square: DrawProtocol {
    func draw() {
        print("我负责画方形")
    }
}

class Triangle: DrawProtocol {
    func draw() {
        print("我负责画三角形")
    }
}

class Print: DrawProtocol {

    var drawer = [DrawProtocol]()

    func addDrawer(_ drawer: DrawProtocol...) {
        self.drawer.append(contentsOf: drawer)
    }

    func draw() {
        _ = drawer.map{$0.draw()}
    }
}
```
使用：
```swift
//单个对象可以单独使用draw函数，也可以组合到一起，使用组合后的draw
let a = Circle()
let b = Square()
let c = Triangle()
a.draw()//我负责画圆
b.draw()//我负责画方形
c.draw()//我负责画三角形
let p = Print()
p.addDrawer(a,b,c)
p.draw()
/*
我负责画圆
我负责画方形
我负责画三角形
*/
```
[回到顶部](#jump)
<h1 id="15">15.迭代器模式</h1>
迭代器模式（Iterator），提供一种方法顺序访问一个聚合对象中各个元素，而又不暴露该对象的内部表示。

定义：
```swift
import Foundation

//定义了一个算法，利用迭代器后，会依次输出结果
struct Algorithm {
    var index: Int
}

//定义了该算法的迭代器
struct AlgorithmIterator: IteratorProtocol {

    private var current = 1
    var begin: Int

    init(begin: Int) {
        self.begin = begin
    }
    mutating func next() -> Algorithm? {
        defer {
            current += 1
        }
        return Algorithm(index: current * begin)
    }
}

//扩展了该算法，增加一个迭代器方法
extension Algorithm: Sequence {
    func makeIterator() -> AlgorithmIterator {
        return AlgorithmIterator(begin: index)
    }
}
```
使用：
```swift
let algorithm = Algorithm(index: 10)
var iterator = algorithm.makeIterator()
for _ in 1...10 {
print((iterator.next()?.index)!)
}
/*打印结果：
10
20
30
40
50
60
70
80
90
100
*/
```
[回到顶部](#jump)
<h1 id="16">16.单例模式</h1>
单例模式（Singleton），保证一个类仅有一个实例，并提供一个访问它的全局访问点。

定义：
```swift

import Foundation


class Singleton {

    var index = 0

    static let share = Singleton()
    private init() {}
}

```
使用：
```swift
//single是单例
let single = Singleton.share
print(single.index)//0
single.index = 100
print(single.index)//100
//无论获取多少次，都是同一个实例
print(Singleton.share.index)//100
```

[回到顶部](#jump)
<h1 id="17">17.桥接模式</h1>
桥接模式（Bridge），将抽象部分与它的实现部分分离，使它们都可以独立地变化。

定义：
```swift
import Foundation

//接口协议
protocol InterfaceProtocol {
    var app: RealizeProtocol {get set}
    func open()
}

//实现协议
protocol RealizeProtocol {
    func appOpen()
}

//操作类
class Control: InterfaceProtocol {
    var app: RealizeProtocol
    init(app: RealizeProtocol) {
        self.app = app
    }
    func open() {
        app.appOpen()
    }
}

//地图
class Map: RealizeProtocol {
    func appOpen() {
        print("打开地图，开始定位！")
    }
}

//相机
class Camera: RealizeProtocol {
    func appOpen() {
        print("打开摄像头，开始拍照！")
    }
}
```
使用：
```swift
let map = Map()
let camera = Camera()
//把对应app给控制类，运行控制类的抽象接口，则会运行app的接口实现
let control = Control(app: map)
control.open()//打开地图，开始定位！
control.app = camera
control.open()//打开摄像头，开始拍照！
```

[回到顶部](#jump)
<h1 id="18">18.命令模式</h1>
命令模式（Command），将一个请求封装为一个对象，从而使你可用不同的请求对客户进行参数化；对请求排队或记录请求日志，以及支持可撤销的操作。

定义：
```swift
import Foundation


enum DoorActionType {
    case open, close, lock, unlock
}


//命令协议，命令需要实现execute方法
protocol CommandProtocol {
    func execute()
}


//门
struct Door {
    var name: String
}


//门可以执行的操作：开门，关门，上锁，解锁
class DoorAction: CommandProtocol {

    var actionType: DoorActionType
    var door: Door

    init(type: DoorActionType ,door: Door) {
        actionType = type
        self.door = door
    }
    func execute() {
        switch actionType {
        case .open:
            print("\(door.name)执行开门命令！")
        case .close:
            print("\(door.name)执行关门命令！")
        case .lock:
            print("\(door.name)执行上锁命令！")
        case .unlock:
            print("\(door.name)执行解锁命令！")
        }
    }
}


//命令管理者
class DoorManager {

    var actions = [CommandProtocol]()
//添加命令
    func add(_ actions: CommandProtocol...) {
        self.actions += actions
    }
//执行命令
    func execute() {
        _ = actions.map{$0.execute()}
    }
}
```
使用：
```swift
//实例化了一个门，定义了门的动作
let door = Door(name: "客厅门")
let open = DoorAction(type: .open, door: door)
let close = DoorAction(type: .close, door: door)
let lock = DoorAction(type: .lock, door: door)
let unlock = DoorAction(type: .unlock, door: door)
//实例化了门管理者
let manager = DoorManager()
//添加门的动作
manager.add(open, close, lock, unlock)
//执行添加了的命令
manager.execute()
/*
客厅门执行开门命令！
客厅门执行关门命令！
客厅门执行上锁命令！
客厅门执行解锁命令！
*/
```

[回到顶部](#jump)
<h1 id="19">19.职责链模式</h1>
职责链模式（Chain of Responsibility），使多个对象都有机会处理请求，从而避免请求的发送者和接收者之间的耦合关系。将这个对象连成一条链，并沿着这条链传递该请求，直到有一个对象处理它为止。

实现：
```swift
import Foundation

//问题协议
protocol QuestionProtocol {
//指定自己回答不出来，下一个回答的人
    var next: QuestionProtocol? {get set}
//该方法用于问问题
    func answerQuestion(question: String)
}

struct Student: QuestionProtocol {
    var name: String
    var canAnswerQuestion: String
    var next: QuestionProtocol?
    func answerQuestion(question: String) {
        switch question {
        case canAnswerQuestion:
            print("\(name)回答：1+1=2")
        case canAnswerQuestion:
            print("\(name)回答：1*2=2")
        case canAnswerQuestion:
            print("\(name)回答：2*2=4")
        case canAnswerQuestion:
            print("\(name)回答：3*2=6")
        default:
            if let next = next {
                next.answerQuestion(question: question)
            }else {
                print("这个问题没人知道答案！")
            }
        }
    }
}
```
使用：
```swift
let stu1 = Student(name: "小明", canAnswerQuestion: "1+1", next: nil)
let stu2 = Student(name: "小黄", canAnswerQuestion: "1*2", next: stu1)
let stu3 = Student(name: "小芳", canAnswerQuestion: "2*2", next: stu2)
let stu4 = Student(name: "小辉", canAnswerQuestion: "3*2", next: stu3)

//从4开始，自动依次调用，直到有人回答或者都没人回答结束
stu4.answerQuestion(question: "3*2")//小辉回答：1+1=2
stu4.answerQuestion(question: "2*2")//小芳回答：1+1=2
stu4.answerQuestion(question: "1*2")//小黄回答：1+1=2
stu4.answerQuestion(question: "1+1")//小明回答：1+1=2
stu4.answerQuestion(question: "3*3")//这个问题没人知道答案！
```

[回到顶部](#jump)
<h1 id="20">20.中介者模式</h1>
中介者模式（Mediator），用一个中介对象来封装一系列的对象交互。中介者使各对象不需要显式地相互引用，从而使其耦合松散，而且可以独立地改变它们之间的交互。

实现：
```swift
import Foundation

//制造协议
protocol CreateProtocol {
    var name: String {get set}
    func create() -> Any
}

//钢铁
struct Steel {
    var name: String
    var createFrom: String
}

//机器人结构体
struct Robot {
    var name: String
    var steel: Steel
    var createFrom: String
}

//优质造铁厂
class SteelFactory: CreateProtocol {
    var name: String
    init(name: String) {
        self.name = name
    }
    func create() -> Any {
        return Steel(name: "优质钢材", createFrom: name)
    }
}

//劣质造铁厂
class SteelFactoryLow: CreateProtocol {
    var name: String
    init(name: String) {
        self.name = name
    }
    func create() -> Any {
        return Steel(name: "劣质钢材", createFrom: name)
    }
}

//制造机器人的公司
class RobotCompany: CreateProtocol {
    var mediator: Mediator
    var name: String
    init(mediator: Mediator, name: String) {
        self.name = name
        self.mediator = mediator
    }
//机器人制造公司需要钢材，然后向中介者要钢材，中介者去向工厂要。中介者和工厂没有相互引用，工厂可以被替换。
    func create() -> Any {
        return Robot(name: "阿狸机器人", steel: mediator.needSteel(), createFrom: name)
    }
}

//中介者
class Mediator {
    var steelFactory: CreateProtocol
    init(stellFactory: SteelFactory) {
        self.steelFactory = stellFactory
    }
//向中介者要钢材
    func needSteel() -> Steel {
        return steelFactory.create() as! Steel
    }
}
```
使用：
```swift
let factory = SteelFactory(name: "成都钢铁厂")
let factoryLow = SteelFactoryLow(name: "劣质钢铁厂")
let mediator = Mediator(stellFactory: factory)
let company = RobotCompany(mediator: mediator, name: "成都机器人公司")
//开始制造
let robot = company.create() as! Robot
print(robot.createFrom+"制造的机器人\(robot.name)，采用的是"+robot.steel.createFrom+"生产的"+robot.steel.name+"！")//成都机器人公司制造的机器人阿狸机器人，采用的是成都钢铁厂生产的优质钢材！
//中介者更换了钢铁厂，钢铁厂和机器人公司是没有引用的

mediator.steelFactory = factoryLow
let robot1 = company.create() as! Robot
print(robot1.createFrom+"制造的机器人\(robot1.name)，采用的是"+robot1.steel.createFrom+"生产的"+robot1.steel.name+"！")//成都机器人公司制造的机器人阿狸机器人，采用的是劣质钢铁厂生产的劣质钢材！
```

[回到顶部](#jump)
<h1 id="21">21.享元模式</h1>
享元模式（Flyweight），运用共享技术有效地支持大量细粒度的对象。

实现：
```swift
import Foundation

//假设有一家杂货店，一开始老板不知道卖什么，有人来买，马上就制造，进货后就会不会缺货，我们就可以使用享元模式，将有人买过的东西保存起来共享，再有人买直接拿出来就可以，不用再去进新的货。

//商品
struct Commodity: CustomStringConvertible {//CustomStringConvertible该协议能够使自定义输出实例的description
    var commodity: String
    var description: String {
        get {
            return "商品名称："+commodity
        }
    }
}

//杂货店
class GroceryStore {
//商品列表
    private var list = [String: Commodity]()
//mutating关键字作用：在方法中修改struct和enum变量，如果不加，会提示无法修改结构体成员
    func buyCommodity(name: String) -> Commodity {
//无货，制造，制造好后，放到list中共享
        if !list.keys.contains(name) {
            print("没有这个货，给你制造！")
            list[name] = Commodity(commodity: name)
        }else {
            print("有货，直接给你拿！")
        }
        return list[name]!
    }
}
```
使用：
```swift
let shop = GroceryStore()
let commodity1 = shop.buyCommodity(name: "电视")//没有电视，会去创建新的对象
print(commodity1)
/*
没有这个货，给你制造！
商品名称：电视
*/
let commodity2 = shop.buyCommodity(name: "电视")//已经有电视了，去共享的list中取
print(commodity2)
/*
有货，直接给你拿！
商品名称：电视
*/
```

[回到顶部](#jump)
<h1 id="22">22.解释器模式</h1>
解释器模式（Interpreter），给定一个语言，定义它的文法的一种表示，并定义一个解释器，这个解释器使用该表示来解释语言中的句子。

实现：
```swift
import Foundation

//定义一种新的语法，用字符表示，解释"1+2"这个字符串的含义

protocol Interpreter {
//返回一个泛型Result
    static func interpreter<Result>(input: String) -> Result
}

//整型解释器
struct IntInterpreter: Interpreter {
    internal static func interpreter<Result>(input: String) -> Result {
        let arr = input.components(separatedBy: "+")
        return (Int(arr.first!)! + Int(arr.last!)!) as! Result
    }
}

//字符解析器
struct StringInterpreter: Interpreter {
    internal static func interpreter<Result>(input: String) -> Result {
        let arr = input.components(separatedBy: "+")
        return (arr.first! + arr.last!) as! Result
    }
}
```
使用：
```swift
let result: Int = IntInterpreter.interpreter(input: "14+14")
print(result)//28
let result2: String = StringInterpreter.interpreter(input: "14+14")
print(result2)//1414
```

[回到顶部](#jump)
<h1 id="23">23.访问者模式</h1>
访问者模式（Visitor），表示一个作用于某对象结构中的各元素的操作。它使你可以在不改变各元素的类的前提下定义作用于这些元素的新操作。

实现：
```swift
import Foundation

//假设一个人要去访问朋友ABCD
//访客协议
protocol VisitorProtocol {
    func visit(planet: FriendA)
    func visit(planet: FriendB)
    func visit(planet: FriendC)
    func visit(planet: FriendD)
}

//朋友的协议
protocol FriendProtocol {
    func accept(vistor: VisitorProtocol)
}

//A
class FriendA: FriendProtocol {
    func accept(vistor: VisitorProtocol) {
        vistor.visit(planet: self)
    }
}

//B
class FriendB: FriendProtocol {
    func accept(vistor: VisitorProtocol) {
        vistor.visit(planet: self)
    }
}

//C
class FriendC: FriendProtocol {
    func accept(vistor: VisitorProtocol) {
        vistor.visit(planet: self)
    }
}

//D
class FriendD: FriendProtocol {
    func accept(vistor: VisitorProtocol) {
        vistor.visit(planet: self)
    }
}

//访客
class Visitor: VisitorProtocol {
    var address = ""
    func visit(planet: FriendA) {
        address = "访问了朋友A"
    }
    func visit(planet: FriendB) {
        address = "访问了朋友B"
    }
    func visit(planet: FriendC) {
        address = "访问了朋友C"
    }
    func visit(planet: FriendD) {
        address = "访问了朋友D"
    }
}
```
使用：
```swift
//分别创建出朋友
let friends: [FriendProtocol] = [FriendA(), FriendB(), FriendC(), FriendD()]
//每个朋友都去访问
let visitors = friends.map{ (friend: FriendProtocol) -> Visitor in
let visitor = Visitor()
//访问过后，自己的数据就变了
friend.accept(vistor: visitor)
return visitor
}
print(dump(visitors))
/*
▿ 4 elements
▿ Visitor.Visitor #0
- address: "访问了朋友A"
▿ Visitor.Visitor #1
- address: "访问了朋友B"
▿ Visitor.Visitor #2
- address: "访问了朋友C"
▿ Visitor.Visitor #3
- address: "访问了朋友D"
[Visitor.Visitor, Visitor.Visitor, Visitor.Visitor, Visitor.Visitor]
*/
```

[回到顶部](#jump)
