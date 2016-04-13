const W = 6; /* 横のマスの数 */
const H = 5; /* 縦のマスの数 */
const USABLE = 2; /* 使用可能な回数 */
var max = 0; /* 最長の長さ */
var h = new Array(H + 1); /* 水平方向の線を使用した回数を保持 */
var v = new Array(W + 1); /* 垂直方向の線を使用した回数を保持 */

for (var i = 0; i < H + 1; i++){ h[i] = 0; }
for (var i = 0; i < W + 1; i++){ v[i] = 0; }

function sum(a) {
  return a.reduce(function(x, y) { return x + y; });
}

function search(x, y){
  if ((x == W) && (y == H)){
    /* Bについたら最大値を確認して終了 */
    max = Math.max(sum(h) + sum(v), max);
    return;
  }
  if (h[y] < USABLE){ /* 水平方向に移動可能なとき */
    if (x > 0) { /* 左に移動 */
      h[y] += 1;
      search(x - 1, y);
      h[y] -= 1;
    }
    if (x < W) { /* 右に移動 */
      h[y] += 1;
      search(x + 1, y);
      h[y] -= 1;
    }
  }
  if (v[x] < USABLE){ /* 垂直方向に移動可能なとき */
    if (y > 0){ /* 上に移動 */
      v[x] += 1;
      search(x, y - 1);
      v[x] -= 1;
    }
    if (y < H){ /* 下に移動 */
      v[x] += 1;
      search(x, y + 1);
      v[x] -= 1;
    }
  }
}

search(0, 0); /* Aの位置からスタート */
console.log(max);
