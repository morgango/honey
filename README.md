Honey is a project designed to show how to work with the entire ELK stack with some security-related data.

This project provides:

1. The raw data to analyze and additional data for enrichment.
2. The mappings to create in Elasticsearch.
3. A Logstash confguration file for enriching and loading the data.
4. Kibana visualization and dashboards for viewing the data.

### Layout

The project has a number of subdirectories.

* `bin` - binaries for loading the mappings and data into an ELK environment. YMMV.
* `data` - the raw data and lookup files used to transformL with ogstash and loadinto Elasticsearch
* `load` - the Logstash configuration file. You will need to change this for your environment.
* `map` - the Elasticsearch mappping.
* `tmp` - a junk directory used for work
* `viz` - a JSON dump of the Kibana visualizations

### Data

The data itself is from [Data Driven Security](http://datadrivensecurity.info/blog/pages/dds-dataset-collection.html).  Muchas gracias to them for providing some usable data.

In addition, I have enriched the data, providing protocol names (like HTTP, SSH, etc) to match the ports that are being provided in the data.

### Dependencies

The helper scripts use [HTTPie](https://github.com/jkbrzt/httpie), a great CLI replacement for cURL.  IF you use cURL you are simply heaping pain upon yourself.  I am not a masochist.

### How to Run

You should run:

```
bin/clear.sh

bin/load.sh
```

There are optional arguments to provide a hostname and port for each of these scripts.  If these aren’t provided it will try to resolve a docker host or use localhost as a last resort.

If you don’t like the scripts, they are only a few lines long, feel free to type them or use CURL or the method of your choice.  They are only provided as a convienience.



