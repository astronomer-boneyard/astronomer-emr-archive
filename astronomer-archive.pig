set kinesis.checkpoint.enabled true;
set kinesis.checkpoint.metastore.table.name astronomer-archive;
set kinesis.checkpoint.hash.key.name HashKey;
set kinesis.checkpoint.range.key.name RangeKey;
set kinesis.checkpoint.logical.name astronomer.archive.version.1

events = LOAD 'astronomer' using com.amazon.emr.kinesis.pig.KinesisStreamLoader() AS (line:chararray);
