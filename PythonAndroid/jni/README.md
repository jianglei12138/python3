After making changes to main.c you will need to compile the file for your app:

You will need to use the arm-linux-androideabi which is provided by the Android NDK. Download the latest version and build your toolchain.

## Make cross compile toolchain

In terminal, cd to your NDK path and run the following:

```
./build/tools/make-standalone-toolchain.sh --arch=arm --platform=android-23
```

## Set environment variables

You can edit you profile file or just input this in termial:

```
export PATH=${PATH}:/path/to/android-ndk/arm-eabi/bin/arm-linux-androideabi-gcc
```

## Copy dependancies to the toolchain lib folder

Copy the files libpython3.5.so and liblocale.so in armeabi-v7a to /path/to/android-ndk/arm-eabi/sysroot/usr/lib

## Compile

cd to the jni folder and run the following

```arm-linux-androideabi-gcc main.c -o ../app/src/main/jniLibs/armeabi-v7a/libmain.so -lpython3.5 -lz -lm -llocale -fPIE -pie -shared -llog -I Include/ -I .```

