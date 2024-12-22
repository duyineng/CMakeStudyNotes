// 这是一个cmake模板文件，最终会生成git_version.h文件

#ifndef C0MPLEX_INCLUDE_GIT_VERSION_H
#define C0MPLEX_INCLUDE_GIT_VERSION_H

constexpr const char * git_hash() noexcept { return "7acb705"; }
constexpr const char * git_branch() noexcept { return "master"; }

#endif //!C0MPLEX_INCLUDE_GIT_VERSION_H
