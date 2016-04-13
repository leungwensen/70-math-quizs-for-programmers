var boy = 20;
var girl = 10;
boy += 1;
girl += 1;
var ary = new Array(girl);
for (var i = 0; i < girl; i++){
  ary[i] = new Array(boy);
  for (var j = 0; j < boy; j++){
    ary[i][j] = 0;
  }
}
ary[0][0] = 1;
for (var i = 0; i < girl; i++){
  for (var j = 0; j < boy; j++){
    if ((i != j) && (boy - j != girl - i)){
      if (j > 0){
        ary[i][j] += ary[i][j - 1];
      }
      if (i > 0){
        ary[i][j] += ary[i - 1][j];
      }
    }
  }
}
console.log(ary[girl - 2][boy - 1] + ary[girl - 1][boy - 2]);
