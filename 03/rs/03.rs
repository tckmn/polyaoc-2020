use std::fs::File;
use std::io::{self, BufRead};

fn go(input: &Vec<String>, dx: usize, dy: usize) -> usize {
    input.iter().step_by(dy).enumerate()
        .filter(|(y, line)| line.chars().cycle().nth(dx*y) == Some('#')).count()
}

fn main() -> io::Result<()> {
    let f = File::open("input")?;
    let input = io::BufReader::new(f).lines().flatten().collect();

    println!("{}", go(&input, 3, 1));
    println!("{}", [(1,1),(3,1),(5,1),(7,1),(1,2)]
        .iter().map(|&(dx,dy)| go(&input, dx, dy)).product::<usize>());

    Ok(())
}
