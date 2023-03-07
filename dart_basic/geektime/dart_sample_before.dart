//定义商品Item类
class Item {
  late double price;
  late String name;

  Item(name, price) {
    this.name = name;
    this.price = price;
  }
}

//定义购物车类
class ShoppingCart {
  late String name;
  late String code;
  late DateTime date;
  List<Item>? bookings;

  double price() {
    var sum = 0.0;
    var items = bookings;
    if (items != null) {
      for (var i in items) {
        sum += i.price;
      }
    }
    return sum;
  }

  ShoppingCart(name, code) {
    this.name = name;
    this.code = code;
    date = DateTime.now();
  }

  String getInfo() {
    return '购物车信息:' +
        '\n-----------------------------' +
        '\n用户名: ' +
        name +
        '\n优惠码: ' +
        code +
        '\n总价: ' +
        price().toString() +
        '\n日期: ' +
        date.toString() +
        '\n-----------------------------';
  }
}

void _test() {
  var sc = ShoppingCart('张三', '123456');
  sc.bookings = [Item('苹果', 10.0), Item('鸭梨', 20.0)];
  print(sc.getInfo());
}

void main() {
  _test();
}
