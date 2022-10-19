# Ansible Collection - cellcom.deploy

Documentation for the collection.

inventory.yml file for snmp_playbook.yml(=e.g):

lab:
  hosts: 192.168.184.[73:74]

lab_net:
  children:
    lab:
  vars:
    ansible_network_os: "cisco.iosxr.iosxr"
    ansible_connection: "ansible.netcommon.network_cli"
    ansible_user: "cellcom"
    ansible_ssh_pass: "cellcom"
    snmp:
      communities_name: "Cellsn"
      communities_ro: true
      communities_rw: true
      communities_systemowner: false
      communities_acl_v4: ""
      state: "merged" #replaced/merged/gathered/rendered/parsed
