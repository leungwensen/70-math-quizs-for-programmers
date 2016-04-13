#include <stdio.h>

#define N 5
#define MASK (1 << (N * N)) - 1

unsigned int right(unsigned int maze){
  return (maze >> 1) & 0b0111101111011110111101111;
}
unsigned int up(unsigned int maze){
  return (maze << N) & MASK;
}
unsigned int left(unsigned int maze){
  return (maze << 1) & 0b1111011110111101111011110;
}
unsigned int down(unsigned int maze){
  return (maze >> N);
}

unsigned int (*move[])(unsigned int) = {right, up, left, down};

int enable(int maze){
  unsigned int man = (1 << (N * N - 1)) & (MASK - maze);
  while (1){
    unsigned int next_man = man;
    int i = 0;
    for (i = 0; i < 4; i++){
      next_man |= (*move[i])(man);
    }
    next_man &= (MASK - maze);
    if (next_man & 1 == 1) return 1;
    if (man == next_man) break;
    man = next_man;
  }
  return 0;
}
int search(int maze, int p1, int d1, int p2, int d2, int turn){
  int i = 0;
  if (turn == 1){
    if (p1 == p2) return 1;
    if ((p1 == 1) || (p2 == 1 << (N * N - 1))) return 0;
  }
  for (i = 0; i < 4; i++){
    int d = (d1 - 1 + i + 4) % 4;
    int next_p = (*move[d])(p1);
    if ((next_p & (MASK - maze)) > 0)
      return search(maze, p2, d2, next_p, d, 1 - turn);
  }
  return 0;
}
int main(void) {
  int count = 0;
  int i = 0;
  for (i = 0; i < (1 << N * N); i++){
    if (enable(i) > 0){
      if (search(i, 1 << (N * N - 1), 3, 1, 1, 1) > 0)
        count++;
    }
  }
  printf("%d", count);
  return 0;
}
