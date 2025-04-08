## Grub Config

Modify the `/etc/default/grub` file as superuser:

```bash
subl /etc/default/grub
```

Configure for automatical log in based on the latest selection:
```py
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
GRUB_TIMEOUT=0
```

Then apply the changes: 
```bash
sudo update-grub
```
