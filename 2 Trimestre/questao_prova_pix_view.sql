create view vi_vendasPIX as(

select v.codVenda, v.dataHora, v.tipoPagamento, f.nome as "nomeFuncionario", f.carTrab 
from venda as v
inner join funcionario as f 
on f.codFuncionario = v.funcionario_codFuncionario where v.tipoPagamento="PIX");

select * from vi_vendasPIX;

select * from venda;