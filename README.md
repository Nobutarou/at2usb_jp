# これは何 

https://github.com/BojanSof/at2usb

こちらの多分 US 配列の PS/2 キーボードを USB HID キーボードにするプログラムを改変しようと
しているもの。作業中

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
