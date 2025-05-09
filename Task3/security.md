# Требования к безопасности к интеграции

## Требования к взаимодействию

- Аунтетификация
    - MTLS
    - OIDC
        - Логин+Пароль или Атрибуты клиентского сертификата
        - Время жизни токена не более 1 часа
- Авторизация
    - RBAC
- Протокол
    - HTTPS
- Принцип взаимодействия
    - REST

## Требования к передаваемой информации

- Согласование набора передаваемой информации с сотрудником ИБ
- Токенезация чувствительной информации для минимизации ущерба при утечке:
    - ID-пользователя

## Требование в партнеру

- Письмо с подписью руководителя компании, что со стороны партнера:
    - Проведен аудит безопасности инфраструктуры и сервисов
    - Разработка сервисов проходит этап анализа на уязвимости
    - Хранение и обработка данных соответсвет Федеральному закону №152-ФЗ
- Для раследования инцидента     заказчик в праве потребовать выгрузку данных из систем логирования
- Партнер в праве не предоставлять данные раскрывающие внутреннюю инфраструктуру и других заказчиков
- Незамедлительное удаление данных при отзыве согласия на обработку данных биометрии

## Требования заказчику

- Форма согласие на передачу и обработку данных биометрии компании партнеру
- Функция отзыва согласия на обработку данных биометрии
- При продаже недвижимости должен быть инициирован процесс блокировки доступа
    - по номеру машины
    - по биометрии

## Взаимодействие между системами

- Система партнера на запрос к ней запрашивает сертификат клиента
- Система заказчика получает JWT-токен по заранее обговоренным данным аунтетификации
- Дальнейшее взаимодействие производится с помощью JWT-токена, по истечению времени токена, он перезапрашивается используя refresh token
- Система заказчика может запросить актуальный список оборудования по обслуживаемым адресам для предоставления функциональных возможностей клиентам
- Пользователь может взаимодействовать с оборудованием по требованию без предоставления персональных данных
    - Открыть шлагбаум
    - Открыть дверь
- Функция открытия шлагбаума по номеру автомобиле не требует предоставления персональных данных, клиент может внести свой номер автомобиля и система заказчика передас его в систему партнера передав только:
    - Автомобильный номер
    - Идентификатор дома(из системы партнера)
- Функция открытия двери по биометрии требует предоставления согласия на обработку данных биометрии системой партнером, после подтверждения согласия клиент может загрузить свои фотографии для обработки:
    - Фотография лица
    - Токенезированный ID-пользователя
    - Идентификатор дома(из системы партнера)