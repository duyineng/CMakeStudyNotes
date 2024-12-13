project(tesla_robot_sort)

loadSource(HDRS SRCS)

add_executable(${PROJECT_NAME}
    ${SRCS}
    ${HDRS}
)

target_link_libraries(${PROJECT_NAME}
    tesla_robot_static
)