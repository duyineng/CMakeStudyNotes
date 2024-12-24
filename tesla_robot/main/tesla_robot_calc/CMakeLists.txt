project(tesla_robot_calc)

load_source(HDRS SRCS)

add_executable(${PROJECT_NAME}
    ${HDRS}
    ${SRCS}
)

target_link_libraries(${PROJECT_NAME}
    tesla_robot_static
)

# 添加自定义命令，用于生成调试符号文件
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD    # POST_BUILD表示在目标${PROJECT_NAME}构建之后，才执行下面的命令
    #[[
        $<TARGET_FILE:${PROJECT_NAME}>表示${PROJECT_NAME}目标的绝对路径
        $<TARGET_FILE_DIR:${PROJECT_NAME}>表示${PROJECT_NAME}目标所在的文件夹路径
        --only-keep-debug表示只提取目标文件中的调试信息，并将其保存到一个单独的文件中
    ]]
    COMMAND objcopy --only-keep-debug $<TARGET_FILE:${PROJECT_NAME}> $<TARGET_FILE_DIR:${PROJECT_NAME}>/${PROJECT_NAME}.debug
    # --strip-debug表示只从目标剥离调试信息，而动态符号表等用于动态链接的符号仍然保留，即目标的体积会变小
    COMMAND ${CMAKE_STRIP} --strip-debug $<TARGET_FILE:${PROJECT_NAME}>
    COMMENT "Generating debug symbol file"
)
