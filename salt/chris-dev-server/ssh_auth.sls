sshkey:
  ssh_auth.present:
    - user: capt_underpants
    - source: salt://chris-dev-server/ssh_keys/pubkey.pub
    - config: '%h/.ssh/authorized_keys'
