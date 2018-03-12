WIP

# Assembly Language Programming ["Kanshi(漢詩)"](https://en.wikipedia.org/wiki/Kanshi_(poetry))
* アセンブラ漢詩
  * 先行研究 - https://www.slideshare.net/kozossakai/ss-68331290
* アセンブリ短歌
  * https://www.slideshare.net/asmtanka/2-sakaihiroakija
  * http://kozos.jp/asm-tanka/
* 先行研究との違い
  * 1バイト=1文字ではなく1命令=1文字（漢字）としたい
    * それ普通のアセンブリプログラミングでは・・・？

## 五言絶句

WIP

## memo

compile

```sh
gcc waka.c -S
less waka.s
```

assembly

```sh
gcc waka.c -c
objdump -d waka.o
```

finaly

```sh
gcc waka.c -o waka -static
objdump -d waka
```

### 参考

* http://www.mztn.org/lxasm64/amd01.html
* https://qiita.com/MoriokaReimen/items/b316a68d76c1eafa18f8

## よく使う x86/64 レジスタ

### RAX

* アキュムレータレジスタ
* 算術演算操作の結果
* システムコール番号の指定、システムコールの結果

### RBX

* ベースレジスタ
* アクセスしたいメモリの先頭の番地(ベースアドレス)を格納する

### RCX

* カウンタレジスタ
* シフトローテート命令とループ命令に使用される。
* 繰り返し回数を指定するような命令で回数の設定に使う

### RDX

* データレジスタ
* 算術演算操作とI/O操作
* システムコールの呼び出しの第 3 引数

### RSI

* ソースインデックスレジスタ
* ストリング型の命令でコピー元（ソース）を示す場合に専用に使われます
* システムコールの呼び出しの第 2 引数

### RDI

* デスティネーションインデックスレジスタ
* ストリング型の命令でコピー先（デスティネーション）を示す場合に専用に使われます
* ストリーム操作でのデスティネーションへのポインタとして使用される。
* システムコールの呼び出しの第 1 引数

### RBP

* スタックベースポインタレジスタ
* スタックのベースを指し示すのに使用される
* ENTER命令やLEAVE命令でスタックフレームを作成する場合に使われます
* 歴史的な理由でスタック内のアクセスに使われる

### RSP

* スタックポインタレジスタ
* スタックのトップを指し示すポインタ
* サブルーチンコールの戻りアドレスをメモリに自動的に格納したり、PUSH、POP命令でレジスタを一時的に退避、復帰する場合に使われます


### 参考

* https://ja.wikibooks.org/wiki/X86アセンブラ/x86アーキテクチャ
* http://www.mztn.org/lxasm64/amd04.html

## よく使う x86/64 命令

### MOV

* データ転送

### NOP

* 何もしない


### 参考
* http://www.mztn.org/index.html#x86-64
* http://www.mztn.org/lxasm64/amd06_sum.html
* http://www.mztn.org/lxasm64/amd07_mov.html
* http://www.mztn.org/lxasm64/amd08_calc.html
* http://www.mztn.org/lxasm64/amd09_shift.html

## よく使う Linux(x86/64) システムコール

x86-64 の Linux でシステムコールを呼び出すには以下のようにします。rcx と r11 の内容は保存されません（破壊される）。

1. rax にシステムコール番号を設定
1. 必要ならば、第 1 引数 を rdi に設定
1. 必要ならば、第 2 引数 を rsi に設定
1. 必要ならば、第 3 引数 を rdx に設定
1. 必要ならば、第 4 引数 を r10 に設定
1. 必要ならば、第 5 引数 を r8 に設定
1. 必要ならば、第 6 引数 を r9 に設定
1. システムコール命令( syscall ) を実行

### read
* 0

### write
* 1

### pipe
* 22

### execve
* 59

### exit
* 60

### clock_nanosleep
* 230

### 参考
* http://www.mztn.org/lxasm64/x86_x64_table.html
