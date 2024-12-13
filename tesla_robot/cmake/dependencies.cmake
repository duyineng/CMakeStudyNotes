message(STATUS "dependencies.cmake")

# 查找Protobuf
if(NOT PROTOBUF_CONFIGURED)
    # 优先使用模块模式，即查找FindProtobuf.cmake，而不是配置模式，ProtobufConfig.cmake
    set(Protobuf_MODULE_COMPATIBLE TRUE)    
    find_package(Protobuf 3 REQUIRED)
    message(STATUS "Found Protobuf " ${Protobuf_VERSION})
    include_directories(${Protobuf_INCLUDE_DIRS})
    set(PROTOBUF_CONFIGURED TRUE)
endif()