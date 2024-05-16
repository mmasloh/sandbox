

Copied from ezcmbp64/iac/kspray7

```

cat >$(brew --prefix)/etc/dnsmasq.d/kspray7 <<EOF
address=/n0.kspray7.mbp/192.168.56.70
address=/.ingress.kspray7.mbp/192.168.56.71
address=/padl.kspray7.mbp/192.168.56.72
address=/.tcp2.kspray7.mbp/192.168.56.73
address=/.tcp3.kspray7.mbp/192.168.56.74
address=/first.pool.kspray7.mbp/192.168.56.71
address=/last.pool.kspray7.mbp/192.168.56.74
EOF

sudo brew services restart dnsmasq

```

