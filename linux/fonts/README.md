# Fonts

## Resources:

Look for icons here
- https://material.io/tools/icons/?icon=cached&style=baseline
- https://github.com/google/material-design-icons/blob/master/iconfont/codepoints
- https://fontawesome.com/cheatsheet
- https://dropways.github.io/feathericons/


## Installed Fonts

Font Awesome:
- https://github.com/FortAwesome/Font-Awesome
- fontawesome.ttf

Other:
- all-the-icons.ttf
- droid_sans.ttf
- fantasque_sans_mono.ttf
- feather.ttf
- file-icons.ttf
- icomoon_feather.ttf
- iosevka_nerd_font.ttf
- material-design-icons.ttf
- material.ttf
- material_design_iconic_font.ttf
- noto_sans.ttf
- octicons.ttf
- waffle.bdf
- weathericons.ttf

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

## Verify Fonts

```bash
fc-list | grep <font-name>
```

## Get Unicode Icons

Look for the icon you need:
``` bash
# Look available glyphs on a specific font
xfd -fa "feather"

# When found, copy it to the clipboard
sudo apt install xclip
echo -ne "\ue9d2" | xclip -selection clipboard
```
