SET kinesis.checkpoint.enabled true;
SET kinesis.checkpoint.metastore.table.name astronomer-archive;
SET kinesis.checkpoint.metastore.hash.key.name HashKey;
SET kinesis.checkpoint.metastore.range.key.name RangeKey;
SET kinesis.checkpoint.logical.name astronomer-archive-v1;
SET kinesis.rerun.iteration.without.wait true;

events = LOAD 'astronomer' using com.amazon.emr.kinesis.pig.KinesisStreamLoader() AS (line:chararray);

STORE events into 's3://astronomer-archive/data/test';
