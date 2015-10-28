Honey is a project designed to show how to work with the entire ELK stack with some security-related data.


![](https://github.com/morgango/honey/blob/master/kibana.png)

This project provides:

1. The raw data to analyze and additional data for enrichment.
1. The mappings to create in Elasticsearch.
1. A Logstash confguration file for enriching and loading the data.
1. Kibana visualization and dashboards for viewing the data.
1. Helper scripts to automate (some of) the process.

### Layout

The project has a number of subdirectories.

* `bin` - binaries for loading the mappings and data into an ELK environment. YMMV.
* `data` - the raw data and lookup files used to transform with Logstash and load into Elasticsearch.
* `load` - the Logstash configuration file. You will need to change this for your environment.
* `map` - the Elasticsearch mappping.
* `tmp` - a junk directory used for work.
* `viz` - a JSON dump of the Kibana visualizations.

### Data

The data itself is from [Data Driven Security](http://datadrivensecurity.info/blog/pages/dds-dataset-collection.html).  Muchas gracias to them for providing some usable data. In addition, I have enriched the data, providing protocol names (like HTTP, SSH, etc) to match the ports that are being provided in the data.


#### Dictionary

The important fields in the data are:

* `attack_vector` - text that describes the protocol used to attack the server, if available (often it is not).  This is added to the original data.
* `country_code` -  text for the country code for the attacker
* `country` -  full text for the country name
* `destination_port` -  the port that was attacked, related to `attack_vector`.  Kept as a string and an integer
* `event_datetime` - the date/time of the attack, normalized.
* `host` - the name of the host that was attacked, just an internal naming convention from the original data.
* `latitude` -  the latitude of the attacker, stored as an integer
* `locale` -  the locale of the attacker, good for free text searching
* `locale_abbr` -  an abbreviation of the locale, if available
* `lon_lat` -  a geo field that allows for really efficient searching in Elasticsearch.  This is added to the original data.
* `longitude` -  the longitude of the attacker, stored as an integer
* `postal_code` -  the postal_code of the attacker, if available.
* `protocol` -  the protocol used to attack (TCP/UDP/ICMP)
* `source_ip` -  the IP address of the attacker, stored as a searchable IP field.
* `source_port` -  the port that was used to attack.  Kept as a string and an integer

### Dependencies

1. You need to have Logstash installed locally and in the `$PATH`.  Elasticsearch and Kibana can be containerized or on other servers.
1. The helper scripts use [HTTPie](https://github.com/jkbrzt/httpie), a great CLI replacement for cURL.  IF you use cURL you are simply heaping pain upon yourself.  I am not a masochist.
1. If you want to rebuild the port list, you will need [CSVkit](https://github.com/onyxfish/csvkit), which will completely rock your world if you work with CSV files.  Totally recommended, but not necessary for this project.

### How to Run

First, you should put the `logstash/bin` directory into your `PATH` variable.  The `load.sh` script has to use it to load the data, and if it can’t find it we are dead in the water.  It will take care of everything as long as it knows where it is.
```
export PATH=$PATH:/path/to/your/logstash/bin 
```

To get things started, you should run:

```
bin/clear.sh <host name> <port>

bin/load.sh <host name> <port>
```

There are optional arguments to provide a hostname and port for each of these scripts.  If these aren’t provided it will try to resolve a docker host or use localhost as a last resort. If you don’t like the scripts, they are only a few lines long, feel free to type out the commands.  They are only provided as a convienience, they take the hard-coded values in logstash and override them for the local environment.

Lastly, you should import the json files in the `viz` directory into Kibana through the advanced settings.

### Some Nice Things

Here are some “teachable moments” embedded in this project.

* Using multiple data types for a single field in an Elasticsearch mapping
* Enriching data in Logstash with the Translate filter
* Parsing a CSV in Logstash
* Building Lat/Long data types in Logstash
* Building IP data types in Logstash
* Running a Logstash configuration to an arbitrary server
* Running a Logstash configuration to point at an arbitrary directory
* Running a Logstash configuration from the beginning of a file every time
* Importing/exporting Kibana objects.
* Using Docker with the ELK stack


