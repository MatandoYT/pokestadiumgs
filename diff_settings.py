#!/usr/bin/env python3

def apply(config, args):
    config['baseimg'] = 'baseroms/us/baserom.z64'
    config['myimg'] = 'build/pokestadiumgs-us.z64'
    config['mapfile'] = 'build/pokestadiumgs-us.map'
    config['source_directories'] = ['.']
