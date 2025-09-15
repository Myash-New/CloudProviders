# Домашнее задание к занятию «Организация сети»

### Подготовка к выполнению задания

1. Домашнее задание состоит из обязательной части, которую нужно выполнить на провайдере Yandex Cloud, и дополнительной части в AWS (выполняется по желанию). 
2. Все домашние задания в блоке 15 связаны друг с другом и в конце представляют пример законченной инфраструктуры.  
3. Все задания нужно выполнить с помощью Terraform. Результатом выполненного домашнего задания будет код в репозитории. 
4. Перед началом работы настройте доступ к облачным ресурсам из Terraform, используя материалы прошлых лекций и домашнее задание по теме «Облачные провайдеры и синтаксис Terraform». Заранее выберите регион (в случае AWS) и зону.

---
### Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать пустую VPC. Выбрать зону.
2. Публичная подсеть.

 - Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
 - Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
 - Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.
3. Приватная подсеть.
 - Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
 - Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
 - Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.

### **Решение**

# Вывод terraform apply
![01](https://github.com/Myash-New/CloudProviders/blob/main/02/01.jpg)
![02](https://github.com/Myash-New/CloudProviders/blob/main/02/02.jpg)
![03](https://github.com/Myash-New/CloudProviders/blob/main/02/03.jpg)
![04](https://github.com/Myash-New/CloudProviders/blob/main/02/04.jpg)
![05](https://github.com/Myash-New/CloudProviders/blob/main/02/05.jpg)
![06](https://github.com/Myash-New/CloudProviders/blob/main/02/06.jpg)

# Проверяю ссылку на доступ к картинке
![07](https://github.com/Myash-New/CloudProviders/blob/main/02/07.jpg)

# Проверяю ссылку на доступ к картинке по IP адресу балансировщика
![08](https://github.com/Myash-New/CloudProviders/blob/main/02/08.jpg)
![09](https://github.com/Myash-New/CloudProviders/blob/main/02/09.jpg)

# Проверяю отказаустойчивость, удаляем одну ВМ
![10](https://github.com/Myash-New/CloudProviders/blob/main/02/10.jpg)
![11](https://github.com/Myash-New/CloudProviders/blob/main/02/11.jpg)

# Проверяю проверки отказаустойчивости, удаляем вторую ВМ
![12](https://github.com/Myash-New/CloudProviders/blob/main/02/12.jpg)
![13](https://github.com/Myash-New/CloudProviders/blob/main/02/13.jpg)
