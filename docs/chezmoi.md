# chezmoi

## Layout

- `.chezmoiroot` points source root at `chezmoi/`, that's where the managed files live.

## Two clones

- Dev clone: wherever I normally work on this repo (e.g. `~/workspace/projects/mac-setup`). Edit, commit, PR here.
- Deploy clone: chezmoi's own clone at `~/.local/share/chezmoi`, created by `chezmoi init`. This is what chezmoi actually reads from, not the dev clone.

## Common commands

| Command | What it does |
|---|---|
| `chezmoi diff` | Preview what apply would change in `$HOME`. Empty output means already in sync. |
| `chezmoi status` | Short list of pending changes (like `git status --porcelain`). Empty means in sync. |
| `chezmoi cat <target>` | Print what chezmoi would write for a target. Pipe to `diff` for a clean content-only comparison: `chezmoi cat ~/.zshrc \| diff - ~/.zshrc` |
| `chezmoi apply <target>` | Apply one file. Use this over a bare apply when checking one thing at a time. |
| `chezmoi apply` | Apply everything pending. |
| `chezmoi update` | `git pull` (deploy clone) + apply, in one step. Normal day to day command. |
| `chezmoi source-path` | Print resolved source dir (accounts for `.chezmoiroot`). |
| `git -C ~/.local/share/chezmoi pull --ff-only` | Pull deploy clone without applying. Use when I want to check the diff before applying, instead of `update`. |

Note: apply never fetches from remote on its own. Always need a pull first (manual, or via `update`).

## Workflow: adding or changing a managed file

Two ways to do this, pick based on whether I'm testing/iterating or just making a known change.

**Dev clone first (normal case)**

1. Edit `chezmoi/dot_vimrc` (or add a new `chezmoi/dot_whatever`) directly in the dev clone. New files follow the naming convention: `dot_` prefix for a leading dot, `private_dot_` if it should stay 0600.
2. Branch, commit, push, PR, merge.
3. On whichever machine: `git -C ~/.local/share/chezmoi pull --ff-only` (or `chezmoi update` for pull+apply together), `chezmoi diff` to check, `chezmoi apply <target>`.

**Fast local iteration (testing a change)**

1. `chezmoi edit --apply ~/.vimrc` opens the source file in `$EDITOR` and applies immediately on save. Repeat as needed, no git round trip required to see the effect live.
2. For a genuinely new file, `chezmoi add ~/.newfile` pulls it into source state with the right naming automatically.
3. Once happy, commit and push straight from the deploy clone (`~/.local/share/chezmoi`), same branch/PR habit as usual, just run from that path instead of the dev clone.
4. Next time I'm in the dev clone, `git pull` picks it up. Dev clone and deploy clone are both just clones of the same repo, doesn't matter which one I commit from, only that I remember to push it somewhere.
