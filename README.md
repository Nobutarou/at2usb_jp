# これは何 

https://github.com/BojanSof/at2usb

こちらの多分 US 配列の PS/2 キーボードを USB HID キーボードにするプログラムを改変しようと
したもの。とりあえず動いている。

# 改変 (したい) 内容

- PIC16F1455 で使えるようにする
  - UART 機能は削る
- 日本語配列にスキャンコードを置き換える
- Caps を Windows キーにする
  - Justy JKB-89S には Win キーがなく、左下に Caps が配置されているため

# 変更したファイル

- プロジェクト定義に関するなにか

MPLAB X IDE でターゲットマイコンを PIC16F1455 に変更したので、何かが変わっているはずだけど、
分からない。

- mcc_generated_files/pin_manager.c: 

RB ポート操作を消す。RB ポートが無いため。UART 関連なので使わないから問題ないはず

- ps2usb.c:

JIS 配列のスキャンコードに合わせて変更。Caps を Win に偽装。

JIS PS/2 スキャンコードはこちら

https://www.ne.jp/asahi/shared/o-family/ElecRoom/AVRMCOM/PS2_RS232C/KeyCordList.pdf

JIS HID スキャンコードはこちらの hex 列

https://bsakatu.net/doc/usb-hid-to-scancode/

- mcc_generated_files/tmr2.c
- mcc_generated_files/eusart.c
- usb/usb_device.c

ビルド時に never called の warning の出た function を削除

- app_device_keyboard.c:

キーの最大数というか修飾キーを除く HID コードの最大値が 0x65 (=101) となっていて JIS 配列
特有の 0x80 番台のキー入力が無視されていたため変更。

また Caps (PS/2 で 0x58) を左Win キーに偽装するのは、APP_KeyboardUpdateState() の中で行な
う。

# 回路図 for Justy JKB-89S

内部では XH 5P コネクタとなっている。こっちの方が入手しやすいので、内部から直接つなぐこと
にする。実際には上から C, D, G, V, F と記号が振ってあり Clock, Data, Gnd, Vcc であることは、
テスターで確認済み。G と F も導通しているので、ケーブルを剥いて調べてはいないが F がシール
ド線と思われる。

[回路図](./kicad/at2usb_jp/at2usb_jp.pdf)

# ToDo

- [x] UART 完全削除。今は動かないだけで関数などは残っている
  - 残す。何もしなくてもそのまま RC4/TX に継ぐだけで PS/2 スキャンコードが出力されている。
- [x] Pause に対応する
  - 物理的に押せなくしたので試してないが、Pause を無反応にしたつもり。0x48 送っても良いが
    必要ないのでやらない。
- [ ] 使わない #define を削除
