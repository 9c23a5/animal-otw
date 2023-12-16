# Animal of the Week

## Instalation (Linux/MacOS)
<!-- TODO -->
This is written assuming you are running an Aptitude-based distro (Ubuntu/Debian), but I will make remarks on MacOS.

For ASDF's `.tool-versions` you need to clone this repo first (`git clone https://github.com/9c23a5/animal-otw.git`)

- Essential packages:
  ```bash
  sudo apt update && sudo apt install -y curl git build-essential zlib1g-dev libreadline-dev autoconf bison libssl-dev libyaml-dev libncurses-dev libffi-dev libgdbm-dev
  ```

- [asdf](https://asdf-vm.com/guide/getting-started.html):
    
    If you are on MacOS you can use the Homebrew formulae:
    ```bash
    brew install asdf
    ```

    Otherwise:
    ```bash
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
    echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
    echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc # Optional, for completions
    source ~/.bashrc
    ```

 - [Postgres 14](https://wiki.postgresql.org/wiki/Apt):

    Using [apt](https://wiki.postgresql.org/wiki/Apt):
    ```bash
    sudo apt install -y postgresql-common
    sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y
    sudo apt update && sudo apt install -y postgresql-14 libpq-dev
    sudo passwd postgres
    sudo service postgresql start
    # Now we should have Postgres running, let's create our user:
    createdb $(whoami)
    # And let's modify our auth config for Rails
    sudo sed -i 's/peer/trust/g' /etc/postgresql/14/main/pg_hba.conf
    sudo sed -E 's/(host\s+all\s+all\s+127\.0\.0\.1\/32\s+)scram-sha-256/\1trust/' /etc/postgresql/14/main/pg_hba.conf
    # Finally, by default template DBs are ASCII, that's bad:
    psql -c "update pg_database set encoding = pg_char_to_encoding('UTF8') where datname IN ('template0', 'template1')"
    ```

    Using [homebrew](https://wiki.postgresql.org/wiki/Homebrew):
    ```bash
    brew install postgresql@14
    brew services start postgresql@14
    echo 'export PATH="/opt/homebrew/opt/postgresql@14/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
    ```

 - Ruby, version declared in [`.tool-versions`](.tool-versions):
    ```
    asdf plugin add ruby
    asdf install
    bundle install
    ```

Finally, check if everything runs fine:
```bash
rails db:create
rails s
```

## Instalation (Windows)

0. Clone this repository

1. Install WSL (any distro is fine, I used Debian)
    ```bash
    wsl --install -d Debian
    ```

2. Once inside your Bash shell, let's clone this repository navigate to this cloned repository and install all dependencies above

3. Now open VSCode and install [Remote WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) (`ms-vscode-remote.remote-wsl`)

4. Run command `WSL: Reopen folder in...` to use your Debian WSL install (or run it again to go back to Windows).
