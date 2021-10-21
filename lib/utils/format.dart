// 数字简化为k/w格式
String formatCharCount(int count) {
  if (count < 0 || count.isNaN) {
    return '0';
  }
  String strCount = count.toString();
  if (strCount.length >= 5) {
    // 如：123456 => 12
    String prefix = strCount.substring(0, strCount.length - 4);
    if (strCount.length == 5) {
      prefix += '.' + strCount[1];
    }
    if (strCount.length == 6) {
      prefix += '.' + strCount[2];
    }
    return prefix + 'w';
  }
  return strCount;
}

//  秒数转时:分:秒格式
String secondsToTime(int seconds) {
  if (seconds <= 0 || seconds.isNaN) {
    return '00:00';
  }
  // 时分数
  int hours = 0;
  // 分钟数
  int minutes = 0;
  // 除整数分钟外剩余的秒数
  int remainingSeconds = 0;

  hours = (seconds / 60 / 60).floor();
  minutes = (seconds / 60 % 60).floor();
  remainingSeconds = seconds % 60;

  return '${formatNumber(hours)}:${formatNumber(minutes)}:${formatNumber(remainingSeconds)}';
}

// * 个数补零
String formatNumber(int count) {
  String strCount = count.toString();
  return strCount.length > 1 ? strCount : '0$strCount';
}
