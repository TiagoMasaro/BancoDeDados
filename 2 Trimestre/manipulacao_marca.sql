SELECT * FROM marca;
SELECT COUNT(*) as totalMarcas FROM marca;


/*Mostrar o código e nome de cada produto bem como seu preço de venda e respeciva marca*/


SELECT p.codProduto, p.nome AS "Nome marca", p.precoVenda, m.nome 
from marca AS m 
INNER JOIN produto AS p 
ON p.marca_codMarca = m.codMarca;


INSERT INTO `lanchonete_2d_2024`.`marca` (`nome`) VALUES ('Kopenghagen');
INSERT INTO `lanchonete_2d_2024`.`marca` (`nome`) VALUES ('Toblerone');
INSERT INTO `lanchonete_2d_2024`.`marca` (`nome`) VALUES ('Tial');

UPDATE `lanchonete_2d_2024`.`marca` SET `nome`='Del Valle' WHERE  `codMarca`=10;

DELETE FROM `lanchonete_2d_2024`.`marca` WHERE  `codMarca`=8;