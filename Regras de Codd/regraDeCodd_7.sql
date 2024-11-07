#Contexto e exemplo da regra 7 de Edgar Codd
#Independência física dos dados

desc funcionario;
select * from funcionario;

/* Mesmo alterando, por exemplo, o nome de um atributo e
o seu tamanho, o comando SQL para relatório consegue refletir a mudança */
ALTER TABLE `lanchonete_2d_2024`.`funcionario` 
CHANGE COLUMN `carteiraTrabalho` `carTrab` VARCHAR(90) NOT NULL ;

/* O exemplo seguinte cria 2 atributos na tabela FUNCIONARIO
e o relatório geral continua funcionando...
*/
ALTER TABLE `lanchonete_2d_2024`.`funcionario` 
ADD COLUMN `email` VARCHAR(250) NULL AFTER `salarioAtual`,
ADD COLUMN `dataAdmissao` DATE NULL AFTER `email`;


#Relatório que busca dados nas tabelas FUNCIONARIO e CARGO, apresentando
#a data de admissão no formato brasileiro com a função date_format
select f.nome as "Nome do Funcionário", 
f.carTrab as "Carteira de Trabalho", 
date_format(f.dataAdmissao, "%d/%m/%Y") as "Data de Admissão", 
c.nome as "Nome do cargo"
from funcionario as f inner join cargo as c 
on f.cargo_codCargo = c.codCargo;
