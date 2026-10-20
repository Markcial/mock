<div align="center">

# 🎭 mock

**Mock commands in your [fish shell](https://fishshell.com) tests.**

[![License: MIT](https://img.shields.io/github/license/Markcial/mock)](LICENSE)
![fish shell](https://img.shields.io/badge/fish-shell-4AAE46)
[![GitHub stars](https://img.shields.io/github/stars/Markcial/mock?style=social)](https://github.com/Markcial/mock/stargazers)

</div>

## ✨ Features

- 🎭 **Replace any command** with a function that returns the exit code you choose
- 🧩 **Optional body**: run your own code when the mock is called
- 🧹 **`unmock`** removes it again
- 🛡️ Refuses to mock reserved names: `builtin`, `functions`, `eval`, `command`

## 📦 Install

With [Fisher] 4:

```fish
fisher install markcial/mock
```

## 🚀 Usage

```fish
mock COMMAND [EXIT_CODE] [FUNCTION_BODY]
```

- `COMMAND`: the command to mock
- `EXIT_CODE`: defaults to `0`
- `FUNCTION_BODY`: if empty, no code is executed

```fish
mock ls
ls >/dev/null; and echo success

mock ls 1
ls >/dev/null; or echo failed

mock ls 0 "echo hi"
test "hi" = (ls)
```

Clean up when you are done:

```fish
unmock ls
```

## 🧪 Tests

Tests are in `test/mock.fish`, written for [fishtape](https://github.com/jorgebucaran/fishtape) 1 (`test` / `end` blocks). Fishtape 3 uses `@test` and does not run this file.
<!-- TODO(Marc): the old Travis and Slack badges pointed at fisherman services that no longer exist, so they were removed. -->

## 📄 License

[MIT](LICENSE)

[Fisher]: https://github.com/jorgebucaran/fisher

---

<div align="center">

Made by **Marc Garcia** · [marcgarcia.dev](https://marcgarcia.dev) · [@_marc_garcia on X](https://x.com/_marc_garcia) · [GitHub](https://github.com/Markcial)

</div>
