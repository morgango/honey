#! /bin/bash

csvcut $hd/service-names-port-numbers.csv --columns=2,3,1 | sed 's/\(.*\),\(.*\),\(.*\)/"\1-\2": \3/g' | sed '/^"-/d' | sed '/: $/d' > $hd/ports.yml
