# Ping - CLI
## Pinging tool
#### Версия Ruby

- Ruby >= 2.4

#### Установка зависимостей:
1. установка необходимых гемов
2. прогнать миграции для СУБД
```
bundle
bundle exec rake:db migrate
```

#### Запуск приложения:
Для запуска скрипта требуется ввести в консоль следующие команды из корневой папки приложения:
1. Для работы в фоновом режиме:

```
ruby ping.rb
```

2. Для работы утилиты в консоли в видимом режиме:
```
ruby main.rb
```

#### Команды
Рассмотрим примеры команд, которые необходимо вводить в консоли из корневой папки:
1. Добавление хоста:
```
rake hosts:add[8.8.8.8]
```
2. Удаление хоста:
```
rake hosts:delete[8.8.8.8]
```
3. Сбор статистики за определенный интервал времени:
```
rake report['8.8.8.8','2017-05-01 23:12:20','2017-05-02 23:12:20']
```

#### Формат получаемой статистики
Пример тела сообщения:
```
{
  "hostname":"8.8.8.8",
  "avg_response_ms":14,
  "min_response_ms":11,
  "max_response_ms":31,
  "percent_lost_pings":75
}
```
, где:

`hostname` - имя хоста, IP

`avg_response_ms` - среднее время ответа

`min_response_ms` - минимальное время ответа

`max_response_ms` - максимальное время ответа

`percent_lost_pings` - процент потерь пакетов

за указанный период

#### Тестирование:
для запуска тестов:
```
rspec spec
```