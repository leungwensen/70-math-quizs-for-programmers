/* 縦線と横線 */
const V = 7, H = 10;

/* 再帰的に横線を作成 */
function make_bars(v, h){
  var new_h = new Array(h.length + v - 1);
  for (var i = 0; i < h.length + v - 1; i++){
    new_h[i] = 0;
  }
  /* 各横線のパターン数をカウント */
  for (var i = 0; i < v; i++){
    for (var j = 0; j < h.length; j++){
      new_h[i + j] += h[j]
    }
  }
  if (v == V + 1){
    console.log(h[H]);
  } else {
    make_bars(v + 1, new_h);
  }
}

make_bars(1, [1]);
