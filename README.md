Honey is a project designed to show how to work with the entire ELK stack with some security-related data.

This project provides:

1. The raw data to analyze and additional data for enrichment.
2. The mappings to create in Elasticsearch.
3. A Logstash confguration file for enriching and loading the data.
4. Kibana visualization and dashboards for viewing the data.
5. Helper scripts to automate (some of) the process.

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

1. You need to have Logstash installed locally.  Elasticsearch and Kibana can be containerized or on other servers.
1. If you use the helper scripts you need to map the environment variable `honey` to the directory where README.md is located.
1. The helper scripts use [HTTPie](https://github.com/jkbrzt/httpie), a great CLI replacement for cURL.  IF you use cURL you are simply heaping pain upon yourself.  I am not a masochist.
1. If you want to rebuild the port list, you will need [CSVkit](https://github.com/onyxfish/csvkit), which will completely rock your world if you work with CSV files.  Totally recommended, but not necessary for this project.


### How to Run

You should run:

```
bin/clear.sh

bin/load.sh
```

There are optional arguments to provide a hostname and port for each of these scripts.  If these aren’t provided it will try to resolve a docker host or use localhost as a last resort.

If you don’t like the scripts, they are only a few lines long, feel free to type out the commands.  They are only provided as a convienience.


### Some Nice Things

Here are some “teachable moments” embedded in this project.

* Using multiple data types for a single field in an Elasticsearch mapping
* Enriching data in Logstash with the Translate filter
* Parsing a CSV in Logstash
* Building Lat/Long data types in Logstash
* Building IP data types in Logstash
* Running a Logstash configuration to an arbitrary server
* Running a Logstash configuration from the beginning of a file every time
* Importing/exporting Kibana objects.
* Using Docker with the ELK stack


