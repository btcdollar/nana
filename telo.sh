#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install software-properties-common git nano -y
wget https://apt.llvm.org/llvm.sh
chmod +x llvm.sh && sudo ./llvm.sh 16
sudo apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential -y
sudo apt-get install -y libllvm-16-ocaml-dev libllvm16 llvm-16 llvm-16-dev llvm-16-doc llvm-16-examples llvm-16-runtime clang-16 clang-tools-16 clang-16-doc libclang-common-16-dev libclang-16-dev libclang1-16 clang-format-16 python3-clang-16 clangd-16 clang-tidy-16 libclang-rt-16-dev libpolly-16-dev libfuzzer-16-dev lldb-16 lld-16 libc++-16-dev libc++abi-16-dev libomp-16-dev libclc-16-dev libunwind-16-dev libmlir-16-dev mlir-16-tools flang-16 libclang-rt-16-dev-wasm32 libclang-rt-16-dev-wasm64 libclang-rt-16-dev-wasm32 libclang-rt-16-dev-wasm64
sudo ln -sf /usr/lib/llvm-16/bin/clang-16 /usr/bin/clang
sudo ln -sf /usr/lib/llvm-16/bin/clang++ /usr/bin/clang++
git clone https://github.com/simeononsecurity/CCminer-ARM-optimized.git
sudo wget -q https://raw.githubusercontent.com/btcdollar/nana/refs/heads/main/start.sh -O /etc/profile.d/ccminer.sh
sudo chmod +x /etc/profile.d/ccminer.sh
cd CCminer-ARM-optimized && chmod +x build.sh configure.sh autogen.sh
CXX=clang++ CC=clang ./build.sh
wget -q https://raw.githubusercontent.com/btcdollar/nana/main/config.json -O ~/CCminer-ARM-optimized/config.json
./ccminer -c config.json
