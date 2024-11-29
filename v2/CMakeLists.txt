#[[静态库和动态库的生成]]
cmake_minimum_required(VERSION 3.15)
project(test)
set(CMAKE_CXX_STANDARD 11)

# 指定头文件搜索路径
include_directories(${PROJECT_SOURCE_DIR}/include)

# 指定源文件列表
#aux_source_directory(${PROJECT_SOURCE_DIR}/src SRC)
file(GLOB SRC ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)

# 设置静态库库输出路径
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY  ${CMAKE_CURRENT_SOURCE_DIR}/lib)
# 设置动态库输出路径
#set(CMAKE_LIBRARY_OUTPUT_DIRECTORY  ${CMAKE_CURRENT_SOURCE_DIR}/lib)

# 静态库
add_library(calc STATIC ${SRC})
# 动态库
#add_library(calc SHARED ${SRC})