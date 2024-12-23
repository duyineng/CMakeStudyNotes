# 生成.pb.cc和.pb.h文件
macro(proto_generate proto_dir proto_cc_files proto_h_files)
    file(GLOB_RECURSE proto_files ${proto_dir}/*.proto)
    foreach(proto_file ${proto_files})
        get_filename_component(proto_dir ${proto_file} DIRECTORY)
        get_filename_component(PROTO_NAME ${proto_file} NAME_WE)
        set(proto_output ${proto_dir}/${PROTO_NAME}.pb.cc ${proto_dir}/${PROTO_NAME}.pb.h)

        # 在make构建阶段执行
        # 不会每次构建都执行，根据OUTPUT和DEPENDS的时间戳来判断是否需要执行
        add_custom_command(
                OUTPUT ${proto_output}
                COMMAND  ${Protobuf_PROTOC_EXECUTABLE}
                ARGS --cpp_out=${proto_dir} -I${proto_dir} ${proto_file}
                COMMENT "Generating ${proto_output} from ${proto_file}"
                DEPENDS ${proto_file}
        )

        # 在宏内参数proto_cc_files表示一个字符串，用${}获取这个变量名所代表的实际变量
        list(APPEND ${proto_cc_files} ${proto_dir}/${PROTO_NAME}.pb.cc)
        list(APPEND ${proto_h_files} ${proto_dir}/${PROTO_NAME}.pb.h)
    endforeach()
endmacro()