#include <stdarg.h>
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <Foundation/Foundation.h>


typedef struct PtrVec {
  const uint8_t *data;
  size_t size;
} PtrVec;

struct PtrVec compile(const char *filename) CF_SWIFT_NAME(compile(filename:));

struct PtrVec compile_str(const char *code) CF_SWIFT_NAME(compile_str(code:));
