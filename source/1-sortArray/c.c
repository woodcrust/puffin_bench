#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void shellsSort(int *arr) {
  int n    = 10;
  int gap  = n / 2;
  int i    = 0;
  int j    = 0;
  int temp = 0;
  
  while(gap > 0) {
    i = gap;
    while(i < n) {
      temp = arr[i];
      j    = i;
      while(j >= gap && arr[j - gap] > temp) {
        arr[j] = arr[j - gap];
        j      = j - gap;
      }
      arr[j] = temp;
      i      = i + 1;
    }
    gap = (int)(gap / 2);
  }
}

int main() {
  int *arr = (int *) calloc(10, sizeof(int));
  int c    = 0;

  while(c < 15000000) {
    for (int i=0; i<10; i++) {
      arr[i] = 9 - i;
    }
    shellsSort(arr);
    c = c + 1;
  }

  printf("GCC Sort array %d.%d\n", __GNUC__, __GNUC_MINOR__);
  free(arr);
  return 0;
}
