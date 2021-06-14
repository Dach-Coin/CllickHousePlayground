# Сверхбыстрый Журнал Регистрации 1C с помощью Yandex Clickhouse

Скрипты из видео с канала "Веселый1С": https://youtu.be/HnZ0Of-YpW0

Экспортер файлов ЖР: https://github.com/akpaevj/OneSTools.EventLog

Скрипты доработаны для экспорта файлов ЖР серверных баз кластера 1С.

Для установки и запуска выполнить:

- Скачать релиз `OneSTools.EventLog` и распаковать в папку `log-exporter/app/`

- Файл `appsettings.json` должен выглядеть так:

```json

{
  "Logging": {
    "LogLevel": {
      "Default": "Debug",
      "Microsoft": "Warning",
      "Microsoft.Hosting.Lifetime": "Information"
    }
  },
  "Manager": {
    "ClstFolders": [
      {
        "Folder": "/var/logdata",
        "Templates": [
          {
            "Mask": "",
            "Template": "[IBNAME]_reglogs"
          }
        ]
      }
    ]
  },
  "Exporter": {
    "StorageType": 1,
    "Portion": 10000,
    "TimeZone": "Europe/Moscow",
    "WritingMaxDegreeOfParallelism": 1,
    "CollectedFactor": 3,
    "ReadingTimeout": 1,
    "LoadArchive": false
  },
  "ClickHouse": {
    "ConnectionString": ""
  }
}

```

- В `docker-compose.yml` указать свой путь к каталогу кластера 1С (`collector-volumes`)

- Выполнить `docker compose up -d`
