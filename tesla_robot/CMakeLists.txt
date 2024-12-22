#[[ 复杂的cmake ]]
cmake_minimum_required(VERSION 3.15)
project(tesla_robot)

# include一般用于加载自定义的.cmake模块文件，也可用于加载CMake自带的.cmake模块文件，如include(FindOpenSSL)
#[[
    当使用include(FindOpenSSL)，会直接加载FindOpenSSL.cmake模块，不会尝试查找配置文件OpenSSLConfig.cmake
    查找FindOpenSSL.cmake模块文件时，会到/usr/local/share/cmake-3.22/Modules目录下查找
]]
include(${CMAKE_SOURCE_DIR}/cmake/dependencies.cmake)   # ${CMAKE_SOURCE_DIR}为主cmake文件所在目录
include(${CMAKE_SOURCE_DIR}/cmake/utility.cmake)

# 获取当前的提交哈希值
set(GIT_HASH "")
get_git_hash(GIT_HASH)
message(STATUS "Git hash is ${GIT_HASH}")
# 获取当前的分支
set(GIT_BRANCH "")
get_git_branch(GIT_BRANCH)
message(STATUS "Git branch is ${GIT_BRANCH}")
# 生成git_version.h文件
configure_file(
    ${CMAKE_SOURCE_DIR}/include/git_version.h.in  # 输入文件
    ${CMAKE_SOURCE_DIR}/include/git_version.h     # 输出文件
    @ONLY     # 只替换@VAR@这样的格式变量
)

set(CMAKE_CXX_STANDARD 11)

# 全局设置编译后的库和可执行程序存放目录
SET(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib) # ${CMAKE_BINARY_DIR}为根构建目录
SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
SET(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_subdirectory(third_part/googletest)

# 添加子目录
add_subdirectory(src)
add_subdirectory(main/tesla_robot_calc)
add_subdirectory(main/tesla_robot_sort)

add_subdirectory(tests)