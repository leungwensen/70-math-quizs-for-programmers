var height = 4;
var width = 7;
var str = "";
var tatami = new Array(height + 2);

/* 初期値をセット(外周に「-1」、内部に「0」をセット)*/
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

/* 畳を表示 */
function printTatami(){
  for (var i = 1; i <= height; i++){
    for (var j = 1; j <= width; j++){
      /* 横に並んでいるときは「-」を表示 */
      if ((tatami[i][j] == tatami[i][j + 1]) ||
           (tatami[i][j] == tatami[i][j - 1]))
      str += "-";
      /* 縦に並んでいるときは「|」を表示 */
      if ((tatami[i][j] == tatami[i + 1][j]) ||
           (tatami[i][j] == tatami[i - 1][j]))
      str += "|";
    }
    str += "\n";
  }
  str += "\n";
}

/* 再帰的に畳をセット */
function setTatami(h, w, id){
  if (h == height + 1){ /* 最終行の場合は畳を表示 */
    printTatami();
  } else if (w == width + 1){ /* 右端の場合は次の行に移動 */
    setTatami(h + 1, 1, id);
  } else if (tatami[h][w] > 0){ /* すでにセット済みの場合は右に移動 */
    setTatami(h, w + 1, id);
  } else { /* 左上と上が同じ場合、左上と左が同じ場合はセット可能 */
    if ((tatami[h - 1][w - 1] == tatami[h - 1][w]) ||
        (tatami[h - 1][w - 1] == tatami[h][w - 1])){
      if (tatami[h][w + 1] == 0){ /* 横にセット可能な場合 */
        tatami[h][w] = tatami[h][w + 1] = id;
        setTatami(h, w + 2, id + 1);
        tatami[h][w] = tatami[h][w + 1] = 0;
      }
      if (tatami[h + 1][w] == 0){ /* 縦にセット可能な場合 */
        tatami[h][w] = tatami[h + 1][w] = id;
        setTatami(h, w + 1, id + 1);
        tatami[h][w] = tatami[h + 1][w] = 0;
      }
    }
  }
}

setTatami(1, 1, 1);
console.log(str);
