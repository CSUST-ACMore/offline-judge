# ACM对拍脚本 Linux版

## 使用方法

将有问题的代码放入 `my.cc`  
将正确的代码/标程放入 `std.cc`  
在 `rand.cc` 中写入可以生成数据的代码  
运行 `judge.sh`  

第一次使用前，请在 `judge/` 目录下执行下面这个命令为 `judge.sh` 脚本提供可执行权限：  
```shell
chmod +x judge.sh
```

脚本有可执行权限后，每次对拍只需要执行下面这个命令即可开始对拍：  
```bash
./judge.sh
```

## Q&A

### Q1. 文件夹中，除了 C++ 文件和 judge.sh 之外的文件分别是存放什么的呢？

A1: `rand.exe` 文件、`my.exe` 文件、`std.exe` 文件分别存放三个对应 C++ 文件编译后的可执行文件；
`data.input` 文件存放造出的数据，`my.output` 文件存放 `my.exe` 程序的输出结果，`std.output` 文件存放 `std.exe` 程序的输出结果;
`Runtime.log` 文件存放产生 `RuntimeError` 的报错信息，`diff.log` 文件存放 `WA` 的信息，里面记录了 `my.output` 和 `std.output` 的不同之处，
`CompInfo.log` 文件存放编译信息，如果 `CompileError` 可以看看编译报错信息。

### Q2. 对拍前需要先手动编译得到可执行文件吗？

A2: 不需要。`judge.sh` 会对三个 c++ 文件进行编译，造数据，并进行对拍。放好代码后对拍只需一条命令。  

### Q3. 对拍会执行多少组呢，可以修改组数或中断对拍过程吗？

A3: 默认执行 1000 组对拍，可以在 `judge.sh` 文件修改组数，文件内有修改说明，在终端执行的对拍可以按 `Ctrl + C` 中断。
另外，如果出现 `CE`，`WA`，`PE`，`RE` 的问题，将会自动停止对拍，之后可在 `data.input` 查看数据。

### Q4. 什么是 .cc 文件？

A4: `.cc` 就是 UNIX 风格的 C++ 文件扩展名，你就把它当作 `.cpp` 好了。
另外，`.out` 是 UNIX 风格的可执行文件扩展名，类似 `.exe`。
为了避免混淆，本仓库统一使用 `.exe` 作为可执行文件扩展名，使用 `.output` 而不是 `.out` 作为输出文件的扩展名。

---
