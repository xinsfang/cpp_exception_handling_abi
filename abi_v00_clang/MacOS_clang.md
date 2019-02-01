# c++ is good
```shell
c++ main.o throw.o -v -o main
Apple LLVM version 9.0.0 (clang-900.0.39.2)
Target: x86_64-apple-darwin16.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld" -demangle -lto_library /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libLTO.dylib -dynamic -arch x86_64 -macosx_version_min 10.12.0 -o main main.o throw.o -lc++ -lSystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/9.0.0/lib/darwin/libclang_rt.osx.a
```

# cc (coompile as C++ and link as C) is bad. Because it doesn't link to libc++: '-lc++'
```shell
cc main.o throw.o -v -o main
Apple LLVM version 9.0.0 (clang-900.0.39.2)
Target: x86_64-apple-darwin16.7.0
Thread model: posix
InstalledDir: /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin
 "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ld" -demangle -lto_library /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libLTO.dylib -dynamic -arch x86_64 -macosx_version_min 10.12.0 -o main main.o throw.o -lSystem /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/9.0.0/lib/darwin/libclang_rt.osx.a
Undefined symbols for architecture x86_64:
  "vtable for __cxxabiv1::__class_type_info", referenced from:
      typeinfo for Exception in throw.o
  NOTE: a missing vtable usually means the first non-inline virtual member function has no definition.
  "___cxa_allocate_exception", referenced from:
      _seppuku in throw.o
  "___cxa_throw", referenced from:
      _seppuku in throw.o
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)
```

```
 ___cxa_allocate_exception


 ___cxa_throw

___cxa_throw never returns. It either
1. delegates execution to the correct catch block to handle the exception
2. or calls std::terminate


 vtable for __cxxabiv1::__class_type_info
```



