project(tesla_robot)

set(LIB_NAME_STATIC tesla_robot_static)

# 加载头文件和源文件列表
macro(load_source header_files source_files)
    file(GLOB_RECURSE ${header_files} "*.h" "*.hpp")
    file(GLOB_RECURSE ${source_files} "*.cpp")

    # 排除 _testing.cpp 结尾的文件
    list(FILTER  ${source_files} EXCLUDE REGEX  ".*_testing.cpp")
endmacro()

load_source(HDRS SRCS)

add_library(${LIB_NAME_STATIC} STATIC
    ${SRCS}
    ${HDRS}
)

set_target_properties(${LIB_NAME_STATIC} PROPERTIES OUTPUT_NAME ${PROJECT_NAME})