#!/usr/bin/env bats

setup() {
  PATH="$BATS_TEST_DIRNAME/..:$PATH"

  test_dir="$BATS_TMPDIR/test-git-add-card"
  template_file="$test_dir/test-commit-template"
  template_file_in_home="$HOME/test-commit-template"

  mkdir -p "$test_dir"
  cd "$test_dir" || exit 1
  rm -rf .git/

  git init
  git config --local commit.template "$template_file"
  git config --local user.name 'Ann Author'
  git config --local user.email 'ann.author@example.com'
  git config --local co-authors.aa 'Ann Author <ann.author@example.com>'
  git config --local co-authors.bb 'Bob Book <bob.book@example.com>'
  git config --local --unset co-authors.ab || true
  git config --local --unset co-authors.bb-2 || true

  touch "$template_file"
  touch "$template_file_in_home"
}

teardown() {
  rm -rf "$template_file"
  rm "$template_file_in_home"
}

@test "no arguments print nothing when there are no cards" {
  run git-add-card
  [ $status -eq 0 ]
  [ "$output" = "" ]
}
