Honey is a project designed to show how to work with the entire ELK stack with some security-related data.


The data itself is from [Data Driven Security](http://datadrivensecurity.info/blog/pages/dds-dataset-collection.html).  Muchas gracias to them for providing some usable data.


The project has a number of subdirectories.

* `bin` - binaries for loading the mappings and data into an ELK environment. YMMV.
* `data` - the raw data and lookup files used to transformL with ogstash and loadinto Elasticsearch
* `load` - the Logstash configuration file.
* `map` - the Elasticsearch mappping.
* `tmp` - a junk directory used for work
* `viz` - a JSON dump of the Kibana visualizations

### How to Run

In a very automated way, you should run:

```
bin/clear.sh
bin/load.sh
```

There are optional arguments to provide a hostname and port for each of these scripts.  If these aren’t provided it will try to resolve a docker host or use localhost as a last resort.



