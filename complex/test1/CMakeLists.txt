cmake_minimum_required(VERSION 3.15)
project(test1)

# 头文件搜索路径
include_directories(${HEADPATH})
# 搜索源文件
aux_source_directory(./ SRC)
# 静态库搜索路径
link_directories(${LIBPATH})
# 链接静态库
link_libraries(${CALCLIB})
# 可执行程序生成路径
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${EXECPATH})
# 生成可执行程序
add_executable(${APPNAME1} ${SRC})
