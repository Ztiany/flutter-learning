# 状态选型对比

状态管理技术不少于 10 种，比如：

- 第一个是原生所使用的 InheritedWidget ；
- 第二个是相对前端同学比较熟悉的 Redux 技术；
- 最后一个则是我们推荐使用的技术 Provider 。
- ...

## 1 InheritedWidget

InheritedWidget 是原生方案，具体参考官方文档。

## 2 Redux

由于 Redux 在前端是一个比较常用的状态管理技术解决方案，因此这里简单介绍一下，不过在 Flutter 中 ，Redux 并非第一选择。Redux 核心思想是单向数据流架构，将所有的状态存储在
store 中，所有数据改变都是通过 Action ，然后 Action 触发 store 存储，store 变化触发所有应用该状态的组件的 build 操作。

具体参考 [flutter_redux](https://pub.dev/packages/flutter_redux/example)。

## 3 Provider

Provider 是官方推荐的技术方案，具体参考 [provider](ttps://pub.dev/packages/provider)。

## 4 总结

上面三种技术方案，在同页面组件共享都没有任何问题，在性能方面也都解决了组件更新避免全局子组件的更新问题。

- 但是 InheritedWidget 在多页面间数据共享比较麻烦（因为需要一个共同的父节点，对于多个页面来说没有共同的父节点这个概念）;
- 这点对于 Redux 和 Provider 则较为简单。其次由于 Redux 容易陷入无限的深度嵌套，因此也不建议使用；
- 所以推荐使用 Provider 技术方案，使用方式较为简单，其次也不会带来其他负面的影响。
