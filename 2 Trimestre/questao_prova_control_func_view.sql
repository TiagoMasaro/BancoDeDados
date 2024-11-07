/*Indicar o comando SQL completo para criar uma VIEW (vi_controleFuncionarios) que mostre:

* o nome de cada funcionário,

* seu CPF,

* sua data de admissão no formato brasileiro e com o rótulo "inicioContrato",

* o cálculo de quantos anos o funcionário trabalha na empresa (como se fosse a "idade" do emprego) - com o rótulo anosContrato,

* o salário inicial de acordo com o cargo vinculado a ele,

* observando que apenas os dados dos funcionários vinculados a cargos com salário inicial menor que dois mil reais devem ser exibidos.*/

create view vi_controleFuncionario as (

select f.nome, f.cpf, date_format(f.dataAdmissao, "%d/%m/%Y") as "InícioContrato", floor (datediff(curdate(), dataAdmissao)/365) as "AnosContrato",
c.salarioInicial as "SalarioInicial"
from cargo as c
inner join funcionario as f 
on f.cargo_codCargo = c.codCargo where c.salarioInicial<2000);

select * from vi_controleFuncionario;

select * from funcionario;
select * from cargo;