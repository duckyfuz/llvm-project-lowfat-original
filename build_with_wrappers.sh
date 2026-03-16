#!/bin/bash
set -e

# Automatically find the directory where this script is located
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up build environment in: $REPO_DIR"

# 1. Load the Clang 4.0 environment (now inside the repo)
export PATH="$REPO_DIR/clang-4.0/bin:$PATH"
# 2. Add local libraries to LD_LIBRARY_PATH (now inside the repo)
export LD_LIBRARY_PATH="$REPO_DIR/local_libs/lib/x86_64-linux-gnu:$REPO_DIR/local_libs/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH"
# 3. Set the LLVM flags for the sub-builds
# export CMAKE_EXTRA_FLAGS="-DLLVM_ENABLE_RUNTIMES='compiler-rt;libcxx;libcxxabi;libunwind' -DCLANG_DEFAULT_UNWINDLIB=libunwind"

# 4. Navigate to the repo and run the build script
cd "$REPO_DIR"

echo "Starting LowFat build..."
./build.sh sizes2.cfg 32
