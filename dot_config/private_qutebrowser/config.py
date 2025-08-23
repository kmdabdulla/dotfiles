config.load_autoconfig()

c.tabs.background = True
c.new_instance_open_target = 'window'
c.downloads.position = 'bottom'
c.colors.webpage.darkmode.enabled = True
c.downloads.location.directory = '~/Downloads'


config.bind(',ce', 'config-edit')
config.bind(',p', 'config-cycle -p content.plugins ;; reload')
config.bind('<backspace>', 'back')
config.bind('<Ctrl-l>', 'tab-next')
config.bind('<Ctrl-h>', 'tab-prev')
config.bind('<Shift-l>', 'forward')
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
config.bind('M', 'hint links spawn mpv {hint-url}')

# bindings for qute-1password
config.bind('<1><p>', 'spawn --userscript qute-1pass')
config.bind('<1><p><u>', 'spawn --userscript qute-1pass --username-only')
config.bind('<1><p><p>', 'spawn --userscript qute-1pass --password-only')

css = 'solarized-everything-css/css/gruvbox/gruvbox-all-sites.css'
config.bind(',n', f'config-cycle content.user_stylesheets {css} ""')

c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}',
    'amazon':       'https://www.amazon.com/s?k={}',
    'dict':      'https://thefreedictionary.com/{}',
    'ebay':       'https://www.ebay.com/sch/i.html?_nkw={}',
    'gh':      'https://github.com/search?o=desc&q={}&s=stars',
    'images':      'https://www.google.com/search?tbm=isch&q={}&tbs=imgo:1',
    'maps':       'https://www.google.com/maps/search/{}',
    'yt':      'https://www.youtube.com/results?search_query={}'
}

c.url.default_page = 'www.google.com'
c.url.start_pages = 'www.google.com'

c.fonts.web.family.fantasy = 'Arial'

c.search.incremental = False
c.editor.command = ['ghostty', '-e', 'nvim {file}']

config.source('gruvbox.py')
# c.aliases['ytdl'] = """spawn -v -m bash -c 'cd ~/vid/yt && youtube-dl "$@"' _ {url}"""
