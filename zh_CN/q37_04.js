function next_dice(dice){
  var top = parseInt(dice / Math.pow(6, 5));
  var left = parseInt(dice / Math.pow(6, 5 - top));
  var right = dice % Math.pow(6, 5 - top);
  return (right + 1) * Math.pow(6, top + 1) - (left + 1);
}

var all_dice = new Array(Math.pow(6, 6));
for (i = 0; i < Math.pow(6, 6); i++){
  all_dice[i] = 0;
}
for (i = 0; i < Math.pow(6, 6); i++){
  if (all_dice[i] == 0){
    check = new Array();
    while ((all_dice[i] == 0) && (check.indexOf(i) == -1)){
      check.push(i);
      i = next_dice(i);
    }
    index = check.indexOf(i);
    if (index >= 0){
      for (j = 0; j < check.length; j++){
        if (j < index){
          all_dice[check[j]] = 1;
        } else {
          all_dice[check[j]] = 2;
        }
      }
    } else {
      for (j = 0; j < check.length; j++){
        all_dice[check[j]] = 1;
      }
    }
  }
}
cnt = 0;
for (i = 0; i < Math.pow(6, 6); i++){
  if (all_dice[i] == 1) cnt++;
}
console.log(cnt);
