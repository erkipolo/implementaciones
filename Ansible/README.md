# verificamos las sintaxis
ansible-playbook --syntax-check stage.yml

# probamos el escenario con las tareas del rol "homelab"
ansible-playbook stage.yml

# How to exec a tags
ansible-playbook --tags "common" stage.yml
