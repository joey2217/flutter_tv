import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tv/common/utils.dart';

void main() {
  test("test parsePlayUrl", () {
    String vod_play_from = r'jinyingyun$$$jinyingm3u8';
    String vod_play_url =
        r'第01集$https://hd.ijycnd.com/play/Qe1PWQ3d#第02集$https://hd.ijycnd.com/play/PdRDOwLa#第03集$https://hd.ijycnd.com/play/xe721Owd#第04集$https://hd.ijycnd.com/play/mbkN8Dxa#第05集完结$https://hd.ijycnd.com/play/wdLw7ngb$$$第01集$https://hd.ijycnd.com/play/Qe1PWQ3d/index.m3u8#第02集$https://hd.ijycnd.com/play/PdRDOwLa/index.m3u8#第03集$https://hd.ijycnd.com/play/xe721Owd/index.m3u8#第04集$https://hd.ijycnd.com/play/mbkN8Dxa/index.m3u8#第05集完结$https://hd.ijycnd.com/play/wdLw7ngb/index.m3u8';
    var list = parsePlayUrl(vod_play_from, vod_play_url);
    print(list[0].label);
    print(list[0].url);
    expect(list.length, greaterThan(0));
  });
}
