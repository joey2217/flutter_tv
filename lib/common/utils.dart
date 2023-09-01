//第1集$https://hd.ijycnd.com/play/QbYR9JWd#第2集$https://hd.ijycnd.com/play/ZdP8yn6d#第3集$https://hd.ijycnd.com/play/7axmKRnb#第4集$https://hd.ijycnd.com/play/xboPNxLd
// $$$第1集$https://hd.ijycnd.com/play/QbYR9JWd/index.m3u8#第2集$https://hd.ijycnd.com/play/ZdP8yn6d/index.m3u8#第3集$https://hd.ijycnd.com/play/7axmKRnb/index.m3u8#第4集$https://hd.ijycnd.com/play/xboPNxLd/index.m3u8

const separator1 = "\$\$\$";
const separator2 = "#";
const separator3 = "\$";

class LiveItem {
  String label;
  String url;

  LiveItem(this.label, this.url);
}

List<LiveItem> parsePlayUrl(String playForm, String playUrl) {
  var options = playForm.split(separator1);
  var m3u8Index = options.indexOf("jinyingm3u8");
  if (m3u8Index == -1) {
    m3u8Index = 0;
  }
  var playItems = playUrl.split(separator1);
  var lives = playItems[m3u8Index].split(separator2);
  var list = lives.map((e) {
    var [label, url] = e.split(separator3);
    return LiveItem(label, url);
  }).toList();
  return list;
}
