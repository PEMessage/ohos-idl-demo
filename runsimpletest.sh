#!/bin/bash

git -C idl_tool/ apply `readlink -f patch/hostbuild-test.patch`
python3 ./idl_tool/test/sa_test/type_array.py
