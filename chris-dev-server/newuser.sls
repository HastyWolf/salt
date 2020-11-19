add-sudo-group:
  group.present:
    - name: sudo

add-new-user:
  user.present:
    - name: capt_underpants
    - password: letmein123
    - fullname: Chris
    - groups:
      - sudo
