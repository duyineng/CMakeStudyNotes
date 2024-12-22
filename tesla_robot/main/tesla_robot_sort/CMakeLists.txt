project(tesla_robot_sort)

load_source(HDRS SRCS)

add_executable(${PROJECT_NAME}
    ${HDRS}
    ${SRCS}
)

target_link_libraries(${PROJECT_NAME}
    tesla_robot_static
)