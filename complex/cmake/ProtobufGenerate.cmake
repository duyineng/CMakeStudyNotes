# 生成.pb.cc和.pb.h文件
macro(proto_generate PROTO_DIR PROTO_CC_FILES PROTO_H_FILES)
    file(GLOB_RECURSE proto_files ${PROTO_DIR}/*.proto)
    foreach(proto_file ${proto_files})
        get_filename_component(PROTO_DIR ${proto_file} DIRECTORY)
        get_filename_component(PROTO_NAME ${proto_file} NAME_WE)
        set(proto_output ${PROTO_DIR}/${PROTO_NAME}.pb.cc ${PROTO_DIR}/${PROTO_NAME}.pb.h)

        # 在make构建阶段执行
        # 不会每次构建都执行，根据OUTPUT和DEPENDS的时间戳来判断是否需要执行
        add_custom_command(
                OUTPUT ${proto_output}
                COMMAND  ${Protobuf_PROTOC_EXECUTABLE}
                ARGS --cpp_out=${PROTO_DIR} -I${PROTO_DIR} ${proto_file}
                COMMENT "Generating ${proto_output} from ${proto_file}"
                DEPENDS ${proto_file}
        )

        # 在宏内参数PROTO_CC_FILES表示一个字符串，用${}获取这个变量名所代表的实际变量
        list(APPEND ${PROTO_CC_FILES} ${PROTO_DIR}/${PROTO_NAME}.pb.cc)
        list(APPEND ${PROTO_H_FILES} ${PROTO_DIR}/${PROTO_NAME}.pb.h)
    endforeach()
endmacro()