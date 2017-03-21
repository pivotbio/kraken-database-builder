# kraken-database-builder

Converts NCBI RefSeq into a database for use with the Kraken metagenomic read classifier.

LICENSE: MIT

## Usage

```bash
container=$(docker run pivotbio/kraken-database-builder)

docker cp ${container}:kraken-database .
```
