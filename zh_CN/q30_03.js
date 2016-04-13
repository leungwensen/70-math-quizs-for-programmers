const N = 20;
var memo = [];
memo[1] = 1;

function set_tap(remain){
  if (memo[remain]){
    return memo[remain];
  }
  var cnt = 0;
  /* 2口 */
  for (var i = 1; i <= remain / 2; i++){
    if (remain - i == i)
      cnt += set_tap(i) * (set_tap(i) + 1) / 2;
    else
      cnt += set_tap(remain - i) * set_tap(i);
  }
  /* 3口 */
  for (var i = 1; i <= remain / 3; i++){
    for (var j = i; j <= (remain - i) / 2; j++){
      if ((remain - (i + j) == i) && (i == j))
        cnt += set_tap(i) * (set_tap(i) + 1) * (set_tap(i) + 2) / 6;
      else if (remain - (i + j) == i)
        cnt += set_tap(i) * (set_tap(i) + 1) * set_tap(j) / 2;
      else if (i == j)
        cnt += set_tap(remain - (i+j)) * set_tap(i) * (set_tap(i)+1) / 2;
      else if (remain - (i + j) == j)
        cnt += set_tap(j) * (set_tap(j) + 1) * set_tap(i) / 2;
      else
        cnt += set_tap(remain - (i + j)) * set_tap(j) * set_tap(i);
    }
  }
  memo[remain] = cnt;
  return cnt;
}

console.log(set_tap(N));
