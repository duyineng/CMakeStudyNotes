#[[静态库的使用]]
cmake_minimum_required(VERSION 3.15)
project(test)
set(CMAKE_CXX_STANDARD 11)

# 指定头文件搜索路径
include_directories(${PROJECT_SOURCE_DIR}/include)

# 指定源文件列表
file(GLOB SRC ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)

# 在这条命令之后定义的所有可执行文件(add_executable)和库(add_library)都会自动链接这些库
# 无论它们是否真的需要
link_libraries(calc)

link_directories(${CMAKE_CURRENT_SOURCE_DIR}/lib1)

add_executable(app ${SRC})
