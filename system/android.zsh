# By default, Android does not have /dev/stdin or /dev/stderr, so in order for some of my scripts to work, I need to create them on each boot
if ! ( [ -L /dev/stdin ] && [ -L /dev/stderr ] ); then
  su -c '
    ln -sf /proc/self/fd/0 /dev/stdin &&
    ln -sf /proc/self/fd/2 /dev/stderr
  '
fi
