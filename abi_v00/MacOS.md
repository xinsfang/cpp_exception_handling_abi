```shell
gcc main.o throw.o -O0 -ggdb -o app
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
make: *** [app] Error 1
```
