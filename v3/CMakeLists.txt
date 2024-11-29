#[[静态库的使用]]
cmake_minimum_required(VERSION 3.15)
project(test)
set(CMAKE_CXX_STANDARD 11)

# 指定头文件搜索路径
include_directories(${PROJECT_SOURCE_DIR}/include)

# 指定源文件列表
file(GLOB SRC ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

link_libraries(calc)
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib1)

add_executable(app ${SRC})
