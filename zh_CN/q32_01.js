var height = 4;
var width = 7;
var str = "";
var tatami = new Array(height + 2);

/* 设置初始值（外围用-1，内部用0表示）*/
for (var h = 0; h <= height + 1; h++){
  tatami[h] = new Array(width + 2);
  for (var w = 0; w <= width + 1; w++){
    tatami[h][w] = 0;
    if ((h == 0) || (w == 0) ||
    (h == height + 1) || (w == width + 1)){
      tatami[h][w] = -1;
    }
  }
}

/* 表示榻榻米 */
function printTatami(){
  for (var i = 1; i <= height; i++){
    for (var j = 1; j <= width; j++){
      /* 横向用“-”表示 */
      if ((tatami[i][j] == tatami[i][j + 1]) ||
           (tatami[i][j] == tatami[i][j - 1]))
      str += "-";
      /* 纵向用“|”表示 */
      if ((tatami[i][j] == tatami[i + 1][j]) ||
           (tatami[i][j] == tatami[i - 1][j]))
      str += "|";
    }
    str += "\n";
  }
  str += "\n";
}

/* 递归铺垫榻榻米 */
function setTatami(h, w, id){
  if (h == height + 1){ /* 铺垫完毕则打印 */
    printTatami();
  } else if (w == width + 1){ /* 到右边界时改行 */
    setTatami(h + 1, 1, id);
  } else if (tatami[h][w] > 0){ /* 铺垫完毕时向右移动 */
    setTatami(h, w + 1, id);
  } else { /* 当左上和上相同或者左上和左相同时可以铺垫 */
    if ((tatami[h - 1][w - 1] == tatami[h - 1][w]) ||
        (tatami[h - 1][w - 1] == tatami[h][w - 1])){
      if (tatami[h][w + 1] == 0){ /* 可以横向铺垫的情况 */
        tatami[h][w] = tatami[h][w + 1] = id;
        setTatami(h, w + 2, id + 1);
        tatami[h][w] = tatami[h][w + 1] = 0;
      }
      if (tatami[h + 1][w] == 0){ /* 可以纵向铺垫的情况 */
        tatami[h][w] = tatami[h + 1][w] = id;
        setTatami(h, w + 1, id + 1);
        tatami[h][w] = tatami[h + 1][w] = 0;
      }
    }
  }
}

setTatami(1, 1, 1);
console.log(str);
