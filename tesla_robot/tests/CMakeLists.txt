project(tesla_robot_test)

enable_testing()

# 读取 src 子目录下的单元测试文件
file(GLOB_RECURSE UNIT_TEST_SRC "${CMAKE_SOURCE_DIR}/src/*_testing.cpp")
MESSAGE(STATUS "单元测试加载: OK" )
MESSAGE(STATUS "单元测试加载: ${UNIT_TEST_SRC}" )

add_executable(${PROJECT_NAME}
    ${UNIT_TEST_SRC}
    
)

target_link_libraries(${PROJECT_NAME}
    gtest_main
    tesla_robot_static
)