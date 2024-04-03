# Rc/Arc的用法

# 如何获取Arc内部的值

Rust中如果想要在多个线程间共享变量T的所有权，必须使用Arc<T>包裹T，通过clone wrapper使用该变量。

使用中，T的所有权Arc所控制的，使用这个变量的调用并不获取其所有权。因此，如果想要改变内部的值，需要像下面这样做

```jsx
let test = Arc::new(snapshot);
let test_as_Ref = test.as_ref();
```

这样就可以拿到原始值的引用，进行任意其他操作