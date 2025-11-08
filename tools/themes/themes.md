
make your own theme:

https://wezfurlong.org/wezterm/config/appearance.html
  - a good resource for themes

terminal.sexy (website)
  - a web-based 16-color theme maker

# text editors
## micro
simple
  - just how it should be!
    - uses terminal background color

[theme-name]-tc
  - i think these also rely on the terminal's theme (16 color scheme)


## emacs
  - see [config.el]


## helix:
  - see config for more info
**aurara**
  - **my custom theme**
**aura**
  - still great, can compare with my own version
default
  - great purple text, but suffers from bright yellows, and i don't like the green comments
boo berry
  - ugly christmas reds 'n greens tarnish an otherwise a very practical purple theme
**noctis**
  - sea green 'n gold underwater theme, wayyy more color-coordinated than jellyfish

classics that were well-ported:
edge (default)
  - ported by someone but not merged into helix's repo
  - like aura but with pink, likely the origin of aura, as there's an aura variation..
  - same author as everforest
tokyonight
everforest-dark




## vs-code
  - see vs-code-extensions.txt
  - https://vscodethemes.com/
    - i made it to page 7 and noted a bunch to try below

**aura**
  - the best i've seen so far..
  - dark (soft text)

decent:
noctis
  - unique color scheme, good with original green background and purple (vue) background

shades of purple
  - adventure time but purple, the dark one isn't so good tho..
  
Night Owl
  - solid, purple, blue, green
  - **italics for functions is interesting.. denoting execution goes elsewhere, like return**
  
Midnight Synth
  - not bad! purple ui, hot pink control keywords, off-purple comments, sea-green functions
  
Atom One Dark
  - solid stuff, actually same colors as aura (purple keywords, green strings; swaps orange clases with blue functions) but with a github light grey background
    - TODO: worth trying to swap functions and classes to have more blue

like palenight:
moonlight
  - ?
tokyonight
  - darkest background
catpuccin
  - variations in between
palenight
  - classic
  - purple, blue, cyan, orange, green


at least has something nice about it:
pop 'n lock
  - great contrast but bad colors. the ui is the highlight with a nice 'n clear borders 'n accents for a purp 'n gold scheme
jellyfish
  - a nice monokai variant, though incredibly bright if there's any brightness on the screen, still suffers from those ugly reds from monokai
monokai two (darker)
  - similar to github's theme, very gray in the backgrounds tho
synthwave '84
  - syntax color scheme is too wild, but i dig the sheer difference of it
  

to try next:


garbage:
Dracula Official
Firefly Pro
Cobalt2
pink-cat-boo
huacat





# terminal:
## wezterm
  - neon night (goph)
    -  using this, but miss the old neon pink of cyberpunk
  - aura (goph)
  - adventure time
 
## windows terminal:
https://windowsterminalthemes.dev/
  - cyberpunk 2077

## linux terminals:

chromeos native 'terminal' app

  - NOTE: i think this shows the fonts installed in the linux container, so that you can quickly test them!

  - these kinda suck..
    - but good to play with the old school standard 16 color scheme..
    - these affect text editor themes too
      - works well with micro
    - there's colors for folders, hidden, normal files..
    
    - NOTE: **dim the font, and saturate the background colors**
      - ~50% font, and slide the color picker to the right

  - dark (default)
    - maybe the clearest
  - solarized light
    - perfect for day-time use
  - **dusk** > haze/forest
    - all about the same, just have to dim font / darken background..
    - dusk also matches the default chromeos theme
    - uses purple and night-vision green for folders/files


  fonts
   1. **ubuntu mono**
     - this one is perfect for terminals
       - it reminds of the default mac ones
     - really great at scrunching up a bunch of terminal output
   2. cutive mono
     - very readable, yet still dense
     - also somehow darkens the font?
   2. inconsolata



# these were the themes i liked, from when i used linux/nvim from an ipad mini 2
## my top 4
Plug 'sonph/onehalf', { 'rtp': 'vim' } “like gruvbox but with slightly lighter contrast
  - onehalflight and onehalfdark
Plug 'junegunn/seoul256.vim' “even less contrast than onehalfdark
Plug 'NLKNguyen/papercolor-theme' “more contrast than gruvbox!
Plug ‘sainnhe/everforest

Plug ‘romainl/flattened
Plug 'morhetz/gruvbox’ “#1 for a reason


## base16 shell themes
base16-gruvbox-dark-pale.sh
base16-gruvbox-light-soft.sh
base16-monokai.sh
base16-papercolor-dark.sh
base16-papercolor-light.sh
base16-tomorrow-night-eighties.sh
base16-tomorrow-night.sh


# from some really, really old file
textmate - monokai - sexiest theme ever
notepad++ - bespin, monokai
vim - wombat
visual studio - ragnarok gray by tomas restrepo
komodo - gray
