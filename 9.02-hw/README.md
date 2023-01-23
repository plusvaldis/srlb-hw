# Домашнее задание к занятию "9.2 Zabbix. Часть 1 - Черепанов Владислав"


### Инструкция по выполнению домашнего задания


### Задание 1 

Установите Zabbix Server с веб-интерфейсом.

*Приложите скриншот авторизации в админке.*
*Приложите текст использованных команд в GitHub.*  
![Скриншот-1](https://github.com/plusvaldis/srlb-hw/blob/main/9.2-hw/img/img1.png)  

- sudo apt install postgresql  
- dpkg -i zabbix-release_6.0-4+debian11_all.deb  
- apt update  
- sudo apt install zabbix-server-pgsql zabbix-frontend-php php7.4-pgsql zabbix-apache-conf zabbix-sql-scripts nano -y # zabbix-agent  
- sudo -u postgres createuser --pwprompt zabbix  
- sudo -u postgres createdb -O zabbix zabbix  
- zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix  
- sudo nano /etc/zabbix/zabbix_server.conf  
- sudo systemctl restart zabbix-server apache2 # zabbix-agent  
- sudo systemctl enable zabbix-server apache2 # zabbix-agent  

---

### Задание 2 

Установите Zabbix Agent на два хоста.

*Приложите скриншот раздела Configuration > Hosts, где видно, что агенты подключены к серверу.*
*Приложите скриншот лога zabbix agent, где видно, что он работает с сервером.*
*Приложите скриншот раздела Monitoring > Latest data для обоих хостов, где видны поступающие от агентов данные.*
*Приложите текст использованных команд в GitHub.*  
![Скриншот-2](https://github.com/plusvaldis/srlb-hw/blob/main/9.2-hw/img/img2.png)  
![Скриншот-3](https://github.com/plusvaldis/srlb-hw/blob/main/9.2-hw/img/img3.png)  
![Скриншот-4](https://github.com/plusvaldis/srlb-hw/blob/main/9.2-hw/img/img2.png)  

- wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4%2Bdebian11_all.deb  
- dpkg -i zabbix-release_6.0-4+debian11_all.deb  
- apt update  
- sudo apt install zabbix-agent -y  
- sudo systemctl restart zabbix-agent  
- sudo systemctl enable zabbix-agent  

---
## Задание со звёздочкой*

Это дополнительное задание. Его выполнять не обязательно. На зачёт это не повлияет. Вы можете его выполнить, если хотите глубже разобраться в материале.

### Задание 3* 

Установите Zabbix Agent на Windows (компьютер) и подключите его к серверу Zabbix.

*Приложите скриншот раздела Latest Data, где видно свободное место на диске C:*

