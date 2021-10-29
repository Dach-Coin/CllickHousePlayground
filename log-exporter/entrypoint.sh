#/bin/bash

export CLICKHOUSE__CONNECTIONSTRING="Host=$CH_HOST;Port=$CH_PORT;Username=default;password=!QAZ1qaz;"
echo Clickhouse Connection = $CH_HOST:$CH_PORT
dotnet /opt/EventLogExporter/EventLogExportersManager.dll --ClickHouse:ConnectionString=$CLICKHOUSE__CONNECTIONSTRING