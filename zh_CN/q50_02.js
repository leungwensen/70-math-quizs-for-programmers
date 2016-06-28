const W = 6; /* 横向的方格数目 */
const H = 5; /* 纵向的方格数目 */
const USABLE = 2; /* 同一条直线可以使用的次数 */
var max = 0; /* 最长距离 */
var h = new Array(H + 1); /* 保存水平方向线的使用次数 */
var v = new Array(W + 1); /* 保存垂直方向线的使用次数 */

for (var i = 0; i < H + 1; i++){ h[i] = 0; }
for (var i = 0; i < W + 1; i++){ v[i] = 0; }

function sum(a) {
  return a.reduce(function(x, y) { return x + y; });
}

function search(x, y){
  if ((x == W) && (y == H)){
    /* 如果到达了B点，则确认最大值，终止搜索 */
    max = Math.max(sum(h) + sum(v), max);
    return;
  }
  if (h[y] < USABLE){ /* 可以水平方向移动的时候 */
    if (x > 0) { /* 向左移动 */
      h[y] += 1;
      search(x - 1, y);
      h[y] -= 1;
    }
    if (x < W) { /* 向右移动 */
      h[y] += 1;
      search(x + 1, y);
      h[y] -= 1;
    }
  }
  if (v[x] < USABLE){ /* 可以垂直方向移动的时候 */
    if (y > 0){ /* 向上移动 */
      v[x] += 1;
      search(x, y - 1);
      v[x] -= 1;
    }
    if (y < H){ /* 向下移动 */
      v[x] += 1;
      search(x, y + 1);
      v[x] -= 1;
    }
  }
}

search(0, 0); /* 从A位置开始 */
console.log(max);
