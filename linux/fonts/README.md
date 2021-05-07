# Fonts

## TODO
- Reduce number of fonts
- Record font version
- Link to website

## Available Fonts

Panels:
- droid_sans.ttf
- icomoon_feather.ttf
- material.ttf
- noto_sans.ttf

Terminus:
- ter-u12b.otb
- ter-u12n.otb
- ter-u14b.otb
- ter-u14n.otb
- ter-u14v.otb
- ter-u16b.otb
- ter-u16n.otb
- ter-u16v.otb
- ter-u18b.otb
- ter-u18n.otb
- ter-u20b.otb
- ter-u20n.otb
- ter-u22b.otb
- ter-u22n.otb
- ter-u24b.otb
- ter-u24n.otb
- ter-u28b.otb
- ter-u28n.otb
- ter-u32b.otb
- ter-u32n.otb

Main:
- all-the-icons.ttf
- fantasque_sans_mono.ttf
- feather.ttf
- file-icons.ttf
- fontawesome.ttf
- iosevka_nerd_font.ttf
- material_design_iconic_font.ttf
- material-design-icons.ttf
- octicons.ttf
- waffle.bdf
- weathericons.ttf

## Install

``` bash
# Install fonts
cp -rf ~/.dotfiles/linux/fonts/* ~/.local/share/fonts

# Rebuild font cache
fc-cache -f -v

# Verify installation
fc-list | grep <font-name>
```
