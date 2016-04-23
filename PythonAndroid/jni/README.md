# How to build

build:

```shell
arm-linux-androideabi-gcc main.c -o libmain.so -lpython3.5m -lz -lm -llocale -lreadline -lhistory -ltermcap -fPIE -pie -shared -llog
```

These shared library and sourde code could be found on
	https://github.com/jianglei12138/readline 
and 
	https://github.com/jianglei12138/liblocale

libpython3.5m.a was compile by python3

