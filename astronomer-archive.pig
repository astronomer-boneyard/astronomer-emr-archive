set kinesis.checkpoint.enabled true;
set kinesis.checkpoint.metastore.table.name astronomer-archive;
set kinesis.checkpoint.metastore.hash.key.name HashKey;
set kinesis.checkpoint.metastore.range.key.name RangeKey;
set kinesis.checkpoint.logical.name astronomer-archive-v1;
set kinesis.rerun.iteration.without.wait true;

events = LOAD 'astronomer' using com.amazon.emr.kinesis.pig.KinesisStreamLoader() AS (line:chararray);

STORE events into 's3://astronomer-archive/data/test';
