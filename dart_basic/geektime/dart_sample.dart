class Meta {
  double price;
  String name;

  //成员变量初始化语法糖
  Meta(this.name, this.price);
}

class Item extends Meta {
  Item(name, price) : super(name, price);

  //重载 + 运算符，将商品对象合并为套餐商品
  Item operator +(Item item) => Item(name + item.name, price + item.price);
}

abstract class PrintHelper {
  void printInfo() => print(getInfo());

  Object getInfo();
}

//with表示以非继承的方式复用了另一个类的成员变量及函数
class ShoppingCart extends Meta with PrintHelper {
  late DateTime date;
  String? code;
  List<Item>? bookings;

  //以归纳合并方式求和
  @override
  double get price =>
      (bookings?.reduce((value, element) => value + element).price) ?? 0;

  //默认初始化函数，转发至 withCode 函数
  ShoppingCart({name}) : this.withCode(name: name, code: null);

  //withCode 初始化方法，使用语法糖和初始化列表进行赋值，并调用父类初始化方法
  ShoppingCart.withCode({required name, this.code})
      : date = DateTime.now(),
        super(name, 0);

  //??运算符表示为code不为null，则用原值，否则使用默认值"没有"
  @override
  String getInfo() => '''
购物车信息:
-----------------------------
  用户名: $name
  优惠码: ${code ?? "没有"}
  总价: $price
  Date: $date
-----------------------------
''';
}

void _test() {
  ShoppingCart.withCode(name: '张三', code: '123456')
    ..bookings = [Item('苹果', 10.0), Item('鸭梨', 20.0)]
    ..printInfo();

  ShoppingCart.withCode(name: '王五', code: 'ddd')
    ..bookings = [Item('香蕉', 15.0), Item('西瓜', 40.0)]
    ..printInfo();

  ShoppingCart(name: '李四')
    ..bookings = [Item('香蕉', 15.0), Item('西瓜', 40.0)]
    ..printInfo();
}

void main() {
  _test();
}
