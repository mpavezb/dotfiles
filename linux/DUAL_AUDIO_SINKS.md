
```bash
# Get current sink names (same as displayed by the sound config)
pactl list sinks | grep Name

# Create combined sink
pactl load-module module-combine-sink sink_name=SinkName slaves=Sink1Name,Sink2Name

# Example
pactl list sinks | grep Name
	Name: alsa_output.pci-0000_04_00.6.analog-stereo
	Name: bluez_output.80_99_E7_C9_AF_51.1
	Name: bluez_output.80_99_E7_CB_03_B7.1

pactl load-module module-combine-sink sink_name=DualSink slaves=bluez_output.80_99_E7_C9_AF_51.1,bluez_output.80_99_E7_CB_03_B7.1
536870916
```

Then, select the new sink in the sound config.