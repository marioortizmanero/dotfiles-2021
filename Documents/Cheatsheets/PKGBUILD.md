# Creating/maintaining packages in the AUR

1. Create PKGBUILD
2. `git clone ssh://aur@aur.archlinux.org/pkgbase.git`
3. `cd pkgbase`
4. `updpkgsums`, edit PKGBUILD if necessary
5. `makepkg --printsrcinfo > .SRCINFO`
6. `git add .SRCINFO PKGBUILD`
7. `git commit -m "Initial commit"`
8. `git push`
