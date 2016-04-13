const N = 8; /* 各色の数 */
var start = (1 << N) - 1; /* 開始状態(0がN個、1がN個) */
var mask = (1 << N * 2) - 1; /* ビットマスク */

/* ゴール状態(0と1を交互に設定) */
var goal1 = 0;
for (var i = 0; i < N; i++){ goal1 = (goal1 << 2) + 1; }
var goal2 = mask - goal1;

/* 1が立っているビットの数を数える */
function bitcount(x) {
  x = (x & 0x55555555) + (x >> 1 & 0x55555555);
  x = (x & 0x33333333) + (x >> 2 & 0x33333333);
  x = (x & 0x0F0F0F0F) + (x >> 4 & 0x0F0F0F0F);
  x = (x & 0x00FF00FF) + (x >> 8 & 0x00FF00FF);
  x = (x & 0x0000FFFF) + (x >> 16 & 0x0000FFFF);
  return x;
}

/* 交換回数 */
var count = N * 2;
for (var i = 0; i < (1 << N * 2); i++){
  var turn = i ^ (i << 1) ^ (i << 2);
  turn = (turn ^ (turn >> (N * 2))) & mask;

  /* ゴールと一致すれば交換する位置の数の最小値を判定 */
  if (((start ^ turn) == goal1) || ((start ^ turn) == goal2)){
    if (count > bitcount(i)){
      count = bitcount(i);
    }
  }
}
console.log(count);
