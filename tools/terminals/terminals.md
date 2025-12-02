


# bindings

also see [shells]

a few common bindings:

in chroemos's default terminal app:

generally, the arrow keys and backspace work as expected
  - c/m-arrows for movement
  - down/up cycles commands
  - c/m-backspace works well too

c-r
  - **reverse i-search**
    - THIS IS WHAT YOU'RE LOOKING FOR
    - c-r, type a few chars, c-r again to cycle through matches

c-c
  - kill signal
    - stop shit with this..

c-z
  - suspend a process
    - put it in the background
      - (emacs seems to have borrowed this too..)

c-l
  - clear output
    - (usually just scrolls down to the end, with the cursor on top)
    - (i think emacs got the c-l idea from this..)

c-f/b
  - bash/emacs movement

c-n/p (and down/up arrow)
  - cycle commands
  
  
  
c-s-[keys] are usually open for terminals to (ab)use too

at least, that's where i put all my terminal shortcuts (pane-splitting, window movement, etc.) when i was using alacritty/wezterm.. i think..

c-s-r
  - restarts the shell






# terminal emulators / apps
## CONCLUSION

WEZZZZZZterrrrrrmmmmmm


## terminal multiplexers
wezterm
  - a terminal first, with built-in tmux features
    - [see entry under terminals]

zellij
  - **no windows binary at the moment, as it uses some non-cross-platform libraries. can use it in WSL though!**
   - https://github.com/zellij-org/zellij/issues/316
  - currently doesn't work remotely? or just not as good session-handling as tmux
 - definitely better than windows terminal, see some of it's features:
   - https://zellij.dev/screencasts/
 - awesome-zellij has some plugins
   - https://github.com/zellij-org/awesome-zellij?tab=readme-ov-file
   - zellij-forgot, to show a searchable pop-up list of commands (very doom/helix-esque!)
   - zellij-jump-list, emacs-like
"extras/alacritty",

tmux
  - the linux classic
  - works well over ssh with great session-handling





## terminals
### contemporary incarnations of classic terminals:
**wezterm**
  - **terminal with tmux features**, similar to windows terminal
    - reduces having one more config file
  - **lua config**
    - the config is simply a lua table!
    - beats the crap out of the windows terminal's generated .json file
    - **hot-reloads!**
  - **has a great appearance, similar to mac os terminals, with some algorithm for when to bold 'n brighten text**
  - **has a few major features**:
    - https://wezfurlong.org/wezterm/features.html
    - copy-mode/vi-mode and search-mode, like alacritty
    - **quick select-mode**
      - generates a selection of places in a text file to jump to, guessing the most common places to jump to
    - **remote hosts (for tabs and windows)**
    - ssh client built-in
      - wezterm ssh ra@my.server
    - connec to a serial port (for embedded devices: arduino)
    - image rendering
  - vs alacrity
    - https://github.com/wez/wezterm/discussions/1769#discussioncomment-2443331 
      - in the words of the dev:
      
      My perception of Alacritty is:
      Hyper-focused on speed above function, with relatively minimal feature set as a result.
      Their default disposition is to not accept features in order to maintain their performance baseline.
      
      My philosophy/motivation for wezterm is:
      **I'm a programmer and I want a programmers terminal**
      **I use multiple operating systems and I want my terminal to behave consistently across them**
      **I want it to look good and feel fast for the things that matter most**: interactive latency, rather than raw throughput
      **I'm sick of terminal emulation mismatches that prevent basic things like italic/underline/true color attributes from working when eg: using remote tmux + mosh, so the multiplexing feature in wezterm exists to eliminate that problem**
    - https://www.reddit.com/r/neovim/comments/16kjpxn/comment/k0xwty6/
      - "Tmux is more universal and available in many devices, but it can feel more *hacky* compared to Wezterm. Colors may render weirdly depending on the terminal emulator (fixed by overriding the $TERM variable), you might have to hard code the clipboard, the cursor for Vim or shell might not render correctly, etc. I also think the default keybindings are truly terrible, and the configuration is much less readable than Lua code.

      At the same time, knowing how to use Tmux and having your own Tmux configuration helps a lot when you have to use SSH or other devices for development."
    - https://www.reddit.com/r/neovim/comments/16kjpxn/comment/k0xtyju/
      - “Suckless“ philosophy (do one thing well and compose with other things to add features) doesn’t work well with the architectures of any terminals out there.  
  - **and works perfectly on windows!!**
  - rust
  - wez is a cool name!
    - also, he's a cool person :)

