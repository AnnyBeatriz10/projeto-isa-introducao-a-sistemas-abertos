#!/bin/bash

#-----PRINCIPAL----------------

principal()
{
	echo "Informe o tipo de vínculo com a instituição: "
	echo "1 = Aluno"
	echo "2 = Técnico"
	echo "3 = Professor"
	read vinculo_usuario

	case $vinculo_usuario in
	"1")
	
	cria_usuario_aluno
	;;
	
	"2")
	cria_usuario_tecnico
	;;
	
	"3")
	cria_usuario_professor
	;;
	esac
}

#----------PROCEDIMENTOS CRIAÇÃO DE USUARIOS----------------------
cria_usuario_professor()
{
	sudo addgroup -gid 2000 professores #GID 2000
	echo "Digite um nome para o usuário:"
	read nome
	sudo mkdir -p /home/professores/$nome
	sudo adduser -home /home/professores/$nome -gid 2000 $nome
	sudo passwd -e $nome
	data="$(date '+%d de %B de %Y às %H:%M:%S')"
	func="Professor"
	cria_carta
	cd -v /home/professores/$nome
	cria_arquivo_regras
}

cria_usuario_tecnico()
{
	sudo addgroup -gid 1002 tecnicos #GID 1002
	echo "Digite um nome para o usuário: "
	read nome
	sudo mkdir /home/tecnicos/$nome
	sudo adduser -home /home/tecnicos/$nome -gid 1002  $nome
	sudo passwd -e $nome
	data="$(date '+%d de %B de %Y às %H:%M:%S')"	
	func="Técnico"
	cria_carta
	cd -v /home/tecnicos/$nome
	cria_arquivo_regras
}

cria_usuario_aluno()
{
	sudo addgroup -gid 1004 alunos #GID 1004
	echo "Digite um nome para o usuário: "
	read nome
	sudo mkdir /home/alunos/$nome
	sudo adduser -home /home/alunos/$nome -gid 1004 $nome
	sudo passwd -e $nome
	data="$(date '+%d de %B de %Y às %H:%M:%S')"
	func="Aluno"
	cria_carta
	cd -v /home/alunos/$nome
	cria_arquivo_regras
}

#-----DOCUMENTOS--------- 

cria_carta()
{
	echo "Seu cargo na instituição é de: $func" >> welcome_$nome.txt
	echo "A ativação do seu cadastro foi realizada em: "$data >> welcome_$nome.txt
	echo "Bom trabalho!" >> welcome_$nome.txt
}



cria_arquivo_regras()
{

	touch regras.txt 
	echo "Arquivo regras" > regras.txt
}

principal

