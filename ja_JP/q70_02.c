#include <stdio.h>

#define W 4
#define H 6

char memo[1 << (W * H)] = {0};
int queue[1 << (W * H)] = {0x000fff, 0xfff000, 0xcccccc, 0x333333};
int mask[W * (H - 1) + (W - 1) * H];
int i, j, mask_count, start, end, temp, depth;

int main(int argc, char *argv){
  depth = 1;
  for (i = 0; i < 4; i++){
    memo[queue[i]] = depth;
  }
  mask_count = 0;
  for (i = 0; i < W * H; i++){
    if (i % W < W - 1) mask[mask_count++] = (1 << 1 | 1) << i;
    if (i < W * (H - 1)) mask[mask_count++] = (1 << W | 1) << i;
  }
  start = 0;
  end = temp = 4;
  while (end - start > 0){
    printf("%d %d\n", depth - 1, end - start);
    depth++;
    for (i = start; i < end; i++){
      for (j = 0; j < mask_count; j++){
        if (((queue[i] & mask[j]) != 0) &&
        ((queue[i] & mask[j]) != mask[j]) &&
        (memo[queue[i] ^ mask[j]] == 0)){
          memo[queue[i] ^ mask[j]] = depth;
          queue[temp++] = queue[i] ^ mask[j];
        }
      }
    }
    start = end;
    end = temp;
  }
  return 0;
}
