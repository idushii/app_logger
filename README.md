# app_logger

Пакет предназначен для логирования http запросов через Interceptor пакета dio.
Так же возможно отслеживать состояние приложения (bloc, cubit).
Данные сохраняются на  сервере логирования, их возможно просмотреть позже.

Для просмотра логов возможно использовать центральный сервер логирования (https://logging.network/) или же развернуть свой.
Так же можно ограничено логировать приложения, выгруженные в store. 

Для этого неоходимо пропустить параметр `hasConnect` в конфигурации и поставить на телефон ключ-приложение для разрешения логирования. 
Без установки ключ приложения логгировнаие не будет производиться.

Для логирования состояния необходимо наличия свойства toJson в каждом классе (bloc / state / cubit).

## Подключение
Для подключения необходимо использовать репозиторий.
В поле ref указывается ссылка на последний коммит.

```
  app_logger:
    git:
      url: https://github.com/nilinov/app_logger.git
      ref: a178190272d797a4ed1e804cc9d250f55fee8e07
```

## Example:

Класс AppEnv конфигурации приложения
```dart
class AppEnv {
  static const BackendUrl = 'https://develop.checkers.itmegastar.com/api/v1';
  static const loggerUrl = 'wss://ws.logging.network';
  static const loggerProject = 'Hello World';
}
```

Инициализация (в файле main.dart, например в initState класса MyApp)
```dart
AppLogger().init(
  AppEnv.loggerUrl,
  AppEnv.loggerProject,
  baseUrl: AppEnv.BackendUrl,
  hasConnect: true
);
```

### http logger
Подключение
```dart
    Dio _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
    _dio.interceptors.add(LoggerInterceptor());
```

### bloc logger
Подключение
```dart
void main() async {
  Bloc.observer = AppLoggerBlocObserver();
  runApp(MyApp());
}
```

Для уточнения информации можно писать на почту *nic.ilinov@gmail.com*
