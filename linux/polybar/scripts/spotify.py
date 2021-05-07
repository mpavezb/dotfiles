#!/usr/bin/env python

import argparse

import dbus

parser = argparse.ArgumentParser()
parser.add_argument(
    '-t',
    '--trunclen',
    type=int,
    metavar='trunclen'
)
parser.add_argument(
    '-f',
    '--format',
    type=str,
    metavar='custom format',
    dest='custom_format'
)
parser.add_argument(
    '--font',
    type=str,
    metavar='the index of the font to use for the main label',
    dest='font'
)
args = parser.parse_args()


def truncate(name, trunclen):
    if len(name) > trunclen:
        name = name[:trunclen]
        name += '...'
        if ('(' in name) and (')' not in name):
            name += ')'
    return name


# Default parameters
trunclen = 35
output = u'{symbol} {artist}: {song}'
label_with_font = '%{{T{font}}}{label}%{{T-}}'
font = args.font

# parameters can be overwritten by args
if args.trunclen is not None:
    trunclen = args.trunclen
if args.custom_format is not None:
    output = args.custom_format

try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object(
        'org.mpris.MediaPlayer2.spotify',
        '/org/mpris/MediaPlayer2'
    )

    spotify_properties = dbus.Interface(
        spotify_bus,
        'org.freedesktop.DBus.Properties'
    )

    metadata = spotify_properties.Get(
        'org.mpris.MediaPlayer2.Player', 'Metadata')
    status = spotify_properties.Get(
        'org.mpris.MediaPlayer2.Player', 'PlaybackStatus')

    # Handle main label
    symbol = "" if status == 'Paused' else ''
    artist = metadata['xesam:artist'][0] if metadata['xesam:artist'] else ''
    song = metadata['xesam:title'] if metadata['xesam:title'] else ''

    if not artist and not song:
        print('')
    else:
        if font:
            artist = label_with_font.format(font=font, label=artist)
            song = label_with_font.format(font=font, label=song)

        # Add 4 to trunclen to account for status symbol, spaces, and other
        # padding characters
        print(truncate(output.format(symbol=symbol,
                                     artist=artist,
                                     song=song), trunclen + 4))

except Exception as e:
    if isinstance(e, dbus.exceptions.DBusException):
        print('Offline')
    else:
        print(e)
