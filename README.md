# ACM对拍脚本 Linux版

## 使用方法
将有问题的代码放入`main.cpp`  
将正确的代码/标程放入`std.cpp`  
在`rand.cpp`中写入可以生成数据的代码   
运行`judge.sh`

第一次使用前，请在judge目录下执行下面这个命令为`judge.sh`脚本提供可执行权限：  
```bash
chmod +x judge.sh
```

脚本有可执行权限后，每次对拍只需要执行下面这个命令即可开始对拍：  
```bash
./judge.sh
```
## Q&A
Q1、文件夹中，除了cpp文件和judge.sh之外的文件分别是存放什么的呢？  
A1、`rand`文件、`main`文件、`std`文件分别存放三个对应cpp文件编译后的可执行文件；
`data.in`文件存放造出的数据,`pt.out`文件存放main程序的输出结果,`std.out`文件存放std程序的输出结果;
`Runtime.log`文件存放RuntimeError的报错信息，`diff.log`文件存放WA的信息，里面记录了`pt.out`和`std.out`的不同之处，
`CompInfo.log`文件存放编译信息，如果CompileError可以看看编译报错信息  

Q2、对拍前需要先手动编译得到可执行文件吗？  
A2、不需要。`judge.sh`会对三个cpp文件进行编译，造数据，并进行对拍。放好代码后对拍只需一条命令。  

Q3、对拍会执行多少组呢，可以修改组数或中断对拍过程吗？  
A3、默认执行10000组对拍，可以在`judge.sh`文件修改组数，文件内有修改说明，在终端执行的对拍可以按Ctrl+C中断。
另外，如果出现CE，WA，PE，RE的问题，将会自动停止对拍，之后可在`data.in`查看数据。  


---


