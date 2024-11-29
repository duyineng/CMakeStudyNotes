cmake_minimum_required(VERSION 3.15)
project(sort)

# 头文件搜索路径
include_directories(${HEADPATH})
# 搜索源文件
aux_source_directory(./ SRC)
# 静态库生成路径
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${LIBPATH})
# 生成静态库
add_library(${SORTLIB} STATIC ${SRC})