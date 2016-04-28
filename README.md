[![Build Status][travis-badge]][travis-link]
[![Slack Room][slack-badge]][slack-link]

# mock

mock library

## Install

With [fisherman]

```
fisher mock
```

## Usage

```fish
mock ls
test ls
mock ls 1
test ! ls
mock ls 0 "echo hi"
test "hi" -eq (ls)
```

[travis-link]: https://travis-ci.org/{{OWNER-NAME}}/{{PLUGIN-NAME}}
[travis-badge]: https://img.shields.io/travis/{{OWNER-NAME}}/{{PLUGIN-NAME}}.svg
[slack-link]: https://fisherman-wharf.herokuapp.com
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[fisherman]: https://github.com/fisherman/fisherman
