#include <stdio.h>

int main() {
    FILE *fp = fopen("input", "r");

    char seen[0x400] = {0}, line[11];
    int max = 0;
    while (fread(line, 1, 11, fp)) {
        int val = 0;
        for (char *c = line; *c != '\n'; ++c) {
            val *= 2;
            val += (*c == 'B') + (*c == 'R');
        }
        seen[val] = 1;
        val > max && (max = val);
    }

    fclose(fp);

    // part 1
    printf("%d\n", max);

    // part 2
    char *ptr = seen;
    while (!*ptr) ++ptr;
    while (*ptr) ++ptr;
    printf("%d\n", ptr - seen);
}
