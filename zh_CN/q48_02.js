const N = 8; /* 各色卡片数目 */
var start = (1 << N) - 1; /* 开始状态(0N个，1N个) */
var mask = (1 << N * 2) - 1; /* 掩码 */

/* 目标状态（0和1交错排列） */
var goal1 = 0;
for (var i = 0; i < N; i++){ goal1 = (goal1 << 2) + 1; }
var goal2 = mask - goal1;

/* 对值为1的数位进行计数 */
function bitcount(x) {
  x = (x & 0x55555555) + (x >> 1 & 0x55555555);
  x = (x & 0x33333333) + (x >> 2 & 0x33333333);
  x = (x & 0x0F0F0F0F) + (x >> 4 & 0x0F0F0F0F);
  x = (x & 0x00FF00FF) + (x >> 8 & 0x00FF00FF);
  x = (x & 0x0000FFFF) + (x >> 16 & 0x0000FFFF);
  return x;
}

/* 反转次数 */
var count = N * 2;
for (var i = 0; i < (1 << N * 2); i++){
  var turn = i ^ (i << 1) ^ (i << 2);
  turn = (turn ^ (turn >> (N * 2))) & mask;

  /* 到达目标状态后找出反转位置数字的最小值 */
  if (((start ^ turn) == goal1) || ((start ^ turn) == goal2)){
    if (count > bitcount(i)){
      count = bitcount(i);
    }
  }
}
console.log(count);
