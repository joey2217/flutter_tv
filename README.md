# flutter_tv


## dio

```sh
dart pub add dio
```

https://github.com/cfug/dio/blob/main/dio/README-ZH.md


## shared_preferences

https://pub.dev/packages/shared_preferences

```sh
flutter pub add shared_preferences
```


## flutter json model

### https://pub.dev/packages/json_serializable

### json2dart

> https://caijinglong.github.io/json2dart/index_ch.html

### deps

```sh
flutter pub add --dev build_runner json_serializable 
flutter pub add json_annotation
```

### model

```dart
import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'user.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class User {
  User(this.name, this.email);

  String name;
  String email;

  //不同的类使用不同的mixin即可
  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  // Map<String, dynamic> toJson() => _$UserToJson(this); 
}

```

### generator 

```sh
dart run build_runner build --delete-conflicting-outputs
```    

## Provider

https://github.com/rrousselGit/provider/blob/master/resources/translations/zh-CN/README.md

### install

```sh
flutter pub add provider
```

### Model

```dart
// count_model.dart
import 'package:flutter/widgets.dart';

class CountModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void add() {
    _count += 1;
    notifyListeners();
  }

  void minus() {
    _count -= 1;
    notifyListeners();
  }
}
```

### Provider

```dart
//main.dart
// ...
void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<CountModel>(create: (context) => CountModel()),
      ],
      child: const MyApp()
    ));
}
// ...
```

### Use

最简单的读取值的方式就是使用 BuildContext 上的扩展属性（由 provider 注入）。

- context.watch<T>()，widget 能够监听到 T 类型的 provider 发生的改变。
- context.read<T>()，直接返回 T，不会监听改变。
- context.select<T，R>(R cb(T value))，允许 widget 只监听 T 上的一部分内容的改变。

你也可以使用 Provider.of<T>(context) 这一静态方法，它的表现类似 watch， 而在你为传入 listen: false 参数时（例如 Provider.of<T>(context，listen: false)）， 它的表现与 read 类似。

值得注意的是，context.read<T>() 方法不会在值变化时让 widget 重新构建， 并且不能在 StatelessWidget.build 和 State.build 内调用. 换句话说，它可以在除了这两个方法以外的任意位置调用。


```dart
Text('${Provider.of<CountModel>(context).count}')
```

## [GetX](https://github.com/jonataslaw/getx/blob/master/README.zh-cn.md)

> https://juejin.cn/post/7047762658237349919#heading-23

https://github.com/fluttercommunity/chewie