# v00
Just throw
compile as C++ and link as C

# v01
Dummy impl

A throw statement is tranlsated into a pair of ___cxa_allocate_exception and ___cxa_throw calls.

## ___cxa_allocate_exception
___cxa_allocate_exception receives a size_t and allocates enough memory to hold the exception being thrown.
There is more to this that what you would expect: 
1) when an exception is being thrown some magic will be hanppening with the stack, so allocating stuff here is not a good idea. 
2) Allocating memory on the heap might also not be a good idea, though, because we might have to throw if we're out of memory.
3) A static allocation is also not a good idea, since we need this to be thread safe (otherwise two throwing threads at the same time would equal disaster).
Given these constraints, most implementations seem to allocate memory on a local thread storage(heap) but resort to an emergency storage(presumably static) if out of memory.

## ___cxa_throw
According to the ABI reference, once the exception has been created __cxa_throw will be called. This function will be responsible of starting the stack unwinding: prepare a bunch of stuff and foward this exception to _Unwind_RaiseException, a set of functions that live in libstdc and perform the real stack unwinding.
An import effect of this: __cxa_throw is never supposed to return. It either delegates execution to the correct catch block to handle the exception or calls std::terminate, but it never returns.

##vtable for ___cxxabiv1::__class_type_info
RTTI.
The entry point the ABI defines to know(in runtime) whehter two types are same or not. This is the function that gets called to determine whether a catch can handle the throw.

# v02
A try and catch block is translated into a pair of __cxa_begin_catch and __cxa_end_catch, plus something called CFI to find landing pads, the points on a function where an exception can be handled.
Then the personality function, which will be called by __cxa_throw, will read gcc_except_table for every method in the stack, to find something called LSDA. The personality function will then check in the LSDA whehter a catch can handle an exception and if there is any cleanup code to run(this is what triggers the destructos when needed.)

CFI: call frame information. It's used mostly, to unwind the stack. It uses LEB encoding. (https://en.wikipedia.org/wiki/LEB128)
LSDA: language specific data area. It's used by the personality function to know which exceptions can be handled by this function. LSDA is in CFI format.

## __cxa_begin_catch

## __cxa_end_catch

## ___gxx_personality_v0


# v03
gcc_except_table

We don't know how does _Unwind_* know where the landing pads are. When an exception is thrown there are a bunch of functions in the stack; all the CFI stuff will let Unwind know which functions these are but it's also necessary to know which landing pads each function provides so we can call each one and check if it wants to handle the exception (we're ignoring functions with multiple try/catch blocks so far).
To know where the landing pads are, something called gcc_excep_table is used. This can be found after the function's end.

If we use the nothrow specifier then the compiler can omit the gcc_except_table for this method. If an exception is thrown when nothrow was specified, the LSDA won't be there and the personality function won't know what to do. It will invoke the default exception handler: calling std::terminate.

# v04




 Let’s recap in a bit more of detail about how an exception will be thrown and catched (or, more precisely, how we know so far it will be thrown catched):

The compiler will translate our throw statement into a pair of __cxa_allocate_exception/__cxa_throw
__cxa_allocate_exception will create the exception in memory
__cxa_throw will initialize a bunch of stuff and forward this exception to a lower-level unwind library by calling _Unwind_RaiseException
Unwind will use CFI to know which functions are on the stack (ie to know how to start the stack unwinding)
Each function will have an LSDA (language specific data area) part, added into something called “.gcc_except_table”
Unwind will invoke the personality function with the current stack frame and the LSDA; this function should reply to unwind whether this stack can handle the exception or not



Let’s go again over our exception throwing and catching recipe:

__cxa_throw/__cxa_allocate_exception will create an exception and forward it to a lower-level unwind library by calling _Unwind_RaiseException
Unwind will use CFI to know which functions are on the stack (ie to know how to start the stack unwinding)
Each function has have an LSDA (language specific data area) part, added into something called “.gcc_except_table”
Unwind will try to locate a landing pad for the exception:
Unwind will call the personality function with the action _UA_SEARCH_PHASE and a context pointing to the current stack frame.
The personality function will check if the current stack frame can handle the exception being thrown by analyzing the LSDA.
If the exception can be handled it will return _URC_HANDLER_FOUND.
If the exception can not be handled it will return _URC_CONTINUE_UNWIND and Unwind will then try the next stack frame.
If no landing pad was found, the default exception handler will be called (normally std::terminate).
If a landing pad was found:
Unwind will iterate the stack again, calling the personality function with the action _UA_CLEANUP_PHASE.
The personality function will check if it can handle the current exception again:
If this frame can’t handle the exception it will then run a cleanup function described by the LSDA and tell Unwind to continue with the next frame (this is actually a very important step: the cleanup function will run the destructor of all the objects allocated in this stack frame!)
If this frame can handle the exception, don’t run any cleanup code: tell Unwind we want to resume execution on this landing pad.
There are two important bits of information to note here:

Running a two-phase exception handling procedure means that in case no handler was found then the default exception handler can get the original exception’s stack trace (if we were to unwind the stack as we go it would get no stack trace, or we would need to keep a copy of it somehow!).
Running a _UA_CLEANUP_PHASE and calling a second time each frame, even though we already know the frame that will handle the exception, is also really important: the personality function will take this chance to run all the destructors for objects built on this scope. It is what makes RAII an exception safe idiom!