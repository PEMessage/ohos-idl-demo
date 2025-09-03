#!/bin/bash

# See: https://blog.csdn.net/qq_37793601/article/details/127484310
#      https://github.com/openharmony/docs/blob/40ff3d68bbca2c6c83a8b35a47bf932a2ef27a63/zh-cn/application-dev/IDL/idl-guidelines.md?plain=1#L159

set -xe


idl_tool() {
    mkdir -p foundation/ability/idl_tool
    git -C foundation/ability/idl_tool \
        clone https://gitee.com/openharmony/ability_idl_tool.git \
        -b OpenHarmony-v5.1.0-Release . || echo "ignore error"
}

bounds_checking_function() {
    mkdir -p third_party/bounds_checking_function
    git -C third_party/bounds_checking_function \
        clone https://gitee.com/openharmony/third_party_bounds_checking_function.git \
        -b OpenHarmony-v5.1.0-Release . || echo "ignore error"
}


idl_tool
bounds_checking_function
# make -C foundation/ability/idl_tool -j8 Q=
make -C foundation/ability/idl_tool/idl_tool_2 -j8 Q=
if [ ! -f idl-gen ] ; then
    ln -s foundation/ability/idl_tool .
    ln -s foundation/ability/idl_tool/idl_tool_2 .
    ln -s foundation/ability/idl_tool/idl_tool_2/idl-gen .
fi
