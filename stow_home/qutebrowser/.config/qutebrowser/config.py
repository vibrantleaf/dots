# settings
c.completion.scrollbar.width = 0
c.scrolling.bar = 'never' # allways
c.content.cookies.accept = 'all' # none
c.tabs.show = 'always' # never
c.tabs.position = "bottom" # top, left, right
#c.content.notifications.enabled = True # True
c.content.fullscreen.window = True # False
c.content.geolocation = 'ask'
c.scrolling.smooth = True # False
c.tabs.favicons.scale = 1
c.confirm_quit = [ 'always' ] # never
c.content.webgl = False # True
c.aliases = {'q': 'quit', 'w': 'session-save', 'wq': 'quit --save'}
c.downloads.location.directory = '~/Downloads'
c.zoom.default = '100%'
c.tabs.mousewheel_switching = False # True
c.zoom.text_only = True # False
config.load_autoconfig()

# bindings
config.unbind('<Ctrl-w>')
config.unbind('q')
config.unbind('<Ctrl-v>')
# ui
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
#  mpv
config.bind(',M', 'hint links spawn --detach mpv --force-window yes {hint-url}')
config.bind(',m', 'spawn --detach mpv {url}')
# youtube-dl
config.bind(",dv", 'hint links spawn --detach youtube-dl --output "$QUTE_DOWNLOAD_DIR/%(title)s.%(ext)s" -f bestvideo+bestaudio  "{hint-url}"')
config.bind(",Dv", ' spawn --detach youtube-dl --output "$QUTE_DOWNLOAD_DIR/%(title)s.%(ext)s" -f bestvideo+bestaudio "{url}"')
config.bind(",da", 'hint links spawn --detach youtube-dl --output "$QUTE_DOWNLOAD_DIR/%(title)s.%(ext)s" -x --audio-format wav --audio-quality 0 "{hint-url}"')
config.bind(",Da", 'spawn --detach youtube-dl --output "$QUTE_DOWNLOAD_DIR/%(title)s.%(ext)s" -x --audio-format wav --audio-quality 0 "{url}"')

# search engine shortneners
c.url.searchengines = {
"DEFAULT":"https://duckduckgo.com/?q={}",
"wiki": "https://en.wikipedia.org/w/index.php?search={}",
"steam": "http://store.steampowered.com/search/?term={}",
"duck": "https://duckduckgo.com/q={}",
"aur": "https://aur.archlinux.org/packages/?O=0&K={}",
"arch": "https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={}",
"lutris": "https://lutris.net/games/?q={}",
"deal": "https://isthereanydeal.com/search/?q={}",
"gog": "https://www.gog.com/games?sort=popularity&search={}&page=1",
"proton": "https://www.protondb.com/search?q={}",
"qwant": "https://www.qwant.com/?q={}",
"sp": "https://www.startpage.com/do/dsearch?query={}",
"humble": "https://www.humblebundle.com/store/search?sort=bestselling&search={}",
"itch": "https://itch.io/search?q={}"
}

# extensions
import sys, os
from qutebrowser.api import interceptor
sys.path.append(os.path.join(sys.path[0], 'jblock'))
config.source("jblock/integrations/qutebrowser.py")
config.source('qutenyan/nyan.py')

# ==== Youtube Add Blocking ==== {{{
def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if (
        url.host() == "www.youtube.com"
        and url.path() == "/get_video_info"
        and "&adformat=" in url.query()
     ):
        info.block()

interceptor.register(filter_yt)
#}}}

# homepage
c.url.start_pages = [ 'file:///home/julia/.webpage/homepage.html' ]
c.url.default_page = 'file:///home/julia/.webpage/homepage.html'

# fonts
c.fonts.contextmenu = 'RobotoMono Nerd Font'
c.fonts.default_family = 'Roboto'
c.fonts.default_size = "12pt"

# site theme
#c.content.user_stylesheets = '~/.config/qutebrowser/css/nord-dark-all-sites.css'
c.colors.webpage.darkmode.enabled = True # False

# xresources
import subprocess
def read_xresources(prefix):
    props = {}
    x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split('\n')
    for line in filter(lambda l : l.startswith(prefix), lines):
        prop, _, value = line.partition(':\t')
        props[prop] = value
    return props
xresources = read_xresources('*')
c.colors.statusbar.normal.bg = xresources['*.background']




