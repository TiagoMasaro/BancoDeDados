#Regra 8 - Independência lógica dos dados

#Criar uma TABELA VIRTUAL (view) que mostre para cada funcionário:
#código, nome, cpf, data de admissão e anos trabalhados
create view vi_anosContrato as
(
select codFuncionario, nome, cpf,
date_format(dataAdmissao, "%d/%m/%Y") as dataContrato,
floor(datediff(curdate(), dataAdmissao)/365) as anosContrato
from funcionario);

/*Na criação da VIEW o ideal é montar o SELECT que fará o filtro de dados
primeiro e, em seguida, delimitá-lo por CREATE VIEW nomeTabelaVirtual AS 
e o comando SELECT entre parênteses. 
Cada VIEW pode ser criada com o mesmo nomeTabelaVirtual uma só vez.
Feito isso, a VIEW aparecerá na lista de tabelas com SHOW TABLES ou na lateral
esquerda, no objeto VIEWS.
*/

show tables;
select * from vi_anoscontrato;
