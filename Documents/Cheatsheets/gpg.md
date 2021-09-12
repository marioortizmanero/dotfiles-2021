# GPG Keys

## Listing keys

```sh
$ gpg --list-secret-keys --keyid-format LONG
```

## Generating one

Best tutorial at https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-gpg-key

## Exporting backup

```sh
$ gpg --export-secret-key name > ~/my-key.asc
```

## Importing backup

```sh
$ gpg --import my-key.asc
```

## Configuring git

```sh
$ # Must match the key email
$ git config --global user.email your@email.com

$ # For `git commit -S`
$ git config --global user.signingkey key

$ # Automatic signing
$ git config --global commit.gpgSign true
$ git config --global tag.gpgSign true
```

## Cache during session

```sh
$ /usr/lib/gnupg/gpg-preset-passphrase --preset KEYGRIP
```

keygrip can be obtained with

```sh
$ gpg --with-keygrip -K
```

## Restarting gpg-agent

```sh
$ # Will print "OK"
$ gpg-connect-agent reloadagent /bye
```
