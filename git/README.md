# Git

## Setup

The `setup.bash` script provides:
- Setup local git config for dotfiles repo.
- Setup general gitconfig in `~/.gitconfig`.
- Symlinks [format_branch_files.sh](format_branch_files.sh) to `~/.local/bin`.

```bash
bash ~/.dotfiles/git/setup.bash
```

## Command Line Git Reference

See the [Reference File](reference.bash)

##  Hook: prepare-commit-msg

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
