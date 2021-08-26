# Git

## Setup

The `setup.bash` tasks:
- Copy gitconfig to `~/.gitconfig`.
- Set local git user for this repo.

```bash
export DOTFILES=~/.dotfiles
bash ${DOTFILES}/git/setup.bash
```

## Command Line Git Reference

See the [Reference File](reference.bash).

## Signing Commits (GPG Keys)

Reference: https://docs.github.com/en/github/authenticating-to-github/managing-commit-signature-verification/generating-a-new-gpg-key

``` bash
# create key with 4096 bits
gpg --full-generate-key

# list key to copy the ID after rsa4096/
gpg --list-secret-keys --keyid-format=long

# use the ID to configure .gitconfig

# Print GPG key and add to GitHub
gpg --armor --export ID-HERE
```

##  Hooks

### prepare-commit-msg: Append issue number based on branch name 

```bash
#!/bin/sh
input=$1
# if message already has issue number - ignore it
while IFS= read -r line
do
  res="$(echo "$line" |grep "Issue: CB-#")"
  [ ! -z "$res" ] && exit;
done < "$input"
issueName=$(git symbolic-ref -q HEAD | tr '_' ' ' | awk '{print $2}')
echo " \n\nIssue: CB-#$issueName" >> "$input"
```
