project(tesla_robot)

set(LIB_NAME_STATIC tesla_robot_static)

# 加载头文件和源文件列表
macro(loadSource hFile srcFile)
    file(GLOB_RECURSE ${hFile} "*.h" "*.hpp")
    file(GLOB_RECURSE ${srcFile} "*.cpp")

    # 排除 _testing.cpp 结尾的文件
    list(FILTER  ${srcFile} EXCLUDE REGEX  ".*_testing.cpp")
endmacro()

loadSource(HDRS SRCS)

add_library(${LIB_NAME_STATIC} STATIC
    ${SRCS}
    ${HDRS}
)

set_target_properties(${LIB_NAME_STATIC} PROPERTIES OUTPUT_NAME ${PROJECT_NAME})