windows terminal
  - actually **legit, just works**
    - **includes pane-splitting (local), window transparency, and great font rendering!**
  - config file sucks
    - it's auto-generated and it keeps moving things in the config file around! best not to alter the settings through the app, just edit the config file
    - shit way to set themes
      - must add whole color palletes to the single .json file
    - config'ing bindings is weird. must set default bindings to "not bind"? not sure..
    
**alacritty**
  - "a modern terminal emulator that comes with **sensible defaults**, but allows for extensive configuration."
    - very fish-like: **just works, no config needed**
  - "By integrating with other applications, rather than reimplementing their functionality..."
    - meant to combine your own terminal multiplexor (tmux, zellij), and other apps
      - considered great in combination with zellij
  - **GPU-rendering via OpenGL**
  - "vi mode"
    - fish's vi-mode only covers the prompt-line, this one's covers the entire buffer!
  - made with Rust
  - https://github.com/alacritty/alacritty

kitty
  - PERSONAL NOTE: **overall sounds like a whole 'nother layer of customization and complexity**, which i'm just not ready for. I need simple sane defaults, not more customization!
  - overview
    - https://sw.kovidgoyal.net/kitty/overview/#sessions
    - philosophies: keyboard power-user oriented, simple / modular / extensible / hackable, simple configs
    - tabs + windows
    - layouts / compositer
      - **i'm personally not sure about using learning kitty's layout system, over a geneal linux compositer...**
    - **remote control**
      - control other terminal windows
      - "More usefully, you can pipe the output of a command running in one window to another window, for example:"
        - ls | kitty @ send-text --match title:Output --stdin
          - this is nice, **instead of creating new windows and tabs all the time, just use one window for input, then output everything to other windows 'n tabs**
    - startup sessions
      - to **create workspaces**
        - maybe can even just save a workspace
    - a few built-in extensions
      - ssh from terminal made simpler
        - **i personally still think a ssh/sftp file manager GUI is much simpler**
        - "remote file"
          - ls --hyperlink=auto, brings up a few hyperlinked commands, just click to download, open in editor, etc.
        - transfer
          - kitty +kitten transfer /path/to/local/file /path/to/destination/on/remote/computer
          - kitty +kitten transfer file1 dir1 destination/
       - "broadcast"
         - broadcast input from one terminal to multiple other terminals
           - amazing for dev-ops, saving one from writing scripts
  - super scriptable: api to control it; open tab/window/etc.
  - super extensible: "kittens", written in python
  - written in C
  - developer is a crudgemuffin, lol


wayland DE only:
**foot**
  - "A fast, lightweight and minimalistic Wayland terminal emulator"
  - very fast
  - according to the maker of NotCurses tui lib, this one is awesome if you use Wayland
  - https://codeberg.org/dnkl/foot




https://www.reddit.com/r/archlinux/comments/n9noje/alacritty_vs_kitty/
  - didn't read through much, but in general it seems kitty > alacritty
  - foot is mentioned


  
  

### "next gen", heavily reliant on ai-assistance, has more app features

seems like ai bubble garbage.. just use emacs with eshell and gptel!

warp
  - ai-heavy
  - includes an ide? a terminal?
  - closed-source, for-profit
    - has a free tier
  - rust
  - released in feb 2024 for linux (and mac), windows has a waitlist
  
x/fig
  - ai-heavy 
  - acquired by Amazon (now part of 'Amazon Q', a chatbot, for $20/month), along with the team now working for AWS
  - originally written in typescript, then ported to rust as the project went from desktop app to cli focus

