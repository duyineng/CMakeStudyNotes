# 获取git提交的哈希值
macro(get_git_hash git_hash)    # 宏名小写，参数大写，与局部变量区分开 
    find_package(Git QUIET)     # QUIET表示找不到也不报错
    if(GIT_FOUND)
        # 在cmake配置阶段执行
        execute_process(          
            COMMAND ${GIT_EXECUTABLE} log -1 --pretty=format:%h # 命令，%h表示简短的哈希值
            # ${git_hash}表示取得实际传入的参数
            OUTPUT_VARIABLE ${git_hash}                         # 输出的值传入到${git_hash}
            OUTPUT_STRIP_TRAILING_WHITESPACE                    # 删除输出内容末尾的空白字符和换行字符
            ERROR_QUIET                                         # 对执行错误静默
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}       # 执行命令的路径
        )
    endif()
endmacro()

# 获取git的分支名
macro(get_git_branch git_branch)   
    find_package(Git QUIET)     
    if(GIT_FOUND)
        execute_process(       
            # 简短方式显示HEAD这个符号引用，即去掉refs/heads/   
            COMMAND ${GIT_EXECUTABLE} symbolic-ref --short -q HEAD  
            OUTPUT_VARIABLE ${git_branch}        
            OUTPUT_STRIP_TRAILING_WHITESPACE    
            ERROR_QUIET                        
            WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        )
    endif()
endmacro()                     
