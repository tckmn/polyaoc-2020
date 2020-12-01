#include <stdio.h>

int try(int *input, int len, int sum, int remaining, int startidx) {
    if (!remaining) return sum == 2020;
    for (int i = startidx; i < len; ++i) {
        int x = try(input, len, sum+input[i], remaining-1, i+1);
        if (x) return input[i]*x;
    }
    return 0;
}

int main() {
    FILE *fp = fopen("input", "r");
    int input[500], i = 0, val;
    while (fscanf(fp, "%d", &val) > 0) input[i++] = val;

    // part 1
    printf("%d\n", try(input, i, 0, 2, 0));
    // part 2
    printf("%d\n", try(input, i, 0, 3, 0));
}
