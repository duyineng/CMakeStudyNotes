#[[复杂的cmake]]
cmake_minimum_required(VERSION 3.15)
project(test)

# 引入cmake模块
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/Dependencies.cmake)
include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/utility.cmake)

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
    ${CMAKE_CURRENT_SOURCE_DIR}/include/git_version.h.in  # 输入文件
    ${CMAKE_CURRENT_SOURCE_DIR}/include/git_version.h     # 输出文件
    @ONLY     # 只替换@VAR@这样的格式变量
)

set(CMAKE_CXX_STANDARD 11)



# 静态库生成的路径
set(LIBPATH ${PROJECT_SOURCE_DIR}/lib)
# 可执行程序生成的路径
set(EXECPATH ${PROJECT_SOURCE_DIR}/bin)
# 头文件的路径
set(HEADPATH ${PROJECT_SOURCE_DIR}/include)
# 库文件的名字
set(CALCLIB calc)
set(SORTLIB sort)
# 可执行程序的名字
set(APPNAME1 app1)
set(APPNAME2 app2)

# 添加子目录
add_subdirectory(src/calc)
add_subdirectory(src/sort)
add_subdirectory(test1)
add_subdirectory(test2)


