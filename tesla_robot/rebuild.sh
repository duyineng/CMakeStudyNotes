rm -rf build
mkdir build
cd build
cmake ..
cd ..
cmake --build build -j4 # cmake --build为跨平台的构建命令，build则是构建目录
