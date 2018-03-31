#include <stdlib.h>
#include <stdio.h>

void *operator new(size_t size) {
  return malloc(size);
}

void *operator new[](size_t size) {
  return operator new(size);
}

void operator delete(void *ptr) {
  free(ptr);
}

void operator delete[](void *ptr) {
  operator delete(ptr);
}

extern "C" void __cxa_pure_virtual(void) {
  fprintf(stderr, "pure virtual method called\n");
  abort();
}