# nord theme by KnowAsDon
# https://github.com/KnownAsDon/QuteBrowser-Nord-Theme
nord = {
    'base03': '#161b1d',
    'base02': '#161b1d',
    'base01': '#ebf8ff',
    'base00': '#161b1d',
    'base0':  '#161b1d',
    'base1':  '#7ea2b4',
    'base2':  '#ebf8ff',
    'base3':  '#ebf8ff',
    'yellow': '#8a8a0f',
    'orange': '#8a8a0f',
    'red':    '#d22d72',
    'magenta':'#5d5db1',
    'violet': '#5d5db1',
    'blue':   '#257fad',
    'cyan':   '#2d8f6f',
    'green':  '#568c3b'
}
c.colors.completion.category.bg = nord['base03']
c.colors.completion.category.border.bottom = nord['base03']
c.colors.completion.category.border.top = nord['base03']
c.colors.completion.category.fg = nord['base3']
c.colors.completion.even.bg = nord['base02']
c.colors.completion.fg = nord['base3']
c.colors.completion.item.selected.bg = nord['violet']
c.colors.completion.item.selected.border.bottom = nord['violet']
c.colors.completion.item.selected.border.top = nord['violet']
c.colors.completion.item.selected.fg = nord['base3']
c.colors.completion.match.fg = nord['base2']
c.colors.completion.odd.bg = nord['base02']
c.colors.completion.scrollbar.bg = nord['base0']
c.colors.completion.scrollbar.fg = nord['base2']
c.colors.downloads.bar.bg = nord['base03']
c.colors.downloads.error.bg = nord['red']
c.colors.downloads.error.fg = nord['base3']
#c.colors.downloads.start.bg = '#0000aa'
c.colors.downloads.start.fg = nord['base3']
#c.colors.downloads.stop.bg = '#00aa00'
#c.colors.downloads.stop.fg = nord['base3']
#c.colors.downloads.system.bg = 'rgb'
#c.colors.downloads.system.fg = 'rgb'
c.colors.hints.bg = nord['violet']
c.colors.hints.fg = nord['base3']
c.colors.hints.match.fg = nord['base2']
#c.colors.keyhint.bg = 'rgba(0, 0, 0, 80%)'
c.colors.keyhint.fg = nord['base3']
c.colors.keyhint.suffix.fg = nord['yellow']
c.colors.messages.error.bg = nord['red']
c.colors.messages.error.border = nord['red']
c.colors.messages.error.fg = nord['base3']
c.colors.messages.info.bg = nord['base03']
c.colors.messages.info.border = nord['base03']
c.colors.messages.info.fg = nord['base3']
c.colors.messages.warning.bg = nord['orange']
c.colors.messages.warning.border = nord['orange']
c.colors.messages.warning.fg = nord['base3']
c.colors.prompts.bg = nord['base02']
c.colors.prompts.border = '1px solid ' + nord['base3']
c.colors.prompts.fg = nord['base3']
c.colors.prompts.selected.bg = nord['base01']
c.colors.statusbar.caret.bg = nord['blue']
c.colors.statusbar.caret.fg = nord['base3']
c.colors.statusbar.caret.selection.bg = nord['violet']
c.colors.statusbar.caret.selection.fg = nord['base3']
c.colors.statusbar.command.bg = nord['base03']
c.colors.statusbar.command.fg = nord['base3']
c.colors.statusbar.command.private.bg = nord['base01']
c.colors.statusbar.command.private.fg = nord['base3']
c.colors.statusbar.insert.bg = nord['green']
c.colors.statusbar.insert.fg = nord['base3']
c.colors.statusbar.normal.bg = nord['base03']
c.colors.statusbar.normal.fg = nord['base3']
c.colors.statusbar.passthrough.bg = nord['magenta']
c.colors.statusbar.passthrough.fg = nord['base3']
c.colors.statusbar.private.bg = nord['base01']
c.colors.statusbar.private.fg = nord['base3']
c.colors.statusbar.progress.bg = nord['base3']
c.colors.statusbar.url.error.fg = nord['red']
c.colors.statusbar.url.fg = nord['base3']
c.colors.statusbar.url.hover.fg = nord['base2']
c.colors.statusbar.url.success.http.fg = nord['base3']
c.colors.statusbar.url.success.https.fg = nord['base3']
c.colors.statusbar.url.warn.fg = nord['yellow']
#c.colors.tabs.bar.bg = '#555555'
c.colors.tabs.even.bg = nord['base01']
c.colors.tabs.even.fg = nord['base2']
c.colors.tabs.indicator.error = nord['red']
c.colors.tabs.indicator.start = nord['violet']
c.colors.tabs.indicator.stop = nord['orange']
c.colors.tabs.odd.bg = nord['base01']
c.colors.tabs.odd.fg = nord['base2']
c.colors.tabs.selected.even.bg = nord['base03']
c.colors.tabs.selected.even.fg = nord['base3']
c.colors.tabs.selected.odd.bg = nord['base03']
c.colors.tabs.selected.odd.fg = nord['base3']

