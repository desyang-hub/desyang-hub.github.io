---
layout: post
title: unique_ptr自定义删除器
date: 2026-04-26 11:38:00 +0800
categories: [cpp, 智能指针]
tags: [cpp, unique_ptr, 自定义删除器]
toc: true
---
### unique_ptr 自定义删除器：从入门到精通

在 C++11 引入的智能指针中，`std::unique_ptr` 因其高效的性能（零开销抽象）和明确的独占所有权语义而备受推崇。默认情况下，`unique_ptr` 会使用 `delete` 运算符来释放资源。然而，在实际开发中，我们管理的资源往往不仅仅是堆内存，还可能是文件句柄、网络连接、数据库连接或操作系统特定的句柄。这时，默认的 `delete` 就不再适用了，我们需要为 `unique_ptr` 定义**自定义删除器**。

#### 为什么需要自定义删除器？

标准库的 `delete` 只能释放通过 `new` 分配的内存。如果你尝试对以下资源使用默认删除器，会导致未定义行为或资源泄漏：

*   **文件指针**：需要调用 `fclose`。
*   **动态数组**：需要调用 `delete[]`。
*   **Windows 句柄**：需要调用 `CloseHandle`。
*   **SQLite 数据库连接**：需要调用特定的关闭接口。

自定义删除器允许我们告诉 `unique_ptr`："当你要销毁这个对象时，请执行这段特定的代码。"

#### 基本用法回顾

正如示例所示，我们可以使用 Lambda 表达式作为删除器。这里的关键点在于，`unique_ptr` 是一个模板类，它的第二个模板参数正是删除器的类型。由于 Lambda 表达式每个类型的签名都是唯一的，我们通常使用 `decltype` 来推导其类型。

```cpp
// 示例：管理 FILE*
auto fclose_deleter = [](FILE* f) {
    if (f) {
        std::cout << "Closing file via custom deleter\n";
        fclose(f);
    }
};
// 注意：必须显式指定删除器类型为 decltype(fclose_deleter)
std::unique_ptr<FILE, decltype(fclose_deleter)> file_ptr(fopen("test.txt", "r"), fclose_deleter);
```

#### 进阶：使用函数对象（仿函数）

虽然 Lambda 表达式很方便，但在某些情况下（例如需要在多个地方复用同一个删除器类型），定义一个结构体或类作为删除器会更加清晰，且有助于类型封装。

```cpp
struct FileDeleter {
    void operator()(FILE* f) const {
        if (f) {
            std::cout << "Closing file via Functor\n";
            fclose(f);
        }
    }
};

// 使用时，可以直接指定结构体名作为模板参数
// unique_ptr 内部会自动构造 FileDeleter
std::unique_ptr<FILE, FileDeleter> file_ptr2(fopen("test.txt", "r"));
```

**优点**：
*   代码可读性更强，逻辑与定义分离。
*   可以在删除器中保存状态（虽然 `unique_ptr` 的删除器通常是无状态的）。

#### 难点：类型别名与 make_unique

`std::make_unique` 是 C++14 引入的一个非常方便的工厂函数，但它有一个限制：它不支持自定义删除器。如果你需要自定义删除器，就必须直接构造 `unique_ptr`。

此外，每次都写 `std::unique_ptr<FILE, decltype(fclose_deleter)>` 非常繁琐。为了解决这个问题，我们通常使用 C++11 的 **类型别名** 来简化代码。

```cpp
// 定义一个带有自定义删除器的 unique_ptr 类型别名
using FilePtr = std::unique_ptr<FILE, FileDeleter>;

// 现在声明变量变得非常简洁
FilePtr OpenFile(const char* filename) {
    // FilePtr 的构造函数会自动处理删除器的初始化
    return FilePtr(fopen(filename, "r")); 
}

int main() {
    auto fp = OpenFile("test.txt");
    if (fp) {
        std::cout << "File opened successfully\n";
    } // 离开作用域，自动调用 FileDeleter::operator()
}
```

#### 特殊场景：管理动态数组

`unique_ptr` 提供了针对数组的特化版本 `unique_ptr<T[]>`，它会自动使用 `delete[]`。但如果你想结合自定义逻辑（例如在删除前打印日志），你可以这样写：

```cpp
auto array_deleter = [](int* p) {
    std::cout << "Deleting array\n";
    delete[] p;
};

// 指向 int 数组的指针，使用自定义删除器
std::unique_ptr<int, decltype(array_deleter)> arr(new int[10], array_deleter);
```

#### 深入底层：性能与内存占用

你可能会担心："给 `unique_ptr` 加一个删除器，会不会让它变大，变慢？"

答案是：**取决于删除器的类型**。

1.  **空类优化**：
    如果你的删除器是**无状态的**（例如 Lambda 没有捕获任何变量，或者仿函数没有非静态成员变量），C++ 标准库实现通常会应用"空基类优化"（Empty Base Optimization, EBO）。这意味着，即使你添加了删除器，`unique_ptr` 对象的大小**依然保持为 1 个指针的大小**（在 64 位系统上是 8 字节）。

    ```cpp
    // 无状态 Lambda：sizeof(unique_ptr) == 8 (64-bit)
    auto empty_lambda = [](int* p){ delete p; };
    std::unique_ptr<int, decltype(empty_lambda)> p(new int);
    
    // 有状态 Lambda：捕获了变量，sizeof(unique_ptr) 会增加
    int x = 0;
    auto stateful_lambda = [x](int* p){ delete p; }; 
    // 此时 unique_ptr 内部不仅要存指针，还要存 x
    std::unique_ptr<int, decltype(stateful_lambda)> p2(new int);
    ```

2.  **性能开销**：
    `unique_ptr` 的析构函数会调用删除器。对于无状态的删除器，编译器可以像内联普通函数调用一样将其内联，因此**运行时性能几乎为零损耗**。

#### 总结

`std::unique_ptr` 的自定义删除器功能使其不仅仅是一个内存管理工具，更是一个通用的**资源管理工具**（RAII 惯用法的完美实现）。

*   **使用 Lambda**：适合一次性的、简单的清理逻辑。
*   **使用仿函数**：适合复用性强的、逻辑复杂的清理场景。
*   **使用类型别名**：是生产环境中管理复杂 `unique_ptr` 类型的最佳实践。

掌握自定义删除器，能让你写出更安全、更优雅的 C++ 代码，彻底告别资源泄漏。