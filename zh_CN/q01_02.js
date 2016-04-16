/* 为字符串类型添加返回逆序字符串的方法 */
String.prototype.reverse = function (){
  return this.split("").reverse().join("");
}

/* 从11开始检索 */
var num = 11;
while (true){
  if ((num.toString() == num.toString().reverse()) &&
      (num.toString(8) == num.toString(8).reverse()) &&
      (num.toString(2) == num.toString(2).reverse())){
    console.log(num);
    break;
  }
  /* 只检索奇数，每次加2 */
  num += 2;
}
