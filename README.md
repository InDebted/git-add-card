# git-co-author

Easily 'Add card' to your commit template.

```text
usage: git add-card  Show card in commit template
   or: git add-card <card>           Update card in commit template
   or: git co-author clear           Remove card from commit template
```

This command allows you add the card to your commind.

## Setup

Configure the commit template path, for example:

```bash
git config --global commit.template '~/.git-commit-template'
```

Ensure there is a commit template file:

```bash
touch ~/.git-commit-template
```

## Usage

This command expects you to commit using the commit template. If you run `git commit` with the message option `-m/--message` then the commit template is not used and the card is not added.

Adding card PD-666 to the commit:

```bash
$ git add-card pd-666
CARD: PD-666
```

No adding a card:

```bash
$ git add-card clear
```

## Test

The command is tested using the [Bats](https://github.com/sstephenson/bats) testing framework for Bash.

The tests expect no global git config, so they are run in a container to isolate
them.

### Docker

Install Docker:

```bash
brew cask install docker
```

Build the test image:

```bash
docker build -t git-add-card-test .
```

Run the tests in a container:

```bash
docker run git-add-card-test
```