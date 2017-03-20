#include <stdio.h>

#define W 5
#define H 4

int map = 0;

int search(int x, int y, int depth){
  int cnt = 0;
  if ((x < 0) || (W <= x) || (y < 0) || (H <= y)) return 0;
  if ((map & (1 << (x + y * W))) > 0) return 0;
  if (depth == W * H) return 1;
  map += 1 << (x + y * W);
  cnt += search(x + 1, y, depth + 1);
  cnt += search(x - 1, y, depth + 1);
  cnt += search(x, y + 1, depth + 1);
  cnt += search(x, y - 1, depth + 1);
  map -= 1 << (x + y * W);
  return cnt;
}

int main(void) {
  int count = 0;
  int i;
  for (i = 0; i < W * H; i++){
    count += search(i % W, i / W, 1);
  }
  printf("%d", count / 2);
  return 0;
}
