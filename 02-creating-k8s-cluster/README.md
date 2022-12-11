# Criando um deployment do Nginx
1 - kubectl create deploy nginx --image=nginx
2 - kubectl port-forward pod/<nome_do_pod (obtido usando o kubectl get pods)> <local_port>:80