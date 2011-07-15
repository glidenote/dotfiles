#!/bin/sed -f
## MEMO
# [0m  reset
# [1m  bold
# [3m  italic
# [4m  underline
# [5m  blink
# [30m black
# [31m red
# [32m green
# [33m yellow
# [34m blue
# [35m magenta
# [36m cyan
# [37m white
s/\(HTTP\/1..\"\) \(2[0-9][0-9]\) /\1 \x1b[34m\2\x1b[0m /
s/\(HTTP\/1..\"\) \(3[0-9][0-9]\) /\1 \x1b[32m\2\x1b[0m /
s/\(HTTP\/1..\"\) \(4[0-9][0-9]\) /\1 \x1b[33m\2\x1b[0m /
s/\(HTTP\/1..\"\) \(5[0-9][0-9]\) /\1 \x1b[31m\2\x1b[0m /
