/// Далеко не локализация, но лучше, чем распихать строки по всей вёрстке
class Strings {
  // * General

  static const autoBartender = 'Автобармен';
  static const description = 'Система автоналива напитков';

  // * Launch

  static const btNoPermission =
      'Требуется разрешение для поиска устройств поблизости';
  static const btGoSettings = 'Перейти в настройки';
  static const btUnavailable = 'Bluetooth не поддерживается устройством';
  static const btDisabled = 'Вы не включили Bluetooth';
  static const btEnable = 'Включить Bluetooth';

  // * Scan

  static const connection = 'Подключение';
  static const notConnected = 'Устройство не подключено';

  static const tapToConnect = 'Нажмите, чтобы\nподключить автобармен';
  static const tapToDisconnect = 'Нажмите, чтобы\nотключить автобармен';
  static const skipNow = 'Пока пропустить';

  static const knownDeviceFound = 'Найдено знакомое устройство';
  static const connectionError = 'Ошибка подключения';

  // * Home

  static const tuning = 'Приготовление';
  static const cocktails = 'Коктейли';
  static const stats = 'Статистика';
  static const settings = 'Настройки';

  // * Common

  static const pickDrink = 'Выберите напиток';
  static const ml = 'мл';

  static const enterName = 'Введите название';
  static const enterVolume = 'Введите объём (мл)';
  static const cancel = 'Отмена';
  static const ok = 'ОК';

  static const pour = 'Налить';
  static const goPour = 'Приготовить';
  static const readyForPouring = 'Готово к приготовлению';

  static const loading = '🤔';

  // * Stats

  static const oneLiter = 'литр выпит';
  static const fewLiters = 'литра выпито';
  static const manyLiters = 'литров выпито';

  // * Settings

  static const autoConnectTitle = 'Подключаться автоматически';
  static const autoConnectDescription =
      'Автоматически подключаться к последнему известному устройству';
  static const pumpsQuantityTitle = 'Количество ингредиентов';
  static const calibrateTitle = 'Калибровка';
  static const calibrateText = '''
  1. Выберите предмет, у которого известен точный вес
  2. Введите вес предмета и нажмите "Ок"
  3. Положите предмет на подставку и дождитесь завершения калибровки
  ''';
}
