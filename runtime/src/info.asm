.align 2
.section .module_info
.global smodule_info
.global emodule_info
smodule_info:
    .incbin "/home/zfl/桌面/dso/runtime/info.txt"
emodule_info:
