message(STATUS "dependencies.cmake")

# 查找Protobuf库
if(NOT PROTOBUF_CONFIGURED) # PROTOBUF_CONFIGURED是一个自定义变量，如果之前未定义，这里不会被定义
    #[[
        当模块文件或者配置文件发现Protobuf_MODULE_COMPATIBLE变量的值为TRUE
        就会使得变量名风格兼容模块风格，不影响find_package中的参数名
        模块风格变量：PROTOBUF_INCLUDE_DIRS
        配置风格变量：Protobuf_INCLUDE_DIRS
    ]]
    set(Protobuf_MODULE_COMPATIBLE TRUE)    # 后续仍然使用配置风格变量，所以这句实际没起到作用    
    #[[
        将优先查找ProtobufConfig.cmake配置文件，再查找FindProtobuf.cmake模块文件
        ProtobufConfig.cmake位于/usr/local/lib/cmake/protobuf/下
    ]]
    find_package(Protobuf 3 REQUIRED)       # REQUIRED表示要求找到，如果找不到就报错
    message(STATUS "Found Protobuf " ${Protobuf_VERSION})
    include_directories(${Protobuf_INCLUDE_DIRS})
    set(PROTOBUF_CONFIGURED TRUE)           # 这里才会被定义
endif()