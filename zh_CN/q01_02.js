/* 文字列型に逆順を返すメソッドを追加 */
String.prototype.reverse = function (){
  return this.split("").reverse().join("");
}

/* 11から探索開始 */
var num = 11;
while (true){
  if ((num.toString() == num.toString().reverse()) &&
      (num.toString(8) == num.toString(8).reverse()) &&
      (num.toString(2) == num.toString(2).reverse())){
    console.log(num);
    break;
  }
  /* 奇数だけを探すため、2つずつ増やす */
  num += 2;
}
