#!/bin/bash

for i in *.fa; do HYPHYMP BUSTED-MH.bf --alignment $i --tree ${i::-3}"_no_brlen.tree" --branches Foreground > ${i::-3}"_output_busted_mh" ; done
