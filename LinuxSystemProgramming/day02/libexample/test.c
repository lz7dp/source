#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>

int main()
{
    // Load the dinamic library:
    void* lib_add = dlopen("/usr/lib/libadd.so", RTLD_LAZY | RTLD_GLOBAL);
    // Declare the function pointers:
    void (*fptr_setSummand)(int);
    int (*fptr_add)(int);
    // Get the pointers to the functions within the library:
    fptr_setSummand = dlsym(lib_add, "setSummand");
    fptr_add = dlsym(lib_add, "add");
    // Call the function via the function pointer:
    fptr_setSummand(42);
    int result = fptr_add(7);
    printf("Result: %d\n", result);
    return 0;
}

