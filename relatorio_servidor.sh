#!/bin/bash
arq=`lscpu | awk '/Arquitetura/{print $2}'`
nucleo=`lscpu | awk '/Soquete/{print $2}'`
velocidade=`lscpu | awk '/CPU MHz/{print $3}'`
fabricante=`lscpu | awk '/Fabricante do hipervisor/{print $4}'`
rede=`route | grep "default" | awk '{print $8}'` #print $2`
IP=`ifconfig | awk -vRS='' '/'$rede'/' | grep "inet " | awk '{print $2}'`
mac=`ifconfig | awk -vRS='' '/'$rede'/' | grep "ether " | awk '{print $2}'`
memoria=`free -m | grep "Mem"| awk '{print $2}'`

nome_maq=` hostname`

echo "Relatório Gerencial do Servidor $nome_maq"

echo " 1- Informações da placa de rede"
echo "		-IP = $IP"
echo "		-MAC = $mac"

echo " 2 - Memória RAM(em MB): $memoria MegaBytes"

echo " 3 - Processador"
echo "		-Fabricante : $fabricante "
echo "		-Velocidade : $velocidade MHz"
echo "		-Número de núcleos : $nucleo"
echo "		-Arquitetura : $arq"

echo "4 - Serviços TCP em execução "
netstat -ltp




 
