#[[可执行程序的生成]]
cmake_minimum_required(VERSION 3.15)
project(test)
set(CMAKE_CXX_STANDARD 11)

# 指定头文件搜索路径
include_directories(${PROJECT_SOURCE_DIR}/include)

# 指定源文件列表
#aux_source_directory(${PROJECT_SOURCE_DIR}/src SRC)
file(GLOB SRC ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)

# 可执行程序输出路径
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/bin)
add_executable(app ${SRC})