# 获取git提交的哈希值
macro(GET_GIT_HASH GIT_HASH)    # 自定义宏名大写，与cmake命令区分  
    find_package(Git QUIET)     # QUIET表示找不到也不报错
    if(GIT_FOUND)
        # 在cmake配置阶段执行
        execute_process(          
            COMMAND ${GIT_EXECUTABLE} log -1 --pretty=format:%h # 命令，%h表示简短的哈希值
            # ${GIT_HASH}表示取得实际传入的参数
            OUTPUT_VARIABLE ${GIT_HASH}                         # 输出的值传入到${GIT_HASH}
            OUTPUT_STRIP_TRAILING_WHITESPACE                    # 删除输出内容末尾的空白字符和换行字符
            ERROR_QUIET                                         # 对执行错误静默
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}       # 执行命令的路径
        )
    endif()
endmacro()

# 获取git的分支名
macro(GET_GIT_BRANCH GIT_BRANCH)   
    find_package(Git QUIET)     
    if(GIT_FOUND)
        execute_process(       
            # 简短方式显示HEAD这个符号引用，即去掉refs/heads/   
            COMMAND ${GIT_EXECUTABLE} symbolic-ref --short -q HEAD  
            OUTPUT_VARIABLE ${GIT_BRANCH}        
            OUTPUT_STRIP_TRAILING_WHITESPACE    
            ERROR_QUIET                        
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        )
    endif()
endmacro()                     
