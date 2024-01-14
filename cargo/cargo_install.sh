#/bin/bash
export CARGO_HOME=$HOME/Projects/dotfiles/cargo/.cargo/
while read tool; do
    cargo install $tool
done < cargo.list

