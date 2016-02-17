function gh() {
  local giturl="${$(git config --get remote.origin.url)}";
  giturl=${giturl/git\@github\.com\:/https://github.com/};
  giturl=${giturl/\.git//};
  open "${giturl}";
}
