#Relembrar a estrutura da tabela FUNCIONARIO
desc funcionario;

#Visualizar os dados de cada FUNCIONARIO
select * from funcionario;

#Conferir a data do servidor
select curdate() as "Data corrente do servidor";

#Calcular a quantos anos cada funcionário trabalha na empresa
#floor = arredonda para o inteiro seguinte
#datediff = calcula a diferença em DIAS entre duas datas
#a divisão por 365 foi feita para dar o resultado em ANOS
select nome, 
date_format(dataAdmissao, "%d/%m/%Y") as dataContrato,
floor(datediff(curdate(), dataAdmissao)/365) as anosContrato
from funcionario;



