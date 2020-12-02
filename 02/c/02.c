#include <stdio.h>

int main() {
    int part1 = 0, part2 = 0;

    // both parts
    FILE *fp = fopen("input", "r");
    int a, b, c;
    char pwd[100];
    while (fscanf(fp, "%d-%d %c: %s\n", &a, &b, &c, &pwd) > 0) {
        int count = 0;
        for (char *ch = pwd; *ch; ++ch) *ch == c && ++count;
        if (a <= count && count <= b) ++part1;
        if ((pwd[a-1] == c) != (pwd[b-1] == c)) ++part2;
    }
    fclose(fp);

    printf("%d\n%d\n", part1, part2);
}
