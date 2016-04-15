## Python for android

本项目基于python的当前最新版本3.5.1。具体的编译步骤如下：

#### 1.编译前准备

- 使用NDK导出的交叉编译工具链。

- 安卓默认不支持nl_langinfo方法(可以使用安卓NDK中的support,可以直接编译出动态库后使用)，因此python无法获取正确的编码。安卓默认使用utf-8，可以直接修改为UTF－8，具体位置Python/pylifecycle.c

  ```c
  Py_FileSystemDefaultEncoding = get_locale_encoding();
  ```

  改为

  ```c
  Py_FileSystemDefaultEncoding = "utf-8";//get_locale_encoding();
  ```

  工程已经改好。

- 我使用的是ubuntu15.10 64位操作系统。

- 由于bionic不支持localeconv(), 可以使用我仓库里的liblocale库。

- Android struct passwd不包含pw_gecos, 修改Module/pwdmodule.c中的

  ```c
  SETS(setIndex++, p->pw_gecos);
  ```

  改为

  ```c
  SETS(setIndex++, p->pw_name);
  ```

#### 2.编译过程

编译需要分别编译pc版与android版，因为需要pc版的生成的语法解析器pgen与_freeze_importlib

- pc版编译

  ```shell
  ./configure && make
  ```

- android版编译

  - ```shell
    ./configure  --build=x86_64-linux-gnu --host=arm-linux-androideabi --disable-ipv6 CONFIG_SITE=config.site --prefix=/system/
    ```

  - 由于android5.0之后开启了pie验证，因此需要对Makefile修改

    ```shell
    CC  =	arm-linux-androideabi-gcc -fPIE -pie
    CXX =	arm-linux-androideabi-g++ -fPIE -pie
    ```
    
  - 可以修改modules文件夹下的Setup修改标准库的支持

  - 添加locale支持

    ```shell
    LIBS =  -ld -llocale
    ```

  - make.

  - make后是会出错的，根据错误拷贝PC版本的pgen与_freeze_importlib到相应的文件夹下。他们分别位于Parser与Programs，最好touch一遍以修改创建时间，

  - make install DESTDIR=/path/to/you/like

####3.编译后

- 编译成功后把system目录下相应的文件夹push到安卓目录下的对应目录。在push之前由于生成的库以及可执行文件体积庞大，因此需要strip一下以及删除部分lib。


- 使用arm-linux-androideabi-strip减小python3.5m与python3.5体积，效果非常明显。


- 删除生成的静态库。


- 可以压缩标准库，然后在使用时指定PYTHONPATH添加相应的python35.zip目录，甚至可以设置成在sdcard中，但仅限压缩后，不压缩不能用是因为android的系统限制不能从SDCARD 中加载动态库。

####4.测试

- 设置PYTHONPATH

  ![path](art/path.png)


- 支持的modules

  ![modules](art/modules.png)
