# kraken-database-builder

Converts NCBI RefSeq into a database for use with the Kraken metagenomic read
classifier.

Instead of building a Kraken database with a list of given genomes, just build
a database on EVERY GENOME EVER! Why wouldn't you do this in the first place?
Isn't the point of metagenomic sequencing to find out what's in your sample?

The RefSeq database uses accession numbers and Kraken needs taxonomic
identifiers (taxids). It's pretty straightforward to just download the text
file mapping GIs to taxids except that the list is really huge and won't fit in
memory. To solve this, we use an on-disk database (postgreSQL) to construct an
indexed table to map GIs to taxids and then query this in batches to reformat
RefSeq into something that Kraken will like.

This entire projects comes as a docker image that you can run on Amazon AWS
(because building a Kraken database requires a lot of memory). We run this
using docker-machine on a hefty "r3.8xlarge" instance which costs a whopping
$2.66/hour. It takes about XX hours to download, convert, build and export this
database (so about yy dollars in total or roughly the cost of a burrito).

## Usage

```bash
container=$(docker run pivotbio/kraken-database-builder)

docker cp ${container}:kraken-database .
```

## License

MIT. See `LICENSE` for details.
