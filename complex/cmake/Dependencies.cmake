message(STATUS "Dependencies.cmake")

# 查找Protobuf
if(NOT PROTOBUF_CONFIGURED)
    set(Protobuf_MODULE_COMPATIBLE TRUE)    # 使用模块模式来查找Protobuf，而不是配置模式
    find_package(Protobuf 3 REQUIRED)
    message(STATUS "Found Protobuf " ${Protobuf_VERSION})
    include_directories(${Protobuf_INCLUDE_DIRS})
    set(PROTOBUF_CONFIGURED TRUE)
endif()