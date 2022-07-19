#!/vendor/bin/sh
if ! applypatch --check EMMC:/dev/block/by-name/recovery$(getprop ro.boot.slot_suffix):134217728:5ac0c3238bcef61052ce2751676df91eb3b74620; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/by-name/boot$(getprop ro.boot.slot_suffix):33554432:109236e86b5b28fd5375cca26e1d1684fe2f6e65 \
          --target EMMC:/dev/block/by-name/recovery$(getprop ro.boot.slot_suffix):134217728:5ac0c3238bcef61052ce2751676df91eb3b74620 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
