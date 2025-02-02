# REQUIRES: exegesis-can-execute-in-subprocess, x86_64-linux

# Test that we can use the subprocess executor mode with memory annotations
# while having live-ins still work as expected.

# RUN: llvm-exegesis -mtriple=x86_64-unknown-unknown -mode=latency -snippets-file=%s -execution-mode=subprocess | FileCheck %s

# CHECK: measurements:
# CHECK-NEXT: value: {{.*}}, per_snippet_value: {{.*}}

# LLVM-EXEGESIS-MEM-DEF test1 4096 2147483647
# LLVM-EXEGESIS-MEM-MAP test1 8192
# LLVM-EXEGESIS-LIVEIN R14

movq $8192, %rax
movq %r14, (%rax)
