/*Indicar o comando SQL completo para criar uma tabela virtual (vi_vendasPIX) que apresente:

* o código de cada venda,

* a data no formato brasileiro (sem preocupar-se com a hora) e com o rótulo referenciaData,

* o tipo (método) de pagamento (com a condição de mostrar apenas vendas pagas com PIX),

* o nome do funcionário que participou do processo (de venda),

* a carteira de trabalho do respectivo funcionário.*/

select * from venda;

create view vi_vendasPIX as(

select v.codVenda, date_format(v.dataHora, "%d/%m/%Y") as "ReferenciaData", v.tipoPagamento, f.nome as "nomeFuncionario", f.carTrab 
from venda as v
inner join funcionario as f 
on f.codFuncionario = v.funcionario_codFuncionario where v.tipoPagamento="PIX");

select * from vi_vendasPIX;
