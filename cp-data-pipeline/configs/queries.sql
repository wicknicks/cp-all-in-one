CREATE STREAM logs_original WITH (KAFKA_TOPIC='connect-logs_original', VALUE_FORMAT='AVRO');

CREATE STREAM priced_logs AS SELECT ROWKEY, ROWTIME, ID, USER + '/' + PLUGIN as NAME, 
CASE WHEN USER = 'confluentinc' THEN 0.30 
     WHEN USER = 'debezium' THEN 0.75 
     WHEN USER = 'wepay' THEN 0.50 
     ELSE 0.0 
     END AS COST 
from LOGS_ORIGINAL;

SELECT * FROM priced_logs emit changes;