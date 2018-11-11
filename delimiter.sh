#! /bin/bash
lang=$2
nbLines=$(wc -l $1|cut -d ' ' -f1)
awk -v lc="$lang" '$1 == lc {print NR; exit}' $1
echo $(($nbLines - $(tac $1 | awk -v lc="$lang" -- '$1 == lc {print NR; exit}') ))
