#!/usr/bin/env node

const fs = require('fs');

fs.readFile('input', 'utf-8', (_, s) => {
    const input = s.split('\n').map(x => +x),
        f = (sum, remaining, idx) => remaining ?
            input.slice(idx).map((n, i) => n * f(sum+n, remaining-1, i+1)).find(x => x) :
            sum == 2020;
    // both parts
    [2,3].map(n => console.log(f(0, n)));
});
