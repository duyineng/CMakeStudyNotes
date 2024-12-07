# 获取git提交的哈希值
macro(get_git_hash GIT_HASH)   
    find_package(Git QUIET)     # QUIET表示找不到也不报错
    if(GIT_FOUND)
        # 在cmake配置阶段执行
        execute_process(          
            COMMAND ${GIT_EXECUTABLE} log -1 --pretty=format:%h # 命令
            OUTPUT_VARIABLE ${GIT_HASH}                         # 命令输出的内容存入${GIT_HASH}变量
            OUTPUT_STRIP_TRAILING_WHITESPACE                    # 删除输出内容末尾的空白字符和换行字符
            ERROR_QUIET                                         # 对执行错误静默
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}       # 执行路径
        )
    endif()
endmacro()                      

# 获取git的分支名
macro(get_git_branch GIT_BRANCH)   
    find_package(Git QUIET)     
    if(GIT_FOUND)
        execute_process(          
            COMMAND ${GIT_EXECUTABLE} symbolic-ref --short -q HEAD  # 简短方式显示HEAD这个符号引用
            OUTPUT_VARIABLE ${GIT_BRANCH}        
            OUTPUT_STRIP_TRAILING_WHITESPACE    
            ERROR_QUIET                        
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        )
    endif()
endmacro()                     
