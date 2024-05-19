#!/bin/sh
#

ROOT_SPACE="$(df -H | grep -E "/$" | awk '{print $3}')"
HOME_SPACE="$(df -H | grep -E "/home$" | awk '{print $3}')"

echo $ROOT_SPACE  

