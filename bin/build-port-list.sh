#! /bin/bash

csvcut $honey/data/service-names-port-numbers.csv --columns=2,3,1 | sed 's/\(.*\),\(.*\),\(.*\)/"\1-\2": \3/g' | sed '/^"-/d' | sed '/: $/d' > $honey/data/ports.yml
