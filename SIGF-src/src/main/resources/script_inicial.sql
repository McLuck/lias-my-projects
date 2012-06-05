-- Title: Configuração da Concessonaria RodoSol
-- Copyright (c) 2006 COMPSIS Computadores e Sistemas LTDA
-- Rua Pindamonhangaba, 160 - Vila Nova Conceição
-- 12231-090 - São José dos Campos - SP
-- Projeto: SICAT XP
-- Autor: Giuliano
-- Data: 11/08/2011
-- Fornecimento a partir da SGAP-05.03.30.33(head)

-- SUPER USUARIO 
insert into Cargo(IdCargo, Descricao, DataInsercao) values(0, 'Administrativo', dbo.trunc_date(getDate()));

--TabelaCategorias 
insert into TabelaCategorias(IdTabelaCategorias, IdOperador, InicioVigencia, Ativo, DataInsercao) values(-1, null, dbo.trunc_date(getDate()), 1, dbo.trunc_date(getDate()));

-- Categorias 
--IdTabelaCategorias  é por padrão -1, para configuração do sistema.
--Altura é por padrão como 0, para cliente do Brasil.											--ALTERADO
insert into categoria(IdCategoria, CodigoCategoriaCV, IdTabelaCategorias, Descricao, numeroEixos, RodagemDupla, RodagemMoto, DataInsercao, TipoVeiculo, Altura, habilitaClassificacao, ordem) Values(1, 1, -1, 'CAT 1',    2, 0,   0, dbo.trunc_date(getDate()), 'P', 0, 1, 1);
insert into categoria(IdCategoria, CodigoCategoriaCV, IdTabelaCategorias, Descricao, numeroEixos, RodagemDupla, RodagemMoto, DataInsercao, TipoVeiculo, Altura, habilitaClassificacao, ordem) Values(2, 2, -1, 'CAT 2',    2, 1,   0, dbo.trunc_date(getDate()), 'C', 0, 1, 2);
insert into categoria(IdCategoria, CodigoCategoriaCV, IdTabelaCategorias, Descricao, numeroEixos, RodagemDupla, RodagemMoto, DataInsercao, TipoVeiculo, Altura, habilitaClassificacao, ordem) Values(3, 3, -1, 'CAT 3',    3, 0,   0, dbo.trunc_date(getDate()), 'P', 0, 1, 3);
insert into categoria(IdCategoria, CodigoCategoriaCV, IdTabelaCategorias, Descricao, numeroEixos, RodagemDupla, RodagemMoto, DataInsercao, TipoVeiculo, Altura, habilitaClassificacao, ordem) Values(4, 4, -1, 'CAT 4',    3, 1,   0, dbo.trunc_date(getDate()), 'C', 0, 1, 4);
insert into categoria(IdCategoria, CodigoCategoriaCV, IdTabelaCategorias, Descricao, numeroEixos, RodagemDupla, RodagemMoto, DataInsercao, TipoVeiculo, Altura, habilitaClassificacao, ordem) Values(5, 5, -1, 'CAT 5',    4, 0,   0, dbo.trunc_date(getDate()), 'P', 0, 1, 5);
insert into categoria(IdCategoria, CodigoCategoriaCV, IdTabelaCategorias, Descricao, numeroEixos, RodagemDupla, RodagemMoto, DataInsercao, TipoVeiculo, Altura, habilitaClassificacao, ordem) Values(6, 6, -1, 'CAT 6',    4, 1,   0, dbo.trunc_date(getDate()), 'C', 0, 1, 6);
insert into categoria(IdCategoria, CodigoCategoriaCV, IdTabelaCategorias, Descricao, numeroEixos, RodagemDupla, RodagemMoto, DataInsercao, TipoVeiculo, Altura, habilitaClassificacao, ordem) Values(7, 7, -1, 'CAT 7',    5, 1,   0, dbo.trunc_date(getDate()), 'C', 0, 1, 7);
insert into categoria(IdCategoria, CodigoCategoriaCV, IdTabelaCategorias, Descricao, numeroEixos, RodagemDupla, RodagemMoto, DataInsercao, TipoVeiculo, Altura, habilitaClassificacao, ordem) Values(8, 8, -1, 'CAT 8',    6, 1,   0, dbo.trunc_date(getDate()), 'C', 0, 1, 8);
insert into categoria(IdCategoria, CodigoCategoriaCV, IdTabelaCategorias, Descricao, numeroEixos, RodagemDupla, RodagemMoto, DataInsercao, TipoVeiculo, Altura, habilitaClassificacao, ordem) Values(9, 9, -1, 'MOTO', 	   2, 0,   2, dbo.trunc_date(getDate()), 'P', 0, 1, 9);
--categorias do cgmp, se houver
insert into categoria(IdCategoria, CodigoCategoriaCV, IdTabelaCategorias, Descricao, numeroEixos, RodagemDupla, RodagemMoto, DataInsercao, TipoVeiculo, Altura, habilitaClassificacao, ordem)Values(99, 99, -1, 'CAT ESP',  NULL,  NULL, 0, dbo.trunc_date(getDate()), 'C',0, 1, 10);

--CategoriasAVC 
--quando há avc padrão nigéria

--Controle de Acesso e Arrecadação 
-- Papéis
insert into papel (idpapel, descricao, flagvisivel, datainsercao) values(0, 'Administrativo',1, dbo.trunc_date(getDate()));
insert into papel (idpapel, descricao, flagvisivel, datainsercao) values(1, 'Arrecadador', 1, dbo.trunc_date(getDate()));
insert into papel (idpapel, descricao, flagvisivel, datainsercao) values(2, 'Coletor de Sangria', 1, dbo.trunc_date(getDate()));
insert into papel (idpapel, descricao, flagvisivel, datainsercao) values(3, 'Supervisor', 1, dbo.trunc_date(getDate()));
insert into papel (idpapel, descricao, flagvisivel, datainsercao) values(4, 'Tesoureiro', 1, dbo.trunc_date(getDate()));
insert into papel (idpapel, descricao, flagvisivel, datainsercao) values(5, 'Vendedor de Cupom', 1, dbo.trunc_date(getDate()));
--insert into papel (idpapel, descricao, flagvisivel, datainsercao) values(6, 'Operador de PDV',1 , dbo.trunc_date(getDate())); --somente quem possui SGMP
insert into papel (idpapel, descricao, flagvisivel, datainsercao) values(7, 'Pista Fechada', 0 , dbo.trunc_date(getDate()));
insert into papel (idpapel, descricao, flagvisivel, datainsercao) values(8, 'Pista Automática', 0, dbo.trunc_date(getDate()));
insert into papel (idpapel, descricao, flagvisivel, datainsercao) values(9, 'Responsável por Pista', 1, dbo.trunc_date(getDate()));
--insert into papel (idpapel, descricao, flagvisivel, datainsercao) values(10, 'Manutenção', 1, dbo.trunc_date(getDate()));

-- Perfis 
insert into perfil(idperfil, descricao, datainsercao,idpapelnaoadm) values(0, 'Administrativo', dbo.trunc_date(getDate()), 0);
insert into perfil(idperfil, descricao, datainsercao,idpapelnaoadm) values(1, 'Arrecadador', dbo.trunc_date(getDate()), 1);
insert into perfil(idperfil, descricao, datainsercao,idpapelnaoadm) values(2, 'Coletor de Sangria', dbo.trunc_date(getDate()), 2);
insert into perfil(idperfil, descricao, datainsercao,idpapelnaoadm) values(3, 'Supervisor', dbo.trunc_date(getDate()), 3);
insert into perfil(idperfil, descricao, datainsercao,idpapelnaoadm) values(4, 'Tesoureiro', dbo.trunc_date(getDate()), 4);
insert into perfil(idperfil, descricao, datainsercao,idpapelnaoadm) values(5, 'Vendedor de Cupons', dbo.trunc_date(getDate()), 5);
insert into perfil(idperfil, descricao, datainsercao,idpapelnaoadm) values(9, 'Responsável por Pista', dbo.trunc_date(getDate()), 9);
--insert into perfil(idperfil, descricao, datainsercao,idpapelnaoadm) values(10, 'Manutenção', dbo.trunc_date(getDate()), 10);

-- Preferências Diversas 
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(1, '1.0.1', 0, 4);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(1, null, 3, 4);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(2, null, 3, 4 );	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(2, 'd:\sicat\sgap-sa\resources\image\', 0, 4); 	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(3, 'd:\sicat\sgap-sa\resources\report', 0, 4); 	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4, '10', 0, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4, '2', 1, 1); 	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(5, '0', 0, 1); 	--ALTERADO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(6, '2', 0, 1);	--ALTERADO_2
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(7, '9', 0, 1);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(8, null, 1, 1); --nao encontrada
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(9, '1', 1, 1); --nao encontrada
insert into preferencias(idpreferencia, valor, sistema, tipo) values(10, 'http://SICATSGAP:18080/vasves', 1, 4);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(11, '1', 1, 4);	--ALTERADO_2
insert into preferencias(idpreferencia, valor, sistema, tipo) values(12, '300', 1, 4);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(13, '30', 1, 4);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(14, '0', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(15, '4', 1, 4);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(15, '1', 2, 1); --nao encontrada
insert into preferencias(idpreferencia, valor, sistema, tipo) values(16, '1', 0, 1); 	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(17,'D:\\sicat\\app\\server\\sgap\\deploy\\vasves.war\\', 1, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(18, '0', 1, 1); 	--ALTERADO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(19, '5', 1, 1 ); --nao encontrada
insert into preferencias(idpreferencia, valor, sistema, tipo) values(20, '-1', 1, 4);	--ALTERADO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(21, '3', 1, 4);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(22, '4', 1, 4 );	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(23, '04/07/2011', 1, 4 );	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(24, '0', 1, 4);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(25, '90', 1, 1);	--MANTIDO
--insert into Preferencias(idpreferencia, valor, sistema, tipo) values(26, '0', 0, 1);	--MANTIDO
--insert into Preferencias(idpreferencia, valor, sistema, tipo) values(27, 'D:\SICAT\sgmp\PDV\Cadastros', 0, 1);
insert into preferencias(idpreferencia, valor, sistema, tipo) values(28, '0', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(29, '0', 1, 1); 	--ALTERADO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(30,'TermoReconhecimentoDivida.jasper',0,4 );--nao utilizada
insert into preferencias(idpreferencia, valor, sistema, tipo) values(30, '5', 1, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(31, '3', 0, 1);	--ALTERADO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(32, '5', 0, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(33, '0', 0, 0);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(34, 'D:\sicat\app\server\sgap\deploy\vasves.war\', 1, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(35, '0', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(36, '0', 1, 4);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(37, '0', 1, 4);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(38, '0', 0, 4);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(39, '0', 0, 4);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(40, '1', 0, 4);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(41, '0', 0, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(42, '0', 1, 1);	--ALTERADO_2
Insert into preferencias(idpreferencia, valor, sistema, tipo) Values(43, '1', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(44, '3600000', 0, 2);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(45, '0', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) Values(46, '0', 1, 1); 	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(47, '255', 1, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(48, '1', 1, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(49, '1', 1, 1); 	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(50, '0', 1, 1); 	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(51, '0', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(52, '0', 1, 1); 	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(53, '5745', 0, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(54, '3', 1, 1);	--ALTERADO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(55, '60', 1, 2);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(56, '60', 1, 2);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(57, '0', 0, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(58, '0', 1, 1);	--MANTIDO
Insert into preferencias(idpreferencia, valor, sistema, tipo) values(59, '0', 1, 4);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(60, '120000',1, 4);	--ALTERADO_2
Insert into preferencias(idpreferencia, valor, sistema, tipo) values(61, '0', 1, 4);	--ALTERADO_2
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(62, '-1', 1, 3);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(63, '1600', 1, 0);	--MANTIDO
--Insert into preferencias(idpreferencia, valor, sistema, tipo) values(64, '10', 1, 4);	--ALTERADO_2
insert into preferencias(idpreferencia, valor, sistema, tipo) values(65, '1', 1, 2);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(66, '0', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(67, '255',1,1);	--ALTERADO_2
insert into preferencias(idpreferencia, valor, sistema, tipo) values(68, '0', 1, 1);	--ALTERADO
--solicitar a dbtrans e-pedagio o valor das preferencias 69,70,71
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(69, 'RodoSol', 1, 4);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(70, 'ok',1,  4);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(71, '581900211',1,1);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(72, '0', 1, 1);	--ALTERADO_2
insert into preferencias(idpreferencia, valor, sistema, tipo) values(73, '0', 1, 1);	--MANTIDO
insert into Preferencias(IdPreferencia, Valor, Sistema, Tipo) values(74, '0', 1, 1);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(75,'termoreconhecimentodividaperiodo.jasper',0,4 );	--LIVRE
insert into preferencias(IDPreferencia, Valor, Sistema, Tipo) values(76, '1', 0, 1);	--ALTERADO
--insert into Preferencias(IdPreferencia, Valor, Sistema, Tipo) values(77, '5021',0,1);	--MANTIDO
insert into Preferencias(IdPreferencia, Valor, Sistema, Tipo) values(78, '0', 1, 1);	--ALTERADO
insert into Preferencias(IdPreferencia, Valor, Sistema, Tipo) values(79, '1', 0, 4);	--ALTERADO
insert into Preferencias(idpreferencia, valor, sistema, tipo) values(80, '0', 1, 1);	--ALTERADO
insert into Preferencias(idpreferencia, valor, sistema, tipo) values(81, '0', 1, 1);	--ALTERADO
insert into Preferencias(idpreferencia, valor, sistema, tipo) Values(82, '0', 1, 1);	--ALTERADO_2
insert into Preferencias(idpreferencia, valor, sistema, tipo) Values(83, '0', 1, 1);	--ALTERADO_2
insert into Preferencias(idpreferencia, valor, sistema, tipo) Values(84, '0', 1, 4);	--ALTERADO
insert into Preferencias(idpreferencia, valor, sistema, tipo) values(85, '0', 1, 4);	--ALTERADO
insert into Preferencias(idpreferencia, valor, sistema, tipo) Values(86, '0', 1, 1);	--ALTERADO
--insert into Preferencias(idpreferencia, valor, sistema, tipo) values(87, '501', 1, 1);	--MANTIDO
--insert into Preferencias(idpreferencia, valor, sistema, tipo) values(88, '15', 1, 1);	--ALTERADO_2
--89--ohl
--insert into Preferencias(idpreferencia, valor, sistema, tipo) values(90, '00:00:00', 1, 4);
insert into Preferencias(idpreferencia, valor, sistema, tipo) Values(91, '900', 1, 1);	--MANTIDO
insert into Preferencias(idpreferencia, valor, sistema, tipo) values(92, '0', 1, 1);	--ALTERADO
insert into Preferencias(idpreferencia, valor, sistema, tipo) values(93, null, 0, 4);	--MANTIDO
insert into Preferencias(idpreferencia, valor, sistema, tipo) values(94, '0', 1, 1);	--MANTIDO
insert into Preferencias(idpreferencia, valor, sistema, tipo) values(95, null, 0, 4);	--MANTIDO
insert into Preferencias(idpreferencia, valor, sistema, tipo) values(96, '0', 1, 1);	--ALTERADO
insert into Preferencias(idpreferencia, valor, sistema, tipo) values(97, null, 0, 4);	--MANTIDO
insert into Preferencias(idpreferencia, valor, sistema, tipo) values(98, '5000;5001;5002;5003;5004;5145', 1, 4);	--MANTIDO
insert into Preferencias(idpreferencia, valor, sistema, tipo) values(99, '0;0;0;0;0;0', 1, 4);	--MANTIDO
--insert into Preferencias(idpreferencia, valor, sistema, tipo) values(100, '500', 1, 4);	--MANTIDO
--insert into Preferencias(idpreferencia, valor, sistema, tipo) values(101, '0', 1, 4);	--MANTIDO
insert into Preferencias(idpreferencia, valor, sistema, tipo) values(102, '0', 1, 4);	--ALTERADO
--insert into Preferencias(idpreferencia, valor, sistema, tipo )values(103, '0', 1, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(104, '0', 1, 4);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(105, '0', 1, 4);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(106, '0', 1, 4);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(107, '0', 1, 4);	--ALTERADO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(108, '0', 1, 1);	--ALTERADO_2
insert into preferencias(idpreferencia, valor, sistema, tipo) values(109, '0', 1, 1);	--ALTERADO_2
insert into preferencias(idpreferencia, valor, sistema, tipo) values(110, '0', 1, 4);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(111, '0', 1, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(112, '1', 1, 4);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(113, '0', 1, 4);	--ALTERADO
--114 e 115 reservado para Gustavo Vianna
insert into preferencias(idpreferencia, valor, sistema, tipo) values(116, '1', 1, 1);	--ALTERADO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(127, '1', 1, 1);

-- Preferências  - Interoperação 
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(3001, '120', 3, 1 );	--ALTERADO_2
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(3002, '120', 3, 1 );	--ALTERADO_2

--configurar se a pref 86 estiver habilitada
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4000, '2;3;4;5;6;7;14;15;16;17;18;19;20;21;', 1, 4);	--MANTIDO

-- Preferências  - Forma de Entrega da Arrecadação      
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4001, '1', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4001, '1', 0, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4009, '1', 0, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4009, '1', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4010, '1', 0, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4010, '1', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4011, '1', 0, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4011, '1', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4012, '1', 0, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4012, '1', 1, 1);	--ALTERADO

insert into preferencias(idpreferencia, valor, sistema, tipo) values(4002, '3', 0, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4002, '3', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4003, '0', 1, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4003, '0', 0, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4004, '0', 0, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4005, '2', 0, 1);	--ALTERADO_2
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4005, '2', 1, 1);	--ALTERADO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4006, '0', 1, 1); --nao encontrada
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4007, '\jboss-4.0.1sp1\server\ERP\', 1, 4); --nao encontrada
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4008, '0', 1, 1); --nao encontrada
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4013, '1', 0, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4014, '1', 0, 1 );	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4014, '1', 1, 1 );	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4015, 'G:\CV\DADOS\CV', 1, 4); --nao encontrada
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4016, '30', 0, 1); --não encontrada
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4017, '0', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4018, '1', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4019, '0', 1, 1);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4020, '3', 1, 1);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4021, 'D:\RMMTA', 1, 4);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4022, '0', 1, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4023, '1', 1, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4024, '0', 1, 1); 	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4025, '0', 1, 1); 	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4026, '15', 1, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4027, '5', 1, 1);	--ALTERADO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4028, '2', 1, 1 );	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4029, 'suporte' , 1, 4 );	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4030, 'compsis' , 1, 4 );	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4031, '0', 1, 4);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4032, '127.0.0.1', 1, 4 );	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4033, '27,28,29,58', 0, 4);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4034, 'D:\\Sicat\\app\\server\\sgap\\deploy\\auditoria.war', 1, 4 );	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4035, '0', 0, 4);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4036, '0', 0, 4);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4037, '0', 1, 1);	--ALTERADO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4038, '0', 0, 1 );--nao encontrada
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4039, '0', 1, 1);	--ALTERADO_2
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4040, '0', 0, 1 );	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4041, dbo.DATE_TO_CHAR( dbo.trunc_date(getDate()), 'dd/mm/yyyy'), 1, 1);	--ALTERADO_2
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4042, dbo.DATE_TO_CHAR( dbo.trunc_date(getDate()), 'dd/mm/yyyy'), 0, 1 );	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4043, 'D:\\Sicat\\app\\server\\sgap\\deploy\\contabil.war', 1, 1 ); 	--ALTERADO_2
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4044, 'D:\\Sicat\\app\\server\\sgmp\\deploy\\contabil.war', 2, 1 );	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4045, '3', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4046, '1', 1, 1);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4047, '4', 1, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4048, 'D:\\Sicat\\app\\server\\sgap\\deploy\\auditoriaanomalias.war', 1, 4 );	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4049, 'http://SICATSGAP:18080/auditoriaanomalias', 1, 4 );	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4050, 'D:\\sicat\\arquivosOHL\\', 1, 4 );	--ALTERADO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4051, 'http://SICATSGAP:18080/arquivos', 1, 4 );	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4052, '900000',1 ,1); 	--ALTERADO_2
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4053, '30',1 ,1); 	--ALTERADO_2
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4054, 'D:\\sicat\\app\\server\\sgap\\deploy\\download.war\\', '1', '4' );	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4055, 'http://SICATSGAP:18080/download', 1, 4 );	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4056, 'D:\sicat\app\server\sgap\deploy\malotes.war',1,1 );	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4057, 'D:\sicat\app\server\sgap\deploy\malotes.war\RecebimentoDeposito',1,1 );	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4058, 'D:\sicat\app\server\sgap\deploy\isentoArtesp.war\DestinoCadastroSucesso',1,1 );	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4059, 'D:\sicat\app\server\sgap\deploy\isentoEdital.war\DestinoCadastroSucesso',1,1 );	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4060, null, 0, 4);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4061, '30', 1, 1);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(4062, '90', 1, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4063, '1', 1, 4);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4064, '0', 1, 1);	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(4065, '0', 1, 1);	--MANTIDO

insert into preferencias(idpreferencia, valor, sistema, tipo) values(10000, '0', 3, 1);	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(10001, 'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\Temp\\ImportacaoSGMP\\AProcessar', 3, 4 );	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(10002, 'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\Temp\\ImportacaoSGMP\\Historico' , 3, 4 );	--MANTIDO
--insert into preferencias(idpreferencia, valor, sistema, tipo) values(10003, 'D:\\Sicat\\app\\server\\sgap\\deploy\\interop.war\\Temp\\ImportacaoSGMP\\Erros'     , 3, 4 );	--MANTIDO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(10004, '0', 1, 3);	--ALTERADO
insert into preferencias(idpreferencia, valor, sistema, tipo) values(10005, null, 0, 4);	--MANTIDO

----------------------
-- Funcionalidades  
----------------------

-----------------------------------------------------------------------
-- Funcionalidades Relacionadas ao MESAC - CCO --
-----------------------------------------------------------------------
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-19, 'Declaração Offline Vendedor de Cupom com Troco Explícito', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-18, 'Mesac CCO', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-17, 'Mesac Praça', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-16, 'Declaração Offline Vendedor de Cupom com Troco Implícito', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-15, 'Declaração Offline Sangria', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-14, 'Declaracao Offline Arrecadador Troco Implícito', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-13, 'Declaraçao Offline Arrecadador Troco Explícito', dbo.trunc_date(getDate()), null, null, 0);

-----------------------------------------------------------------------
-- Funcionalidades Relacionadas ao Tempo Real  --
-----------------------------------------------------------------------
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-12,'CS - Função de Abertura e Fechamento de Pista Automática',dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-11,'CS - Manutenção',dbo.trunc_date(getDate()), null,null,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-10,'CS - Configurar Ambiente de Execução da Aplicação',dbo.trunc_date(getDate()), null,null,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-9, 'CS - Supervisão',dbo.trunc_date(getDate()), null,null,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-8, 'CS - Operador',dbo.trunc_date(getDate()), null,null,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-7, 'CV - Abertura e Fechamento de Pista Automática',dbo.trunc_date(getDate()), null,null,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-6, 'CV - Sangria',dbo.trunc_date(getDate()), null,null,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-5, 'CV - Configurar o Ambiente de Execução da Aplicação',dbo.trunc_date(getDate()), null,null,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-4, 'CV - Carregar Dados do Disquete',dbo.trunc_date(getDate()), null,null,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-3, 'CV - Alterar Modo de Operação da Pista e Cadastro de Tarifas',dbo.trunc_date(getDate()), null,null,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-2, 'CV - Configuração Básica - Classificação',dbo.trunc_date(getDate()), null,null,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(-1, 'CV - Abertura e Fechamento de Pista Manual',dbo.trunc_date(getDate()), null,null,0);

----------------------------------------------------------------------------------------
-- Funcionalidades Relacionadas ao Menu de Configuração do SGAP --
----------------------------------------------------------------------------------------
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(1, 'Configuração.Controle de Acesso' ,dbo.trunc_date(getDate()),'Configuracao/actionOperador.do?action=indexOperadores',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(2, 'Configuração.Tarifas' ,dbo.trunc_date(getDate()),'Configuracao/actionProgramacaoTarifa.do?action=indexProgramacaoTarifa',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3, 'Configuração.Horários de Verão' ,dbo.trunc_date(getDate()),'Configuracao/actionHorarioVerao.do?action=indexHorarioVeroes',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(5, 'Configuração.Configuração da Arrecadação' ,dbo.trunc_date(getDate()),'Configuracao/actionConfiguracaoArrecadacao.do?action=indexConfiguracaoArrecadacao',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(6, 'Configuração.Contas Bancárias' ,dbo.trunc_date(getDate()),'Configuracao/actionContaBanco.do?action=indexConta',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(7, 'Configuração.Transportadoras' ,dbo.trunc_date(getDate()),'Configuracao/actionTransportadora.do?action=indexTransportadora',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(8, 'Configuração.Classes de Tarifas' ,dbo.trunc_date(getDate()),'Configuracao/actionClasseTarifa.do?action=indexClasseTarifa',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(9, 'Configuração.Pacotes' ,dbo.trunc_date(getDate()),'Caixa/Configuracao/actionPacote.do?action=indexPacotes',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(10, 'Configuração.Fundo de Troco' ,dbo.trunc_date(getDate()),'Caixa/Configuracao/actionAgrupamento.do?action=indexAgrupamentos',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(12, 'Configuração.Áreas da Tesouraria' ,dbo.trunc_date(getDate()),'Caixa/Configuracao/actionArea.do?action=indexAreas',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(13, 'Configuração.Denominações' ,dbo.trunc_date(getDate()),'Caixa/Configuracao/actionDenominacao.do?action=indexDenominacoes',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(14, 'Configuração.Emissores de Cupons' ,dbo.trunc_date(getDate()),'Configuracao/actionEmissorCupom.do?action=listEmissorCupom',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(15, 'Configuração.CPF/CNPJ' ,dbo.trunc_date(getDate()),'Cheque/actionCheque.do?action=indexCheque',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(16, 'Configuração.Isentos.Veículos Isentos' ,dbo.trunc_date(getDate()),'Isento/actionVeiculoIsento.do?action=indexVeiculosIsentos',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(17, 'Configuração.Isentos.Tipos de Veículos Isentos' ,dbo.trunc_date(getDate()),'Isento/actionTipoDeIsento.do?action=indexTipoDeIsentos',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(18, 'Configuração.Controle de Acesso.Senha Padrão', dbo.trunc_date(getDate()), null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(19, 'Configuração.Sistema', dbo.trunc_date(getDate()), 'Configuracao/actionConfiguracaoSistema.do?action=indexConfiguracaoSistema', 1);

-----------------------------------------------------------------------------------
-- Funcionalidades Relacionadas ao Menu de Diversos do SGAP--
-----------------------------------------------------------------------------------
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(20, 'Declaração.Declarar' ,dbo.trunc_date(getDate()),'Declaracao/actionDeclaracao.do?action=listDevolucaoPrincipal',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(21, 'Tesouraria.Desassociação de Caixa', dbo.trunc_date(getDate()), 'Caixa/actionManipuladorSessaoCaixa.do?action=listSessoesCaixa', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(22, 'Declaração.Declarações' ,dbo.trunc_date(getDate()),'Declaracao/actionDeclaracao.do?action=listDeclaracoesConferir',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(23,'Ferramentas.Exportar Arquivos OHL', dbo.trunc_date(getDate()), 'dadosOHL/actionExportarDadosOHL.do?action=listPracas', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(24, 'Declaração.Ajustar Transações de Sangria' ,dbo.trunc_date(getDate()),'Declaracao/actionDeclaracao.do?action=indexTransacoesSangrias',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(25, 'Declaração.Apuração de Resultados' ,dbo.trunc_date(getDate()),'Declaracao/actionDeclaracao.do?action=indexDeclaracaoAjuste',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(26, 'Declaração.Periodo' ,dbo.trunc_date(getDate()),'Periodo/actionPeriodo.do?action=indexPeriodo', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(27, 'Cupom.Retirada' ,dbo.trunc_date(getDate()),'Configuracao/actionRetiradaCupomParaVenda.do?action=indexRetiradaCupomParaVenda', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(28, 'Declaração.Ajuste de Compensação', dbo.trunc_date(getDate()), 'Declaracao/actionDeclaracao.do?action=indexCompensacaoAjuste', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(29, 'Ferramentas.Recálculo Sumário', dbo.trunc_date(getDate()), 'Sumario/actionRegistroRecalculoSumario.do?action=indexRegistroRecalculoSumario', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(30, 'Receita.Nota Débito Crédito.Consulta' ,dbo.trunc_date(getDate()),'NotaDebitoCredito/actionNotaDebitoCredito.do?action=listNotaDebitoCreditos',0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(31, 'Receita.Nota Débito Crédito.Estorno' ,dbo.trunc_date(getDate()),'NotaDebitoCredito/actionNotaDebitoCredito.do?action=estornoNotaDebitoCreditos',0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(32, 'Receita.Nota Débito Crédito.Registro Manual' ,dbo.trunc_date(getDate()),'NotaDebitoCredito/actionNotaDebitoCredito.do?action=formRegistroManualNotaDebitoCredito',0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(33, 'Receita.Nota Débito Crédito', dbo.trunc_date(getDate()), 'NotaDebitoCredito/actionNotaDebitoCredito.do?action=indexNotaDebitoCreditos', 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(34, 'Configuração.Alterar Senha do CV', dbo.trunc_date(getDate()), '/Configuracao/actionAlteracaoSenhaCV.do?action=formAlteraSenhaCV', 1);

----------------------------------------------------------------
-- Funcionalidades Relacionadas ao Menu de Tesouraria do SGAP --
----------------------------------------------------------------
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos,acessivel) values(50, 'Tesouraria.Malotes.Registro de Envio' ,dbo.trunc_date(getDate()),'Malote/actionMalote.do?action=formRegistroEnvioMalote',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos,acessivel) values(52, 'Tesouraria.Caixa',dbo.trunc_date(getDate()),'Caixa/actionCaixa.do?action=indexCaixa', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos,acessivel) values(53, 'Tesouraria.Fechamento Forçado',dbo.trunc_date(getDate()),'Caixa/actionFechamentoForcado.do?action=formFechamentoForcado',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos,acessivel) values(54, 'Tesouraria.Malotes.Registro de Depósito' ,dbo.trunc_date(getDate()),'Malote/actionMalote.do?action=indexDepositoMalotes',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos,acessivel) values(55, 'Tesouraria.Malotes.Substituição de Malotes' ,dbo.trunc_date(getDate()),'Malote/actionMalote.do?action=indexSubstituicaoMalotes',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos,acessivel) values(56, 'Tesouraria.Malotes.Ajuste de Valor de Depósito' ,dbo.trunc_date(getDate()),'Malote/actionMalote.do?action=indexAjusteValorDepositoMalotes',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos,acessivel) values(57, 'Tesouraria.Malotes.Ajuste de Data de Depósito' ,dbo.trunc_date(getDate()),'Malote/actionMalote.do?action=indexAjusteDataDepositoMalotes',1);

-------------------------------------------------------------
-- Funcionalidades Relacionadas ao Menu de Receita do SGAP --
-------------------------------------------------------------
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(60, 'Receita.Transações.Correção Definitiva' ,dbo.trunc_date(getDate()),'Transacao/actionCorrecaoTransacao.do?action=correcaoTransacaoDefinitiva',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(61, 'Receita.Transações.Revisão' ,dbo.trunc_date(getDate()),'Transacao/actionCorrecaoTransacao.do?action=revisaoTransacao',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(62, 'Receita.Transações.Verificação' ,dbo.trunc_date(getDate()),'Transacao/actionCorrecaoTransacao.do?action=verificacaoTransacao',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(63, 'Receita.Completude.Processamento de Arquivo' ,dbo.trunc_date(getDate()),'Transacao/actionProcessamentoArquivo.do?action=indexProcessamentoArquivo',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(64, 'Receita.Completude.Mensagens Não Processadas',dbo.trunc_date(getDate()),'Transacao/actionBufferMensagem.do?action=indexBufferMensagem',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(65, 'Receita.Completude.Atualização' ,dbo.trunc_date(getDate()),'Transacao/actionBufferMensagem.do?action=indexAtualizacao', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(66, 'Receita.Completude.Instâncias' ,dbo.trunc_date(getDate()),'Transacao/actionBufferMensagem.do?action=indexMudancaInstancia', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(67, 'Receita.Completude.Lacunas' ,dbo.trunc_date(getDate()),'Transacao/actionBufferMensagem.do?action=indexLacunas', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(68, 'Receita.Registro de Falhas' ,dbo.trunc_date(getDate()),'Falha/actionRegistroDeFalha.do?action=indexRegistrodeFalha', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(69, 'Configuração.Cupons' ,dbo.trunc_date(getDate()),'Configuracao/actionCupom.do?action=listCupom',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(70, 'Receita.Recebimento.Dívida de Operadores', dbo.trunc_date(getDate()),'Recebimento/actionDividasOperadores.do?action=indexRecebimentoDividaOperadores',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(71, 'Receita.Recebimento.Dividas de Operadores', dbo.trunc_date(getDate()), null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(72, 'Receita.Completude.Sumário de Mensagens Não Processadas', dbo.trunc_date(getDate()), 'Transacao/actionBufferMensagem.do?action=listSumarioBufferMensagem', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(73, 'Receita.Transações.Desassociação de Pistas', dbo.trunc_date(getDate()), 'Transacao/actionCorrecaoTransacao.do?action=operadoresLogadosList', '1');
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(74, 'Receita.Recebimento.Pagamentos Diversos', dbo.trunc_date(getDate()),'Recebimento/actionPagamentosDiversos.do?action=indexRecebimentoPagamentosDiversos',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(75, 'Receita.Recebimento.Transações', dbo.trunc_date(getDate()),'Recebimento/actionTransacoes.do?action=indexRecebimentoTransacoes',1);
Insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) Values(76, 'Receita.Transações.Verificação de Ocorrências de Pista', dbo.trunc_date(getDate()), 'Ocorrencia/actionOcorrencia.do?action=indexOcorrenciaPista', 1);
Insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) Values(77, 'Receita.Transações.Verificação de Transações Normais', dbo.trunc_date(getDate()), 'Transacao/actionTransacao.do?action=indexTransacaoNormal', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(78, 'Receita.Transações.Alocação de Responsável por Pista', dbo.trunc_date(getDate()), 'Transacao/actionAlocacaoPista.do?action=indexAlocacaoPista', 1);
Insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) Values(79, 'Receita.Transações.Excesso de Velocidade', dbo.trunc_date(getDate()), 'Transacao/transacaoVelocidade.do?action=indexTransacaoVelocidade', 1);

-----------------------------------------------------------------
-- Funcionalidades Relacionadas ao Menu de Ferramentas do SGAP --
-----------------------------------------------------------------
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(80, 'Ferramentas.Auditoria.Configuração' ,dbo.trunc_date(getDate()),'TrilhaAuditoria/actionTrilhaAuditoria.do?action=indexTrilhaAuditoriaConfiguracao',0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(81, 'Ferramentas.Auditoria' ,dbo.trunc_date(getDate()),'TrilhaAuditoria/actionTrilhaAuditoria.do?action=indexTrilhaAuditoria',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(82, 'Ferramentas.Relatórios' ,dbo.trunc_date(getDate()), 'Relatorio/actionRelatorio.do?action=listRelatorios',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(83, 'Ferramentas.Ocorrências' ,dbo.trunc_date(getDate()), 'Ocorrencia/actionProcessoOcorrencia.do?action=indexProcessosOcorrencia',1);

-----------------------------------------------------------------------------------
-- Funcionalidades Relacionadas a diversos Menus do SGAP--
-----------------------------------------------------------------------------------
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(84, 'Cupom.Ajuste',dbo.trunc_date(getDate()),'Configuracao/actionAjusteRetiradaCupons.do?action=indexAjusteRetiradaCupons',null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(85, 'Cupom.Compensação', dbo.trunc_date(getDate()), '/Configuracao/actionSumarioCupons.do?action=listSumarioCupons', null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(86, 'Configuração.Isentos.Configuração Usuário Local',dbo.trunc_date(getDate()), 'Isento/actionUsuarioLocal.do?action=indexUsuarioLocal', null, 1); 
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(87, 'Configuração.Isentos.Carregar Arquivo ARTESP',dbo.trunc_date(getDate()),'Isento/actionVeiculoIsento.do?action=indexProcessamentoCadastro', null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(88, 'Configuração.Historico de Cadastros', dbo.trunc_date(getDate()), 'ConfiguracaoInterop/actionHistoricoCadastro.do?action=indexHistoricoCadastro', null,  1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(89, 'Configuração.Isentos.Carregar Arquivo Isento Edital',dbo.trunc_date(getDate()),'Isento/actionVeiculoIsento.do?action=indexProcessamentoCadastroEdital',null,1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(90, 'Receita.Transações.Correção Definitiva.Corrigir Todas', dbo.trunc_date(getDate()), NULL, NULL, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(92, 'Receita.Transações.Visualização Fotos Falhas', dbo.trunc_date(getDate()),'Transacao/actionCorrecaoTransacao.do?action=visualizacaoImagensFalhas', null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(93, 'Interoperabilidade.Cadastros.Recebimento de Cadastros Completos', dbo.trunc_date(getDate()), 'RecebimentoCadastro/actionRecebimentoCadastro.do?action=listRecebimentoCadastroListaFull', null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(94, 'Configuração.Reverter Senha', dbo.trunc_date(getDate()), 'Configuracao/actionOperador.do?action=indexReverterSenha', null, 1);
insert into Funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(95, 'Interoperabilidade.Transações.Inserção Manual', dbo.trunc_date(getDate()), '/Transacao/actionInsercaoManual.do?action=indexInsercaoManual', null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(96, 'Interoperabilidade.Configurações.Feriado Bancário', dbo.trunc_date(getDate()), 'ConfiguracaoInterop/actionFeriadoBancario.do?action=indexFeriadoBancario', null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(97, 'Configuração.Pré Correção',dbo.trunc_date(getDate()),'Configuracao/actionConfiguracaoPreCorrecao.do?action=indexConfiguracaoPreCorrecao',null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(98, 'Receita.Transações.Pré Correção',dbo.trunc_date(getDate()),'Transacao/actionCorrecaoTransacao.do?action=indexPreCorrecao',null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(101, 'Ferramentas.Exportação de Transações para Auditoria',dbo.trunc_date(getDate()),'Transacao/actionArquivoTransacao.do?action=indexArquivoTransacao',null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(102, 'Apagar Arquivos de Transações para Auditoria', dbo.trunc_date(getDate()),null,null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(103, 'Configuração.Notificação de Eventos',dbo.trunc_date(getDate()),'Transacao/actionNotificacaoEventos.do?action=indexNotificacaoEventos',null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(104, 'Interoperabilidade.Protocolos.Registro de Pagamento', dbo.trunc_date(getDate()), 'RegistroRecebimentoPagtoLotes/actionRegistroRecebimentoPagtoLotes.do?action=indexRecebimentoPagtoLotes', null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(105, 'Configuração.Usuários.Tipos de Organização',dbo.trunc_date(getDate()),'Contas/actionTipoOrganizacao.do?action=indexTipoOrganizacao',NULL,1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(106, 'Configuração.Usuários.Departamentos',dbo.trunc_date(getDate()),'Contas/actionDepartamento.do?action=indexDepartamento',NULL,1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(107, 'Configuração.Usuários.Divisões',dbo.trunc_date(getDate()),'Contas/actionDivisao.do?action=indexDivisao',NULL,1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(108, 'Configuração.Usuários.Qualificações',dbo.trunc_date(getDate()),'Contas/actionQualificacao.do?action=indexQualificacao',NULL,1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) Values(109, 'Configuração.Usuários.Contas Crédito Concedido',dbo.trunc_date(getDate()),'Contas/actionContas.do?action=indexContas',NULL,1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(110, 'Configuração.Usuários.Contas Isentas',dbo.trunc_date(getDate()),'Contas/actionContas.do?action=indexRevisaoContas',NULL,1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(111, 'Configuração.Usuários.Aprovar Contas',dbo.trunc_date(getDate()),NULL,NULL,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(112, 'Configuração.Usuários.Reprovar Contas',dbo.trunc_date(getDate()),NULL,NULL,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(113, 'Configuração.Usuários.Solicitar Encerramento',dbo.trunc_date(getDate()),NULL,NULL,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(114, 'Configuração.Usuários.Encerrar Contas',dbo.trunc_date(getDate()),NULL,NULL,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(115, 'Configuração.Usuários.Cancelar Solicitação de Encerramento',dbo.trunc_date(getDate()),NULL,NULL,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(117, 'Configuração.LPR.Parâmetros de Aquisição de Imagens', dbo.trunc_date(getDate()), 'Configuracao/actionCfgLPR.do?action=indexCfgLPR', NULL, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(118, 'Configuração.Usuários.Histórico Tag', dbo.trunc_date(getDate()), '/Contas/actionHistoricoTag.do?action=indexHistoricoTag', NULL, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(119, 'Configuração.Motivos de Impressão',  dbo.trunc_date(getDate()),'Configuracao/actionMotivoImpressao.do?action=indexMotivoImpressao', NULL, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(120, 'Reimpressão do Recibo de Transação', dbo.trunc_date(getDate()), null, NULL, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(121, 'Reimpressão do Voucher de Não Pagante', dbo.trunc_date(getDate()), null, NULL, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(122, 'Ferramentas.Exportação de Arquivos para ERP', dbo.trunc_date(getDate()), 'Configuracao/actionExportacaoArquivoERP.do?action=indexPeriodo', NULL, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(123, 'Configuração.Desconto por Intervalo de Tempo',dbo.trunc_date(getDate()),'Configuracao/actionDescontoIntervaloTempo.do?action=indexDescontoIntervaloTempo',null,1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(124, 'Receita.Transações.Inserção Manual por Meio de Pagamento', dbo.trunc_date(getDate()), 'Transacao/actionInsercaoManualMeioPagamento.do?action=indexInsercaoManualMeioPagamento', null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(126, 'Ferramentas.Sinótico de Pistas', dbo.trunc_date(getDate()), 'Sinotico/actionSinoticoPistas.do?action=sinoticoPistas', null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(127, 'Configuração.Categorias', dbo.trunc_date(getDate()),'Configuracao/actionConfiguracaoCategorias.do?action=carregaPaginaPrincipal',null,1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(128, 'Configuração.Configuração de Pista' , dbo.trunc_date(getDate()),'Configuracao/actionConfiguracaoPista.do?action=sessaoList', null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(129, 'Configuração.Envio de e-mail.Etapas de Interoperação' , dbo.trunc_date(getDate()),'Interoperabilidade/actionEmailEtapaInteroperacao.do?action=indexEmail', null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(130, 'Configuração.Envio de e-mail.Cadastros CGMP desatualizados' , dbo.trunc_date(getDate()),'Interoperabilidade/actionEmailEtapaInteroperacao.do?action=indexEmailAtualizacao', null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(131, 'Configuração.Envio de e-mail.Acompanhamento VDA' , dbo.trunc_date(getDate()),'Configuracao/actionEmailAcompanhamentoVDA.do?action=indexEmail', null, 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(132, 'Interoperabilidade.Desconto Manutenção.Recebimento de Arquivos', dbo.trunc_date(getDate()), '/Interoperabilidade/actionRecebimentoDescManut.do?action=listRecebimentoDescManut', NULL, 1); 
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(133, 'Interoperabilidade.Desconto Manutenção.Configuração', dbo.trunc_date(getDate()), '/Interoperabilidade/actionConfiguracaoDescManut.do?action=formConfiguracaoDescManut', NULL, 1); 

---------------------------------------------------------
-- Funcionalidades Relacionadas aos Relatórios do SGAP --
---------------------------------------------------------
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1001, 'Relatório-Ajuste de Declarações', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1002, 'Relatório-Analítico de Correção de Transações', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1003, 'Relatório-Analítico de Cupons Recebidos', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1004, 'Relatório-Lançamentos no Caixa', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1005, 'Relatório-Custódia', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1006, 'Relatório-Analítico de Venda de Cupons', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1007, 'Relatório-Consolidação de Declaração de Arrecadador', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1008, 'Relatório-Consolidação de Declaração de Supervisor', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1009, 'Relatório-Consolidação de Declaração de Responsável por Pista', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1010, 'Relatório-Arrecadação Mensal', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1011, 'Relatório-Compensação de Cupons', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1012, 'Relatório-Consolidação de Declaração de Coletor de Sangria', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1013, 'Relatório-Consolidação de Vendedor de Cupons', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1014, 'Relatório-Controle de Abonos', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1015, 'Relatório-Demanda Média Diária', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1016, 'Relatório-Desempenho Operacional Arrecadador', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1017, 'Relatório-Falhas', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1018, 'Relatório-Lançamentos da Área - Detalhado', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1019, 'Relatório-Lançamentos da Área - Sintético', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1020, 'Relatório-Melhor Hora do Arrecadador', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1021, 'Relatório-Reconciliação da Declaração - Coletor de Sangria', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1022, 'Relatório-Reconciliação da Declaração - Vendedor de Cupons', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1023, 'Relatório-Tempo Médio de Atendimento - Analítico', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1024, 'Relatório-Transações AVI com Categoria Discrepante', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1025, 'Relatório-Trilha de Auditoria', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1026, 'Relatório-Consolidação de Venda de Cupons', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1027, 'Relatório-Dívidas de Operadores', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1028, 'Relatório-Violações', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1029, 'Relatório-Consolidação de Declaração de Tesoureiro', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1030, 'Relatório-Demonstrativo Financeiro da Arrecadação', dbo.trunc_date(getDate()), null, null, 0);
Insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1031, 'Relatório-Receita e Tráfego', dbo.trunc_date(getDate()), NULL, NULL, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1032, 'Relatório-Reconciliação da Arrecadação - Responsável por Pista', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1033, 'Relatório-Reconciliação da Arrecadação - Supervisor', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1034, 'Relatório-Reconciliação da Arrecadação - Vendedor de Cupons', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1035, 'Relatório-Malotes', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1036, 'Relatório-Reconciliação da Arrecadação - Coletor de Sangria', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1037, 'Relatório-Arrecadação Horária', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1038, 'Relatório-Arrecadação Diária', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1039, 'Relatório-Reconciliação da Arrecadação - Arrecadador', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1040, 'Relatório-Arrecadação por Categoria e Meio de Pagamento', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1041, 'Relatório-Reconciliação da Declaração - operador do PDV', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1042, 'Relatório-Usuario Local', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1043, 'Relatório-Detalhes de Lotes', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1044, 'Relatório-Fluxo de Caixa Por Lote', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1045, 'Relatório-Consolidação Diária de Isentos', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1046, 'Relatório-Veículos Isentos', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1047, 'Relatório-Reconciliação da Declaração - Arrecadador', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1048, 'Relatório-Reconciliação da Declaração - Supervisor', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1049, 'Relatório-Reconciliação da Declaração - Responsável por Pista', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1050, 'Relatório-Usuario Local - Primeira Passagem', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1051, 'Relatório-Consolidação de Declaração de Operador de PDV', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1052, 'Relatório-Composição Malotada', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1053, 'Relatório-Cadastro de Isentos', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1054, 'Relatório-Cadastro de Operadores', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1055, 'Relatório-Histórico de Interoperabilidade CGMP', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1056, 'Relatório-Detalhado de Passagens CGMP', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1057, 'Relatório-Histórico de Controle de Troco', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1058, 'Relatório-Detalhado de Passagens SGMP', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1059, 'Relatório-Passagem de Veículos por Categoria e Meio de Pagamento', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1060, 'Relatório-Horário de Passagens de Veículos por Meio de Pagamento', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1061, 'Relatório-Saldo Instantâneo do Caixa', dbo.trunc_date(getDate()), null, null, 0);
--1062, Recibo de Declaração - Não tem funcionalidade é direto da interface
--1063, Recibo de Sangria - Não tem funcionalidade é direto da interface
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1064, 'Relatório-Termo de Reconhecimento de Dívida', dbo.trunc_date(getDate()), null, null, 0);
--1065, Talão de Depósito Bancário - Não tem funcionalidade é direto da interface
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1066, 'Relatório-Voucher de Isento Posto', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1067, 'Relatório-Detalhado de Passagens CC-Rio', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1068, 'Relatório-Fluxo de Caixa por Data', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1069, 'Relatório-Log de Eventos da Interoperação', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1070, 'Relatório-Estatístico Horário Por Categoria', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1071, 'Relatório-Resumo Mensal do Movimento de Tráfego e Arrecadação', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1072, 'Relatório-Tráfego por Categoria - Horário', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1073, 'Relatório-Tráfego por Categoria - Diário', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1074, 'Relatório-Tráfego por Categoria - Mensal', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1075, 'Relatório-Transações AVI em Pista Manual', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1076, 'Relatório-Analítico de Transações Manuais AVI', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1077, 'Relatório-Detalhado de Passagens Visa Vale Pedágio', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1078, 'Relatório-Dívidas de Operadores Extrato', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1079, 'Relatório-Usuario Local - Resumo', dbo.trunc_date(getDate()), null, null, 0);
--1080 Relatório de violações - Não tem funcionalidade é direto da interface
--1081 Relatório da Verificação de Transações - Não tem funcionalidade é direto da interface
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1082, 'Relatório-Fechamento Econômico Financeiro', dbo.trunc_date(getDate()), NULL, NULL, 0); 
--insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1083, 'Relatório-Relatório de ISPM por Tempo', dbo.trunc_date(getDate()), null, null, 0); --nao implementado
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1084, 'Relatório-Termo de Reconhecimento de Dívidas por Período', dbo.trunc_date(getDate()), null, null, 0);
--1085 Relatório de Informações da Transação - Não tem funcionalidade é direto da interface
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1086, 'Relatório-Detalhado de Passagens de Veículos Isentos - Manual', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1087, 'Relatório-Detalhado de Passagens de Veículos Isentos - AVI', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1088, 'Relatório-Histórico de Cadastros de Pista', dbo.trunc_date(getDate()), null, null, 0);
--relatorios legados da rota
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1098, 'Relatório-Detalhes de Recebimento de Lotes', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1099, 'Relatório-Aquisições de Placas com LPR', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1100, 'Relatório-Recibo de Pagamento de Transações', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1101, 'Relatório-Voucher de Não Pagantes', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1102, 'Relatório-Histórico de Alocação de Mídias a Veículos Isentos', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1103, 'Relatório-Cadastro de Usuários Isentos', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1104, 'Relatório-Passagens de Isento por Conta', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1105, 'Relatório-Fluxo de Caixa por Fonte do Repasse', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1106, 'Relatório-Ocorrências no Corredor de Motos', dbo.trunc_date(getDate()), NULL, NULL, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1107, 'Relatório-Analítico de Passagens de Veículos Em Pista Extra Larga', dbo.trunc_date(getDate()), NULL, NULL, 0);
Insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1108, 'Relatório-Detalhado de Passagens SmartCard', dbo.trunc_date(getDate()), NULL, NULL,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1109, 'Relatório-Movimentação Diária de Tráfego Automático - CGMP (MDT-AUTO)', dbo.trunc_date(getDate()), NULL, NULL, 0);
Insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1110, 'Relatório-Detalhado de Recargas SmartCard', dbo.trunc_date(getDate()), NULL, NULL,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1111, 'Relatório-Sintético de Cupons Recebidos', dbo.trunc_date(getDate()), NULL, NULL, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1112, 'Relatório-Detalhado de Passagens DBTrans', dbo.trunc_date(getDate()), NULL, NULL,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1113, 'Relatório-Detalhado de Lotes DBTrans', dbo.trunc_date(getDate()), NULL, NULL,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1114, 'Relatório-Passagens Compradas Vale Pedágio', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1115, 'Relatório-Passagens Realizadas Vale Pedágio', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1116, 'Relatório-Consolidado de Passagens Vale Pedágio', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1117, 'Relatório-Financeiro de Receita Manual', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1118, 'Relatório-Financeiro de Receita Automática', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1119, 'Relatório-Descontos Mensais', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1120, 'Relatório-Descontos Diários', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1121, 'Relatório-Descontos Horários', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1122, 'Relatório-Arrecadação Diária por Meio de Pagamento', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1123, 'Relatório-Arrecadação Mensal por Meio de Pagamento', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1124, 'Relatório-Histórico de Declarações', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1125, 'Relatório-Perfil de Desconto', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1126, 'Relatório-Mídias Atribuídas ao Controle de Desconto', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1127, 'Relatório-Histórico de Alocação de Mídias ao Controle de Descontos', dbo.trunc_date(getDate()), NULL, NULL, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1128, 'Relatório-Análise de Perfis de Descontos', dbo.trunc_date(getDate()), NULL, NULL, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1129, 'Relatório-Passagens com Desconto', dbo.trunc_date(getDate()), NULL, NULL, 0);
--1130, Relatório de Tarifas - Não tem funcionalidade é direto da interface
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1131, 'Relatório-Histórico de Importação de Arquivos de Depósito de Malotes', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1132, 'Relatório-Cadastro de Usuários Credit Granted', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1133, 'Relatório-Passagens Credit Granted por Conta', dbo.trunc_date(getDate()), NULL, NULL, 0);
--insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1134, 'Relatório-Analítico de Cupons Classificados', dbo.trunc_date(getDate()), NULL, NULL, 0); -- nao implementado
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1135, 'Relatório-Fatura de Credit Granted', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1136, 'Relatório-Acompanhamento de Dívidas de Operadores', DBO.TRUNC_DATE(GETDATE()), NULL, NULL, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1137, 'Relatório-Reconciliação AVC/SA',dbo.trunc_date(getDate()),null,null,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1138, 'Relatório-Não Pagantes', dbo.trunc_date(getDate()), null, null, 0); 
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1139, 'Relatório-Mensal de Passagens por Meio de Pagamento', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1140, 'Relatório-Diário de Passagens por Meio de Pagamento', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1141, 'Relatório-Transferência de Caixa', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1142, 'Relatório-Ocorrências de Pista', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1143, 'Relatório-Dívidas e Quitações - Arrecadador', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1144, 'Relatório-Dívidas e Quitações - Supervisor', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1145, 'Relatório-Dívidas e Quitações - Responsável por Pista', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1146, 'Relatório-Dívidas e Quitações - Vendedor de Cupons', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1147, 'Relatório-Dívidas e Quitações - Coletor de Sangria', dbo.trunc_date(getDate()), null, null, 0);
--1148, Relatório do Cadastro de Categorias - Não tem funcionalidade é direto da interface
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1149, 'Relatório-Sintético de Cupons DBTRANS',dbo.trunc_date(getDate()), null, null,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1150, 'Relatório-Verificação de Passagens com Desconto CGMP',  dbo.trunc_date(getDate()), NULL, NULL, 0); 
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1151, 'Relatório-Compreensivo Não Consolidado', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1152, 'Relatório-Pagamentos Diversos',dbo.trunc_date(getDate()),null,null,0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1153, 'Relatório-Geral CGMP',  dbo.trunc_date(getDate()), NULL, NULL, 0); 
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1154, 'Relatório-Substituição CGMP', dbo.trunc_date(getDate()), NULL, NULL, 0); 
--1155, Recibo de Pagamento Diverso - Não tem funcionalidade é direto da interface
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1156, 'Relatório-Detalhado de Passagens Múltiplas', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1157, 'Relatório-Resumo Financeiro de Passagens Múltiplas', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1158, 'Relatório-Exceções de Passagens Múltiplas', dbo.trunc_date(getDate()), null, null, 0);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1159, 'Relatório-Demonstrativo Contábil', dbo.trunc_date(getDate()), null, null, 0);
--insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1161, 'Relatório-Demonstrativo de Receitas AVI', dbo.trunc_date(getDate()), null, null, 0); --nao implementado
--insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1162, 'Relatório-Estatístico de Correção', dbo.trunc_date(getDate()), null, null, 0); --nao implementado
--insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1163, 'Relatório-Rastreamento de Transações CGMP', dbo.trunc_date(getDate()), null, null, 0); --nao implementado
--insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values(1164, 'Relatório-Transação com Excesso de Velocidade', dbo.trunc_date(getDate()), null, null, 0); --nao implementado
insert into funcionalidade (idfuncionalidade, descricao, datainsercao, metodos, caminhomenu, acessivel) values (1165, 'Relatório-Recargas em Pista', dbo.trunc_date(getDate()), null, null, 0);

------------------------------------------------------------------------
-- Funcionalidades Relacionadas ao Menu de Interoperabilidade do SGAP --
------------------------------------------------------------------------
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3000, 'Interoperabilidade.Cadastros.Recebimento de Cadastros',dbo.trunc_date(getDate()),'RecebimentoCadastro/actionRecebimentoCadastro.do?action=listCadastros',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3001, 'Interoperabilidade.Configurações.Meio de Pagamento',dbo.trunc_date(getDate()),'ConfiguracaoInterop/actionConfiguracaoInterop.do?action=listConfiguracoesInterop',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3002, 'Interoperabilidade.Cadastros.Visualização de Recebimento', dbo.trunc_date(getDate()),'VisualizaRecebimentoCadastro/actionVisualizaRecebimentoCadastro.do?action=listVisualizaRecebimentoCadastros',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3003, 'Interoperabilidade.Transações.Manipulação de Transações',dbo.trunc_date(getDate()),'ManipulacaoTransacoes/actionManipulacaoTransacoes.do?action=listManipulacaoTransacoes',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3004, 'Interoperabilidade.Lotes.Geração de Lotes',dbo.trunc_date(getDate()),'GeracaoLotes/actionGeracaoLotes.do?action=listGeracaoLotes',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3005, 'Interoperabilidade.Lotes.Manipulação de Lotes',dbo.trunc_date(getDate()),'ManipulacaoLotes/actionManipulacaoLotes.do?action=listManipulacaoLotes',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3006, 'Interoperabilidade.Protocolos.Recebimento de Protocolo',dbo.trunc_date(getDate()),'RecebimentoProtocolo/actionRecebimentoProtocolo.do?action=listRecebimentoProtocolos',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3007, 'Interoperabilidade.Lotes.Visualização de Lotes',dbo.trunc_date(getDate()),'VisualizacaoLotes/actionVisualizacaoLotes.do?action=listVisualizacaoLotes',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3009, 'Interoperabilidade.Consultar Midia',dbo.trunc_date(getDate()),'/ConfiguracaoInterop/actionConsultaTag.do?action=indexConsultaTag',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3010, 'Interoperabilidade.Visualização de Log de Eventos',dbo.trunc_date(getDate()),'LogEventosInteroperacao/actionLogEventosInteroperacao.do?action=indexLogEventosInteroperacao',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3011, 'Interoperabilidade.Tarifas.Manipulação de Arquivos', dbo.trunc_date(getDate()), 'ArquivosInterop/tarifaArquivoInterOp.do?action=listaArquivos', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3013, 'Interoperabilidade.Vale Pedágio.Recebimento de Passagens', dbo.trunc_date(getDate()), 'ValePedagio/actionValePedagio.do?action=listValePedagio', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3014, 'Interoperabilidade.Configurações.Configuração MensagensIT', dbo.trunc_date(getDate()), 'ConfiguracaoInterop/actionConfiguracaoMensagensIT.do?action=indexConfiguracaoMensagensIT', 1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3015, 'Interoperabilidade.Controle de Descontos.Perfis', dbo.trunc_date(getDate()), 'ControleDesconto/perfilDesconto.do?action=indexPerfilDesconto',1);
insert into funcionalidade(idfuncionalidade, descricao, datainsercao, metodos, acessivel) values(3016, 'Interoperabilidade.Controle de Descontos.Atribuir Perfis', dbo.trunc_date(getDate()), 'ControleDesconto/midiaPerfilDesconto.do?action=indexMidiaPerfilDesconto',1);

----------------------------
-- Funcionalidades Acesso --
----------------------------
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (1,'Configuracao/actionOperador.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (1,'/Configuracao/actionCargo.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (1,'/Configuracao/actionPerfil.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (2,'Configuracao/actionProgramacaoTarifa.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3,'Configuracao/actionHorarioVerao.do',0,null);
--4 nao tem
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (5,'Configuracao/actionConfiguracaoArrecadacao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (6,'Configuracao/actionContaBanco.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (7,'Configuracao/actionTransportadora.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (8,'Configuracao/actionClasseTarifa.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (9,'Caixa/Configuracao/actionPacote.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (10,'Caixa/Configuracao/actionAgrupamento.do',0,null);
--11 nao tem
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (12,'Caixa/Configuracao/actionArea.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (13,'Caixa/Configuracao/actionDenominacao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (14,'Configuracao/actionEmissorCupom.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (15,'Cheque/actionCheque.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (15, '/Transacao/actionCancelamentoTransacao.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (15, '/Malote/actionMalote.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (15, '/Transacao/actionBufferMensagem.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (16,'Isento/actionVeiculoIsento.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (17,'Isento/actionTipoDeIsento.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (19,'Configuracao/actionConfiguracaoSistema.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (19,'/Configuracao/actionPista.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (20,'Declaracao/actionDeclaracao.do',0,null);
insert into FuncionalidadesAcesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (20,'Declaracao/actionDevolucaoTrocoExplicita.do',0,NULL);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (21,'Caixa/actionManipuladorSessaoCaixa.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (22,'Declaracao/actionDeclaracao.do',0,null);
--23 incluir qdo tiver ohl 
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (24,'Declaracao/actionDeclaracao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (25,'Declaracao/actionDeclaracao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (26,'Periodo/actionPeriodo.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (27,'Configuracao/actionRetiradaCupomParaVenda.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (28,'Declaracao/actionDeclaracao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (29,'Sumario/actionRegistroRecalculoSumario.do',0,null);
--30a32 --incluir qdo necessário
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (33,'NotaDebitoCredito/actionNotaDebitoCredito.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (34,'/Configuracao/actionAlteracaoSenhaCV.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (50,'Malote/actionMalote.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (50,'/Transacao/actionBufferMensagem.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (50,'/Transacao/actionCancelamentoTransacao.do', 0, null);
--51 nao tem
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'Caixa/actionCaixa.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionLancamentos.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionAbertura.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionEntregaTroco.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionFormacaoAgrupamentos.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionDesagrupar.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionReconstituicaoTroco.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionCompactacaoPacotes.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionDescompactacaoPacotes.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionAjusteArea.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionTrocaAreas.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionTrocaExterna.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionMalotes.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionAporte.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionSaldos.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionRecebimentoValoresApropriaveis.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (52,'/Caixa/actionAjusteEntregaTroco.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (53,'Caixa/actionFechamentoForcado.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (54,'/Transacao/actionBufferMensagem.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (54,'/Transacao/actionCancelamentoTransacao.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (54,'Malote/actionMalote.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (55,'Malote/actionMalote.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (55,'/Transacao/actionBufferMensagem.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (55,'/Transacao/actionCancelamentoTransacao.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (56,'/Transacao/actionCancelamentoTransacao.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (56,'Malote/actionMalote.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (56,'/Transacao/actionBufferMensagem.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (57,'/Transacao/actionBufferMensagem.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (57,'/Transacao/actionCancelamentoTransacao.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (57,'Malote/actionMalote.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (60,'Transacao/actionCorrecaoTransacao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (60,'/Sumario/actionRegistroRecalculoSumario.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (60,'/Transacao/actionBufferMensagem.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (60,'/Transacao/actionProcessamentoArquivo.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (60,'/Transacao/actionInsercaoManual.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (61,'Transacao/actionCorrecaoTransacao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (62,'Transacao/actionCorrecaoTransacao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (62,'/Sumario/actionRegistroRecalculoSumario.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (62,'/Transacao/actionBufferMensagem.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (62,'/Transacao/actionProcessamentoArquivo.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (62,'/Transacao/actionInsercaoManual.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (63,'Transacao/actionProcessamentoArquivo.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (64,'Transacao/actionBufferMensagem.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (65,'Transacao/actionBufferMensagem.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (66,'Transacao/actionBufferMensagem.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (67,'Transacao/actionBufferMensagem.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (68,'Falha/actionRegistroDeFalha.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (69,'Configuracao/actionCupom.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (70,'Recebimento/actionDividasOperadores.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (72,'Transacao/actionBufferMensagem.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (73,'Transacao/actionCorrecaoTransacao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (74,'Recebimento/actionPagamentosDiversos.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (75,'Recebimento/actionTransacoes.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (76,'Ocorrencia/actionOcorrencia.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (77,'Transacao/actionTransacao.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (78,'Transacao/actionAlocacaoPista.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (79,'Transacao/transacaoVelocidade.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (79,'Transacao/actionTransacao.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (80,'TrilhaAuditoria/actionTrilhaAuditoria.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (81,'TrilhaAuditoria/actionTrilhaAuditoria.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (82,'Relatorio/actionRelatorio.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (83,'Ocorrencia/actionProcessoOcorrencia.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (83, 'Ocorrencia/actionRegistroOcorrencia.do', 0, null);
insert into FuncionalidadesAcesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (84, 'Configuracao/actionAjusteRetiradaCupons.do', 0, null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (85,'/Configuracao/actionSumarioCupons.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (86,'Isento/actionUsuarioLocal.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (86,'Isento/actionVeiculoLocal.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (87,'Isento/actionVeiculoIsento.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (88,'ConfiguracaoInterop/actionHistoricoCadastro.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (89,'Isento/actionVeiculoIsento.do',0,null);
--90 é botao
--91 nao tem
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (92,'Transacao/actionCorrecaoTransacao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (93,'RecebimentoCadastro/actionRecebimentoCadastro.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (94,'Configuracao/actionOperador.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (95,'/Transacao/actionInsercaoManual.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (96,'ConfiguracaoInterop/actionFeriadoBancario.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (97,'/Configuracao/actionConfiguracaoPreCorrecao.do', 0, null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (97,'/Transacao/actionCorrecaoTransacao.do', 0, null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (97, '/Sumario/actionRegistroRecalculoSumario.do', 0, null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (97, '/Transacao/actionBufferMensagem.do', 0, null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (97, '/Transacao/actionProcessamentoArquivo.do', 0, null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (97, '/Transacao/actionInsercaoManual.do', 0, null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (97, '/Caixa/actionAjusteEntregaTroco.do', 0, null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (97, '/Caixa/actionConsultaTag.do', 0, null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (97,'Configuracao/actionConfiguracaoPreCorrecao.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (98,'Transacao/actionCorrecaoTransacao.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (98,'/Transacao/actionCorrecaoTransacao.do', 0, null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (98,'/Sumario/actionRegistroRecalculoSumario.do', 0, null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (98,'/Transacao/actionBufferMensagem.do', 0, null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (98,'/Transacao/actionInsercaoManual.do', 0, null);
--99 nao tem
--100 nao tem
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (101,'Transacao/actionArquivoTransacao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (103,'Transacao/actionNotificacaoEventos.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (104,'RegistroRecebimentoPagtoLotes/actionRegistroRecebimentoPagtoLotes.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (105,'Contas/actionTipoOrganizacao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (106,'Contas/actionDepartamento.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (107,'Contas/actionDivisao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (108,'Contas/actionQualificacao.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (109,'Contas/actionContas.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (110,'Contas/actionContas.do',0,null);
--111 a 115 é botao
--116 nao tem
--117 incluir qdo tiver lpr
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (118,'Contas/actionHistoricoTag.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (119,'Configuracao/actionMotivoImpressao.do',0,null);
--121
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (122,'Configuracao/actionExportacaoArquivoERP.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (123,'Configuracao/actionDescontoIntervaloTempo.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (124,'Transacao/actionInsercaoManualMeioPagamento.do',0,null);
--125 nao tem
--insert into FuncionalidadesAcesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (126, 'Sinotico/actionSinoticoPistas.do', 0, null);
--insert into FuncionalidadesAcesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (126, 'Transacao/actionCorrecaoTransacao.do', 0, null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (127,'Configuracao/actionConfiguracaoCategorias.do',0,null);
--insert into FuncionalidadesAcesso (IdFuncionalidade, Acesso, NivelPorMetodo, AcessoMetodo)values (127,'/Configuracao/actionProgramacaoTarifa.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (128,'Configuracao/actionConfiguracaoPista.do', 0, null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (129,'Interoperabilidade/actionEmailEtapaInteroperacao.do', 0, null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (130,'Interoperabilidade/actionEmailEtapaInteroperacao.do', 0, null);
--insert into FuncionalidadesAcesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (131, 'Configuracao/actionEmailAcompanhamentoVDA.do', 0 , null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (132, 'Interoperabilidade/actionRecebimentoDescManut.do', 0, NULL);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (133, 'Interoperabilidade/actionConfiguracaoDescManut.do', 0, NULL);

insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3000,'RecebimentoCadastro/actionRecebimentoCadastro.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3001,'ConfiguracaoInterop/actionConfiguracaoInterop.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3002,'VisualizaRecebimentoCadastro/actionVisualizaRecebimentoCadastro.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3003,'ManipulacaoTransacoes/actionManipulacaoTransacoes.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3003,'Transacao/actionCorrecaoTransacao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3004,'GeracaoLotes/actionGeracaoLotes.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3005,'ManipulacaoLotes/actionManipulacaoLotes.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3006,'RecebimentoProtocolo/actionRecebimentoProtocolo.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3007,'VisualizacaoLotes/actionVisualizacaoLotes.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3009,'/ConfiguracaoInterop/actionConsultaTag.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3010,'LogEventosInteroperacao/actionLogEventosInteroperacao.do',0,null);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3011,'ArquivosInterop/tarifaArquivoInterOp.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3013, 'ValePedagio/actionValePedagio.do', 0, NULL);
insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3014,'ConfiguracaoInterop/actionConfiguracaoMensagensIT.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3015,'ControleDesconto/perfilDesconto.do',0,null);
--insert into funcionalidadesacesso (idfuncionalidade, acesso, nivelpormetodo, acessometodo)values (3016,'ControleDesconto/midiaPerfilDesconto.do',0,null);

---------------------------------------------------------
-- Os Papéis com as suas Funcionalidades               --
---------------------------------------------------------
-- -12 sup
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0,-11, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0,-10, dbo.trunc_date(getDate()));
-- -9 sup
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, -8, dbo.trunc_date(getDate()));
-- -7 sup e resppista
-- -6 arrec e colsangria
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, -5, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, -4, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, -3, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, -2, dbo.trunc_date(getDate()));
-- -1 arrec
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 2, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3, dbo.trunc_date(getDate()));
--4 nao tem
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 5, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 6, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 7, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 8, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 9, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 10, dbo.trunc_date(getDate()));
--11 nao tem
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 12, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 13, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 14, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 15, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 16, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 17, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 18, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 19, dbo.trunc_date(getDate()));
--20--outros papeis
--21 tesour
--22--colsangria
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 23, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 24, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 25, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 26, dbo.trunc_date(getDate()));
--27 sup e tesour
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 28, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 29, dbo.trunc_date(getDate()));
--30a33
--34 arrec e colsangria
--50 tesour
--51 --nao tem
--52 tesour
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 53, dbo.trunc_date(getDate()));
--54 a 57tesour
--60 super
--61 super
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 62, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 63, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 64, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 65, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 66, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 67, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 68, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 69, dbo.trunc_date(getDate()));
--70 super
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 71, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 72, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 73, dbo.trunc_date(getDate()));
--74 super
--75 super
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 76, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 77, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 78, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 79, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 80, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 81, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 82, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 83, dbo.trunc_date(getDate()));
--84 super
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 85, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 86, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 87, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 88, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 89, dbo.trunc_date(getDate()));
--90 super
--91 nao tem
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 92, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 93, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 94, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 95, dbo.trunc_date(getDate()));
insert into PapelFuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 96, dbo.trunc_date(getDate()));
--insert into PapelFuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 97, dbo.trunc_date(getDate()));
--98 super e resppista
--99 nao tem
--100 nao tem
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 101, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 102, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 103, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 104, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 105, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 106, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 107, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 108, dbo.trunc_date(getDate()));
--109 
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 110, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 111, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 112, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 113, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 114, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 115, dbo.trunc_date(getDate()));
--116 nao tem
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 117, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 118, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 119, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 120, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 121, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 122, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 123, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 124, dbo.trunc_date(getDate()));
--125 nao tem
--126 --sup
--127 --manut
--128 --manut
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 129, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 130, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 131, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 132, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 133, dbo.trunc_date(getDate()));
 
------------------------------------------------------------
-- Papéis relacionado as Funcionalidades de Interoperação --
------------------------------------------------------------
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3000, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3001, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3002, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3003, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3004, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3005, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3006, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3007, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3009, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3010, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3011, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3013, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3014, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3015, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 3016, dbo.trunc_date(getDate()));

---------------------------------------------------------
-- Papéis relacionado as Funcionalidades de Relatórios --
---------------------------------------------------------
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1001, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1002, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1003, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1004, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1005, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1006, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1007, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1008, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1009, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1010, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1011, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1012, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1013, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1014, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1015, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1016, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1017, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1018, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1019, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1020, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1021, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1022, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1023, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1024, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1025, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1026, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1027, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1028, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1029, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1030, dbo.trunc_date(getDate()));
Insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1031, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1032, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1033, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1034, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1035, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1036, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1037, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1038, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1039, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1040, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1042, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1043, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1044, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1045, dbo.trunc_date(getDate()));
insert into PapelFuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1046, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1047, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1048, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1049, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1050, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1051, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1052, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1053, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1054, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1055, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1056, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1057, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1058, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1059, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1060, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1061, dbo.trunc_date(getDate()));
--1062 --na interface
--1063 --na interface
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1064, dbo.trunc_date(getDate()));
--1065 ----na interface
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1066, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1067, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1068, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1069, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1070, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1071, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1072, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1073, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1074, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1075, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1076, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1077, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1078, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1079, dbo.trunc_date(getDate()));
--1080 --na interface
--1081 --na interface
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1082, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1083, dbo.trunc_date(getDate()));--nao implementado
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1084, dbo.trunc_date(getDate()));
--1085 --na interface
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1086, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1087, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1088, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1098, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1099, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1100, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1101, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1102, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1103, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1104, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1105, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1106, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1107, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1108, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1109, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1110, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1111, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1112, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1113, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1114, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1115, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1116, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1117, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1118, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1119, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1120, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1121, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1122, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1123, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1124, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1125, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1126, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1127, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1128, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1129, dbo.trunc_date(getDate()));
--1130 na interface
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1131, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1132, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1133, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1134, dbo.trunc_date(getDate()));--nao implementado
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1135, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1136, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1137, dbo.trunc_date(getDate()));-- ok
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1138, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1139, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1140, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1141, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1142, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1143, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1144, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1145, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1146, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1147, dbo.trunc_date(getDate()));
--1148 --somente na tela de cadastro de categorias
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1149, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1150, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1151, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1152, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1153, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1154, dbo.trunc_date(getDate()));
--1155 --na interface
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1156, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1157, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1158, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1159, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1160, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1161, dbo.trunc_date(getDate()));--nao implementado
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1162, dbo.trunc_date(getDate()));--nao implementado
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1163, dbo.trunc_date(getDate()));--nao implementado
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1164, dbo.trunc_date(getDate()));--nao implementado
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(0, 1165, dbo.trunc_date(getDate()));

insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(1, -6, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(1, -1, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(1, 20, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(1, 34, dbo.trunc_date(getDate()));

insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(2, -6, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(2, 22, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(2, 34, dbo.trunc_date(getDate()));

insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3,-12, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, -9, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, -7, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 20, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 25, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 26, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 27, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 60, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 61, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 70, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 74, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 75, dbo.trunc_date(getDate()));
insert into PapelFuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 82, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 84, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 90, dbo.trunc_date(getDate()));
--insert into PapelFuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 98, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 126, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(3, 3009, dbo.trunc_date(getDate()));

insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(4, 21, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(4, 27, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(4, 50, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(4, 52, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(4, 54, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(4, 55, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(4, 56, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(4, 57, dbo.trunc_date(getDate()));

insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(5, 20, dbo.trunc_date(getDate()));

insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(9, -7, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(9, 20, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(9, 70, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(9, 74, dbo.trunc_date(getDate()));
insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(9, 75, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(9, 98, dbo.trunc_date(getDate()));

--papel manutenção (10)
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(10, 127, dbo.trunc_date(getDate()));
--insert into papelfuncionalidade(idpapel, idfuncionalidade, datainsercao) values(10, 128, dbo.trunc_date(getDate()));

--controle de acesso para o papel administrativo
insert into perfilpapelfunc(idpapel, idfuncionalidade, idperfil, datainsercao)values(0, 1, 0, dbo.trunc_date(getDate()));

--Configuração do Operador
insert into operador(idoperador, nome,idcargo, situacaocadastro, senhaadm, tentativasacesso, dataalteracaosenha, datainsercao) values(999999999, 'SuperUsuario Adm',0, 1, 'Oz9RPwXXUdhMjWUkI1EH9pSwtMVy2t.E', 0, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));

--Perfil do Operador
insert into perfiloperador(idperfil, idoperador, datainsercao) values(0, 999999999, dbo.trunc_date(getDate()));
insert into perfiloperador(idperfil, idoperador, datainsercao) values(1, 999999999, dbo.trunc_date(getDate()));
insert into perfiloperador(idperfil, idoperador, datainsercao) values(2, 999999999, dbo.trunc_date(getDate()));
insert into perfiloperador(idperfil, idoperador, datainsercao) values(3, 999999999, dbo.trunc_date(getDate()));
insert into perfiloperador(idperfil, idoperador, datainsercao) values(4, 999999999, dbo.trunc_date(getDate()));
insert into perfiloperador(idperfil, idoperador, datainsercao) values(5, 999999999, dbo.trunc_date(getDate()));
insert into perfiloperador(idperfil, idoperador, datainsercao) values(9, 999999999, dbo.trunc_date(getDate()));
--insert into perfiloperador(idperfil, idoperador, datainsercao) values(10, 999999999, dbo.trunc_date(getDate()));

--------------------------------------------
--  Descrição do Nome da Concessionária   --   
--------------------------------------------
insert into origem(idorigem, tipoorigem, descricao, datainsercao) values(0, 0, 'NA', dbo.trunc_date(getDate()));

																								--ALTERADO
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017, 'Concessionária Litoral Norte', null, null, null, null, 1, null, null, null, null, dbo.trunc_date(getDate()));

-- Configuração De Pracas e Pistas - P1
--Definição das Praças																			--ALTERADO
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao, flaglocaloperacao) values(760170053, 'Praça Principal', 53, null, null, null, 2, null, null, null, 76017, dbo.trunc_date(getDate()),1);

--Localizações																					--ALTERADO
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300, 'Principal', 53, 0, null, null, 3, null, null, null, 760170053, dbo.trunc_date(getDate()));

--Sentidos																						--ALTERADO
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300001, 'Salvador', 53, 0, null, 1, 6, null, null, null, 76017005300, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300002, 'Linha Verde', 53, 0, null, 2, 6, null, null, null, 76017005300, dbo.trunc_date(getDate()));

--Pistas da Praça P1																			--ALTERADO
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(7601700530001, '01', 53, 0, 1, null, 4, 1, null, 1, 76017005300, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(7601700530002, '02', 53, 0, 2, null, 4, 1, null, 2, 76017005300, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(7601700530003, '03', 53, 0, 3, null, 4, 1, null, 3, 76017005300, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(7601700530004, '04', 53, 0, 4, null, 4, 1, null, 4, 76017005300, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(7601700530005, '05', 53, 0, 5, null, 4, 1, null, 5, 76017005300, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(7601700530006, '06', 53, 0, 6, null, 4, 1, null, 6, 76017005300, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(7601700530007, '07', 53, 0, 7, null, 4, 1, null, 7, 76017005300, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(7601700530008, '08', 53, 0, 8, null, 4, 1, null, 8, 76017005300, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(7601700530009, '09', 53, 0, 9, null, 4, 1, null, 9, 76017005300, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(7601700530010, '10', 53, 0, 10, null, 4, 1, null, 10, 76017005300, dbo.trunc_date(getDate()));


-- Pista/Sentido 1 P1																			--ALTERADO
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300011, '01 SL', 53, 0, 1, 1, 5, 1, null, 1, 7601700530001, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300021, '02 SL', 53, 0, 2, 1, 5, 1, null, 2, 7601700530002, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300031, '03 SL', 53, 0, 3, 1, 5, 1, null, 3, 7601700530003, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300041, '04 SL', 53, 0, 4, 1, 5, 1, null, 4, 7601700530004, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300051, '05 SL', 53, 0, 5, 1, 5, 1, null, 5, 7601700530005, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300061, '06 SL', 53, 0, 6, 1, 5, 1, null, 6, 7601700530006, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300071, '07 SL', 53, 0, 7, 1, 5, 1, null, 7, 7601700530007, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300101, '10 SL', 53, 0, 10, 1, 5, 1, null, 10, 7601700530010, dbo.trunc_date(getDate()));

-- Pista/Sentido 2 P1																			--ALTERADO
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300032, '03 LV', 53, 0, 3, 2, 5, 1, null, 3, 7601700530003, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300042, '04 LV', 53, 0, 4, 2, 5, 1, null, 4, 7601700530004, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300052, '05 LV', 53, 0, 5, 2, 5, 1, null, 5, 7601700530005, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300062, '06 LV', 53, 0, 6, 2, 5, 1, null, 6, 7601700530006, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300072, '07 LV', 53, 0, 7, 2, 5, 1, null, 7, 7601700530007, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300082, '08 LV', 53, 0, 8, 2, 5, 1, null, 8, 7601700530008, dbo.trunc_date(getDate()));
insert into origem(idorigem, descricao, praca, localizacao, pista, sentido, tipoorigem, tipopistaarrecadacao, tipopistasentido, numerocabine, idorigempai, datainsercao) values(76017005300092, '09 LV', 53, 0, 9, 2, 5, 1, null, 9, 7601700530009, dbo.trunc_date(getDate()));


-- Diretórios para o Caminho CV  
-- Caminho das Pistas da praça P1																--ALTERADO
insert into caminhocv(idorigem, caminhoarquivo, datainsercao) values(7601700530001, '\\192.168.241.101\sicat$\CV\DADOS\CV01', dbo.trunc_date(getDate()));  
insert into caminhocv(idorigem, caminhoarquivo, datainsercao) values(7601700530002, '\\192.168.241.102\sicat$\CV\DADOS\CV02', dbo.trunc_date(getDate()));
insert into caminhocv(idorigem, caminhoarquivo, datainsercao) values(7601700530003, '\\192.168.241.103\sicat$\CV\DADOS\CV03', dbo.trunc_date(getDate()));
insert into caminhocv(idorigem, caminhoarquivo, datainsercao) values(7601700530004, '\\192.168.241.104\sicat$\CV\DADOS\CV04', dbo.trunc_date(getDate()));
insert into caminhocv(idorigem, caminhoarquivo, datainsercao) values(7601700530005, '\\192.168.241.105\sicat$\CV\DADOS\CV05', dbo.trunc_date(getDate()));
insert into caminhocv(idorigem, caminhoarquivo, datainsercao) values(7601700530006, '\\192.168.241.106\sicat$\CV\DADOS\CV06', dbo.trunc_date(getDate()));
insert into caminhocv(idorigem, caminhoarquivo, datainsercao) values(7601700530007, '\\192.168.241.107\sicat$\CV\DADOS\CV07', dbo.trunc_date(getDate()));
insert into caminhocv(idorigem, caminhoarquivo, datainsercao) values(7601700530008, '\\192.168.241.108\sicat$\CV\DADOS\CV08', dbo.trunc_date(getDate()));
insert into caminhocv(idorigem, caminhoarquivo, datainsercao) values(7601700530009, '\\192.168.241.109\sicat$\CV\DADOS\CV09', dbo.trunc_date(getDate()));
insert into caminhocv(idorigem, caminhoarquivo, datainsercao) values(7601700530010, '\\192.168.241.110\sicat$\CV\DADOS\CV10', dbo.trunc_date(getDate()));



-- Operadores Pista  
--Operadores Pistas da praça P1
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530001, 'TPT Pista 01', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530002, 'TPT Pista 02', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530003, 'TPT Pista 03', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530004, 'TPT Pista 04', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530005, 'TPT Pista 05', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530006, 'TPT Pista 06', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530007, 'TPT Pista 07', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530008, 'TPT Pista 08', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530009, 'TPT Pista 09', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530010, 'TPT Pista 10', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530011, 'TPT Pista 11', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530012, 'TPT Pista 12', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530013, 'TPT Pista 13', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530014, 'TPT Pista 14', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530015, 'TPT Pista 15', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530016, 'TPT Pista 16', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530017, 'TPT Pista 17', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530018, 'TPT Pista 18', 3, dbo.trunc_date(getDate()));
insert into operador(idoperador, nome, situacaocadastro, datainsercao) values(-530019, 'TPT Pista 19', 3, dbo.trunc_date(getDate()));


-- Operadores Origem  
--Operador origem para praça P1
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530001, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530002, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530003, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530004, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530005, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530006, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530007, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530008, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530009, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530010, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530011, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530012, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530013, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530014, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530015, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530016, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530017, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530018, 760170053, dbo.trunc_date(getDate()));
insert into operadororigem(idoperador, idorigem, datainsercao) values(-530019, 760170053, dbo.trunc_date(getDate()));


-- Configuracao do Caixa 
-- Caixa da praça P1
--Denominações
insert into denominacao(iddenominacao, descricao, idorigem, valor, datainsercao,ativado) values(0, 'R$ 0,01', 760170053, 0.01, dbo.trunc_date(getDate()), 1);
insert into denominacao(iddenominacao, descricao, idorigem, valor, datainsercao,ativado) values(1, 'R$ 0,05', 760170053, 0.05, dbo.trunc_date(getDate()), 1);
insert into denominacao(iddenominacao, descricao, idorigem, valor, datainsercao,ativado) values(2, 'R$ 0,10', 760170053, 0.1, dbo.trunc_date(getDate()), 1);
insert into denominacao(iddenominacao, descricao, idorigem, valor, datainsercao,ativado) values(3, 'R$ 0,25', 760170053, 0.25, dbo.trunc_date(getDate()), 1);
insert into denominacao(iddenominacao, descricao, idorigem, valor, datainsercao,ativado) values(4, 'R$ 0,50', 760170053, 0.5, dbo.trunc_date(getDate()), 1);
insert into denominacao(iddenominacao, descricao, idorigem, valor, datainsercao,ativado) values(5, 'R$ 1,00 m', 760170053, 1, dbo.trunc_date(getDate()), 1);
insert into denominacao(iddenominacao, descricao, idorigem, valor, datainsercao,ativado) values(6, 'R$ 1,00 c', 760170053, 1, dbo.trunc_date(getDate()), 1);
insert into denominacao(iddenominacao, descricao, idorigem, valor, datainsercao,ativado) values(7, 'R$ 2,00', 760170053, 2, dbo.trunc_date(getDate()), 1);
insert into denominacao(iddenominacao, descricao, idorigem, valor, datainsercao,ativado) values(8, 'R$ 5,00', 760170053, 5, dbo.trunc_date(getDate()), 1);
insert into denominacao(iddenominacao, descricao, idorigem, valor, datainsercao,ativado) values(9, 'R$ 10,00', 760170053, 10, dbo.trunc_date(getDate()), 1);
insert into denominacao(iddenominacao, descricao, idorigem, valor, datainsercao,ativado) values(10, 'R$ 20,00', 760170053, 20, dbo.trunc_date(getDate()), 1);
insert into denominacao(iddenominacao, descricao, idorigem, valor, datainsercao,ativado) values(11, 'R$ 50,00', 760170053, 50, dbo.trunc_date(getDate()), 1);
insert into denominacao(iddenominacao, descricao, idorigem, valor, datainsercao,ativado) values(12, 'R$ 100,00', 760170053, 100, dbo.trunc_date(getDate()), 1);

-- Pacotes
insert into pacote(idpacote, descricao, idorigem, iddenominacao, quantidade, valor, datainsercao, ativado) values(0, 'R$ 0,01',   760170053,  0, 1, 0.01, dbo.trunc_date(getDate()), 1);
insert into pacote(idpacote, descricao, idorigem, iddenominacao, quantidade, valor, datainsercao, ativado) values(1, 'R$ 0,05',   760170053,  1, 1, 0.05, dbo.trunc_date(getDate()), 1);
insert into pacote(idpacote, descricao, idorigem, iddenominacao, quantidade, valor, datainsercao, ativado) values(2, 'R$ 0,10',   760170053,  2, 1, 0.1, dbo.trunc_date(getDate()), 1);
insert into pacote(idpacote, descricao, idorigem, iddenominacao, quantidade, valor, datainsercao, ativado) values(3, 'R$ 0,25',   760170053,  3, 1, 0.25, dbo.trunc_date(getDate()), 1);
insert into pacote(idpacote, descricao, idorigem, iddenominacao, quantidade, valor, datainsercao, ativado) values(4, 'R$ 0,50',   760170053,  4, 1, 0.5, dbo.trunc_date(getDate()), 1);
insert into pacote(idpacote, descricao, idorigem, iddenominacao, quantidade, valor, datainsercao, ativado) values(5, 'R$ 1,00 m', 760170053,  5, 1, 1, dbo.trunc_date(getDate()), 1);
insert into pacote(idpacote, descricao, idorigem, iddenominacao, quantidade, valor, datainsercao, ativado) values(6, 'R$ 1,00 c', 760170053,  6, 1, 1, dbo.trunc_date(getDate()), 1);
insert into pacote(idpacote, descricao, idorigem, iddenominacao, quantidade, valor, datainsercao, ativado) values(7, 'R$ 2,00',   760170053,  7, 1, 2, dbo.trunc_date(getDate()), 1);
insert into pacote(idpacote, descricao, idorigem, iddenominacao, quantidade, valor, datainsercao, ativado) values(8, 'R$ 5,00',   760170053,  8, 1, 5, dbo.trunc_date(getDate()), 1);
insert into pacote(idpacote, descricao, idorigem, iddenominacao, quantidade, valor, datainsercao, ativado) values(9, 'R$ 10,00',  760170053,  9, 1, 10, dbo.trunc_date(getDate()), 1);
insert into pacote(idpacote, descricao, idorigem, iddenominacao, quantidade, valor, datainsercao, ativado) values(10, 'R$ 20,00',  760170053, 10, 1, 20, dbo.trunc_date(getDate()), 1);
insert into pacote(idpacote, descricao, idorigem, iddenominacao, quantidade, valor, datainsercao, ativado) values(11, 'R$ 50,00',  760170053, 11, 1, 50, dbo.trunc_date(getDate()), 1);
insert into pacote(idpacote, descricao, idorigem, iddenominacao, quantidade, valor, datainsercao, ativado) values(12, 'R$ 100,00', 760170053, 12, 1, 100, dbo.trunc_date(getDate()), 1);

-- Areas da Tesouraria
insert into area(idarea, idorigem, descricao, geramalotetransf, participatroca, participacompactacao, quantidadecheque, valorcheque, valordinheiro, ativado, datainsercao) values(1, 760170053, 'Cofre Forte', 1, 1, 1, 0, 0, 0, 1, dbo.trunc_date(getDate()));
insert into area(idarea, idorigem, descricao, geramalotetransf, participatroca, participacompactacao, quantidadecheque, valorcheque, valordinheiro, ativado, datainsercao) values(2, 760170053, 'Armário Forte', 1, 1, 1, 0, 0, 0, 1, dbo.trunc_date(getDate()));
insert into area(idarea, idorigem, descricao, geramalotetransf, participatroca, participacompactacao, quantidadecheque, valorcheque, valordinheiro, ativado, datainsercao) values(3, 760170053, 'Fundo para Troca', 1, 1, 1, 0, 0, 0, 1, dbo.trunc_date(getDate()));
insert into area(idarea, idorigem, descricao, geramalotetransf, participatroca, participacompactacao, quantidadecheque, valorcheque, valordinheiro, ativado, datainsercao) values(4, 760170053, 'Fundo de Troco', 0, 0, 0, 0, 0, 0, 1, dbo.trunc_date(getDate()));
insert into area(idarea, idorigem, descricao, geramalotetransf, participatroca, participacompactacao, quantidadecheque, valorcheque, valordinheiro, ativado, datainsercao) values(5, 760170053, 'Arrecadação', 1, 1, 0, 0, 0, 0, 1, dbo.trunc_date(getDate()));

-- Pacotes da Area
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(1, 0, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(1, 1, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(1, 2, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(1, 3, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(1, 4, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(1, 5, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(1, 6, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(1, 7, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(1, 8, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(1, 9, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(1, 10, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(1, 11, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(1, 12, 0, dbo.trunc_date(getDate()), 760170053);

insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(2, 0, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(2, 1, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(2, 2, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(2, 3, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(2, 4, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(2, 5, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(2, 6, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(2, 7, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(2, 8, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(2, 9, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(2, 10, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(2, 11, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(2, 12, 0, dbo.trunc_date(getDate()), 760170053);

insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(3, 0,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(3, 1,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(3, 2,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(3, 3,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(3, 4,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(3, 5,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(3, 6,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(3, 7,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(3, 8,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(3, 9,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(3, 10, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(3, 11, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(3, 12, 0, dbo.trunc_date(getDate()), 760170053);

insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(5, 0,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(5, 1,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(5, 2,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(5, 3,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(5, 4,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(5, 5,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(5, 6,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(5, 7,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(5, 8,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(5, 9,  0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(5, 10, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(5, 11, 0, dbo.trunc_date(getDate()), 760170053);
insert into pacotesdaarea(idarea, idpacote, quantidade, datainsercao, idorigem) values(5, 12, 0, dbo.trunc_date(getDate()), 760170053);





--Configuração Correção 
insert into configuracaocorrecao(idorigem, preliminar, definitiva, dataalteracao,datainsercao) values(760170053, 0, 1, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));

-- Pagamento Diverso 
insert into contapagamentodiverso(idcontapagamento, saldoconta, datainsercao, idorigem) values(1, 0, dbo.trunc_date(getDate()), 760170053);

-- Configuração do caminho da imagem 
insert into caminhoimagem (idorigem, caminhoservidor, datainsercao) values(760170053, 'http://SICATSGAP:18080/vasves', dbo.trunc_date(getDate()));

-- Rmmta Dados 
--insert into RMMTADADOSPRACAS(idorigem, numerolote, numerorodovia, kmpedagio) values(760170053, 25, 21, 50);

-- SUPER USUARIO   
insert into operadororigem(idoperador, idorigem, datainsercao) values(999999999, 760170053, dbo.trunc_date(getDate()));

-----------------------------
-- Operações da Declaração --  
-----------------------------
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(0, 'Abrir Declaração', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(1, 'Declarar', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(2, 'Receber Declaração', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(3, 'Consolidar Declaração', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(4, 'Pré-Consolidar Declaração', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(5, 'Desconsolidar Declaração', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(6, 'Bloquear Declaração', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(7, 'Criar Malotes', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(8, 'Ajustar Declaração', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(9, 'Recebimento de Violação', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(10, 'Estorno do Recebimento de Violação', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(11, 'Reconhecimento de Prejuízo de Violação', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(12, 'Declarar Sangria', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(13, 'Receber Sangria', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(14, 'Ajuste de Caixa', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(15, 'Ajuste do Troco', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(16, 'Ajuste na Abertura do Caixa', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(17, 'Ajuste no Fechamento do Caixa', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(18, 'Revisão de Transações', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(19, 'Recebimento de Não Pagante', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(20, 'Estorno de Recebimento de Não Pagante', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(21, 'Recebimento de Dívida de Operador', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(22, 'Retirada de Cupons para Venda', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(23, 'Recebimento de Pagamento Diverso', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(24, 'Ajuste de Sangria', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(25, 'Ajuste de Depósito de Malote Aberto no Caixa', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(26, 'Ajuste De Compensação', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(27, 'Reembolso de Clientes do Passe Expresso via PDV', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(28, 'Reembolso de Clientes do Passe Expresso via Transf. Bancária', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(29, 'Recebimento de Pagamento no POS', dbo.trunc_date(getDate()));
insert into OperacaoDeclaracao(idOperacaoDeclaracao, descricao, dataInsercao) values(30, 'Recebimento de Crédito Concedido', dbo.trunc_date(getDate()));


-- Definições de Lançamentos da Declaração  
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1000, 3, null, null, null, null, null, 1, 1, 'valor total declarado em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1001, 3, null, null, null, null, null, 1, 1, 'valor total declarado em cheque', dbo.trunc_date(getDate()));
insert into definicaolancamentodeclaracao(iddefinicaolancamento, operacaodeclaracao, nivel1, nivel2, nivel3, nivel4, nivel5, papel, tipolancamento, descricaolancamento, datainsercao) values(1002, 3, null, null, null, null, null, 1, 1, 'valor total declarado em cupom', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1003, 3, null, null, null, null, null, 1, 1, 'valor total sangria no caixa em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1004, 3, null, null, null, null, null, 1, 1, 'valor total sangria no caixa em cheque', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1005, 3, null, null, null, null, null, 1, 1, 'valor total sangria na pista em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1006, 3, null, null, null, null, null, 1, 1, 'valor total sangria na pista em cheque', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1007, 3, 1, 1, 1, 1, 1, 1, 1, 'valor total coletado em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1008, 3, 1, 1, 1, 1, 2, 1, 1, 'valor total coletado em cheque', dbo.trunc_date(getDate()));
Insert Into Definicaolancamentodeclaracao(Iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(1009, 3, 1, 3, 1, 1, 4, 1, 1,'diferença de declaração a menos no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1010, 3, 2, 1, 3, 1, 6, 1, 0, 'diferença de declaração a mais no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1011, 3, 1, 1, 2, 1, 7, 1, 1, 'valor a declarar', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1012, 3, 1, 1, 2, 1, 8, 1, 0, 'saldo anterior', dbo.trunc_date(getDate()));
Insert Into Definicaolancamentodeclaracao(Iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(1013,3, 1, 3, 1, 1, 5, 1, 1,'valor de isentos não confirmados', dbo.trunc_date(getDate()));
Insert Into Definicaolancamentodeclaracao(Iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(1014,3, 1, 3, 1, 1, 6, 1, 1,'valor de não pagantes não confirmados', dbo.trunc_date(getDate()));
Insert Into Definicaolancamentodeclaracao(Iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(1015,3, 1, 3, 1, 1, 7, 1, 1,'valor de violações não confirmadas', dbo.trunc_date(getDate()));
Insert Into Definicaolancamentodeclaracao(Iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(1016,3, 1, 3, 1, 1, 1, 1, 1,'diferença de subclassificações', dbo.trunc_date(getDate()));
Insert Into Definicaolancamentodeclaracao(Iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(1017,3, 1, 3, 1, 1, 3, 1, 1,'diferença de arrecadação a menos', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1018, 30, null, null, null, null, null, 1, 0, 'crédito compensatório de revisão de correção de transações concedido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1019, 3, 1, 1, 2, 1, 6, 1, 1, 'diferença de declaração a mais no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1020, 3, 1, 4, 1, 1, 1, 1, 0, 'valor total fundo de troco entregue', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1021, 3, 2, 1, 3, 1, 5, 1, 0, 'diferença de arrecadação a mais', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1022, 3, 2, 1, 3, 1, 3, 1, 0, 'diferença de sobreclassificação cobrada do arrecadador', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1023, 3, 2, 1, 3, 1, 4, 1, 0, 'diferença de sobreclassificação cobrada indevidamente', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1024, 3, 1, 1, 2, 1, 5, 1, 0, 'diferença de declaração a menos no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1025, 3, 1, 5, 1, 1, 2, 1, 0, 'recarga em pista de meio de pagamento', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1026, 3, 3, 2, 1, 1, 1, 1, 0, 'valores isentados', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1027, 3, 3, 1, 1, 1, 1, 1, 0, 'valores de violações', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1028, 3, 1, 2, 2, 1, 1, 1, 1, 'valores de não pagantes', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1029, 3, 1, 2, 2, 1, 2, 1, 1, 'receita de cartão de crédito', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1030, 3, null, null, null, null, null, 1, 0, 'receita cobrada corrigida', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1031, 3, 2, 1, 1, 1, 1, 1, 0, 'receita nominal corrigida', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1032, 3, 1, 2, 1, 1, 2, 1, 1, 'receita cobrada em pista manual', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1033, 3, 2, 1, 1, 1, 2, 1, 1, 'valor do desconto concedido', dbo.trunc_date(getDate()));
insert into Definicaolancamentodeclaracao(iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(1034, 3, 1, 5, 1, 1, 2, 1, 0, 'recarga em pista de meio de pagamento eletrônico', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1035, 3, null, null, null, null, null, 1, 2, 'valor declarado alocado por dia', dbo.trunc_date(getDate()));
Insert Into Definicaolancamentodeclaracao(Iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(1036, 3, 1, 3, 1, 1, 2, 1, 1,'subclassificação a reinvidicar do gestor', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1037, 3, 1, 2, 2, 1, 3, 1, 1, 'valor de crédito concedido', dbo.trunc_date(getDate()));
insert Into Definicaolancamentodeclaracao(Iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(1038, 3, 1, 3, 1, 1, 11,1, 1, 'valor de crédito concedido não confirmado', dbo.trunc_date(getDate()));
Insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1039, 3, null, null, null, null, null, 1, 0, 'receita em espécie classificada', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1040, 3, null, null, null, null, null, 1, 0, 'receita em espécie classificada por dia', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1041, 30, null, null, null, null, null, 1, 1, 'revisão de correção de transação concedido', dbo.trunc_date(getDate()));
Insert Into Definicaolancamentodeclaracao(Iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(1042,3, 1, 3, 1, 1, 9, 1, 1,'troco devido', dbo.trunc_date(getDate()));
Insert Into Definicaolancamentodeclaracao(Iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(1043,3, 1, 3, 1, 1, 10,1, 1, 'valor de descontos em pista não confirmados', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1044, 3, 2, 1, 2, 1, 3, 1, 0, 'recebimento de violador - isento de retorno', dbo.trunc_date(getDate()));
Insert Into Definicaolancamentodeclaracao(Iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(1045,3, 1, 3, 1, 1, 8, 1, 0,'crédito compensatório de revisão de correção de transações', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1046, 3, 2, 1, 1, 1, 4, 1, 1, 'revisão de correção de transação', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1047, 3, 3, 2, 2, 1, 1, 1, 0, 'valores isentados', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1048, 3, 1, 4, 1, 1, 2, 1, 1, 'valor total fundo de troco devolvido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1049, 3, 2, 1, 2, 1, 7, 1, 0, 'valor total de recebimento de não pagante em pista', dbo.trunc_date(getdate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1050, 3, 2, 1, 2, 1, 8, 1, 0, 'valor total de recebimento de violação em pista', dbo.trunc_date(getdate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1051, 3, null,null, null, null, null, 1, 1, 'valor total sangria no caixa em cupons', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1052, 3, null,null, null, null, null, 1, 1, 'valor total sangria na pista em cupons', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1053, 3, 1, 1, 1, 1, 3, 1, 1, 'valor total coletado em cupom', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1054, 3, 1, 1, 1, 1, 4, 1, 1, 'valor total coletado em cupom vale pedágio', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1055, 3, 1, 3, 1, 1, 12, 1, 1, 'valor de ISPM/ISPP não confirmados', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(1056, 3, 2, 1, 1, 1, 3, 1, 1, 'valor do desconto concedido na pista', dbo.trunc_date(getDate()));
insert into definicaolancamentodeclaracao(iddefinicaolancamento, nivel1, operacaodeclaracao, nivel2, nivel3, nivel4, nivel5, papel, tipolancamento, descricaolancamento, datainsercao) values(1057, 1, 3, 1, 2, 1, 9, 1, 1, 'receita a declarar - voucher não pagante', dbo.trunc_date(getdate()));
insert into definicaolancamentodeclaracao(iddefinicaolancamento, nivel1, operacaodeclaracao, nivel2, nivel3, nivel4, nivel5, papel, tipolancamento, descricaolancamento, datainsercao) values(1058, 1, 3, 1, 2, 1, 10, 1, 1, 'receita a declarar - voucher violação', dbo.trunc_date(getdate()));
insert into definicaolancamentodeclaracao(iddefinicaolancamento, nivel1, operacaodeclaracao, nivel2, nivel3, nivel4, nivel5, papel, tipolancamento, descricaolancamento, datainsercao) values(1059, 1, 3, 1, 2, 1, 9, 1, 0, 'receita anterior - voucher não pagante', dbo.trunc_date(getdate()));
insert into definicaolancamentodeclaracao(iddefinicaolancamento, nivel1, operacaodeclaracao, nivel2, nivel3, nivel4, nivel5, papel, tipolancamento, descricaolancamento, datainsercao) values(1060, 1, 3, 1, 2, 1, 10, 1, 0, 'receita anterior - voucher violação', dbo.trunc_date(getdate()));

insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2000, 3, null, null, null, null, null, 3, 1, 'valor total declarado em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2001, 3, null, null, null, null, null, 3, 1, 'valor total declarado em cheque', dbo.trunc_date(getDate()));
insert into definicaolancamentodeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2002, 3, null, null, null, null, null, 1, 1, 'valor total declarado em cupom', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2003, 3, null, null, null, null, null, 3, 1, 'valor total sangria no caixa em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2004, 3, null, null, null, null, null, 3, 1, 'valor total sangria no caixa em cheque', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2005, 3, 1, 1, 1, 1, 1, 3, 1, 'valor total coletado em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2006, 3, 1, 1, 1, 1, 2, 3, 1, 'valor total coletado em cheque', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2007, 3, 1, 3, 4, 1, 2, 3, 1, 'diferença de declaração a menos no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2008, 3, 2, 1, 3, 1, 6, 3, 0, 'diferença de declaração a mais no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2009, 3, 1, 1, 2, 1, 7, 3, 1, 'valor a declarar', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2010, 3, 1, 1, 2, 1, 8, 3, 0, 'saldo anterior', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2011, 3, 1, 3, 4, 1, 1, 3, 1, 'diferença de arrecadação a menos', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2012, 3, 1, 3, 4, 1, 3, 3, 1, 'crédito compensatório de revisão de correção de transações', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2013, 3, 1, 1, 2, 1, 6, 3, 1, 'diferença de declaração a mais no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2014, 3, 1, 4, 1, 1, 1, 3, 0, 'valor total fundo de troco entregue', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2015, 3, 2, 1, 3, 1, 5, 3, 0, 'diferença de arrecadação a mais', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2016, 3, 1, 1, 2, 1, 5, 3, 0, 'diferença de declaração a menos no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2017, 3, 2, 1, 2, 1, 4, 3, 0, 'valor total de pagamentos diversos', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2018, 3, 2, 1, 2, 1, 5, 3, 0, 'valor total de recebimento de dívidas de operadores', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2019, 3, 2, 1, 2, 1, 1, 3, 0, 'valor total de recebimento de violações', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2020, 3, 2, 1, 2, 1, 2, 3, 0, 'valor total de recebimento de não pagantes', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2021, 3, null, null, null, null, null, 3, 2, 'valor declarado alocado por dia', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2022, 23, null, null, null, null, null, 3, 0, 'recebimento de pagamento diverso', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2023, 21, null, null, null, null, null, 3, 0, 'recebimento de dívida de operador', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2024, 9, null, null, null, null, null, 3, 0, 'recebimento de transação de violação', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2025, 19, null, null, null, null, null, 3, 0, 'recebimento de transação de não pagante', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2026, 30, null, null, null, null, null, 3, 1, 'crédito compensatório de revisão de correção de transações', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2027, 3, 1, 3, 4, 1, 4, 3, 1, 'troco devido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2028, 3, 1, 4, 1, 1, 2, 3, 1, 'valor total fundo de troco devolvido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2029, 30, null, null, null, null, null, 3, 0, 'recebimento de crédito concedido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2030, 3, 2, 1, 2, 1, 6, 3, 0, 'valor total de recebimento de crédito concedido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2031, 3,null,  null, null, null, null, 3, 1, 'valor total sangria no caixa em cupons', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(2032, 3, 1, 1, 1, 1, 3, 3, 1, 'valor total coletado em cupom', dbo.trunc_date(getDate()));

insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3000, 3, null, null, null, null, null, 9, 1, 'valor total declarado em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3001, 3, null, null, null, null, null, 9, 1, 'valor total declarado em cheque', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao)values (3002, 3, null,null, null, null, null, 1, 1, 'valor total declarado em cupom', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3003, 3, null, null, null, null, null, 9, 1, 'valor total sangria no caixa em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3004, 3, null, null, null, null, null, 9, 1, 'valor total sangria no caixa em cheque', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3005, 3, 1, 1, 1, 1, 1, 9, 1, 'valor total coletado em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3006, 3, 1, 1, 1, 1, 2, 9, 1, 'valor total coletado em cheque', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3007, 3, 1, 3, 3, 1, 2, 9, 1, 'diferença de declaração a menos no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3008, 3, 2, 1, 3, 1, 6, 9, 0, 'diferença de declaração a mais no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3009, 3, 1, 1, 2, 1, 7, 9, 1, 'valor a declarar', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3010, 3, 1, 1, 2, 1, 8, 9, 0, 'saldo anterior', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3011, 3, 1, 3, 3, 1, 1, 9, 1, 'diferença de arrecadação a menos', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3012, 3, 1, 3, 3, 1, 3, 9, 1, 'crédito compensatório de revisão de correção de transações', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3013, 3, 1, 1, 2, 1, 6, 9, 1, 'diferença de declaração a mais no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3014, 3, 1, 4, 1, 1, 1, 9, 0, 'valor total fundo de troco entregue', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3015, 3, 2, 1, 3, 1, 5, 9, 0, 'diferença de arrecadação a mais', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3016, 3, 1, 1, 2, 1, 5, 9, 0, 'diferença de declaração a menos no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3017, 3, 2, 1, 2, 1, 4, 9, 0, 'valor total de pagamentos diversos', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3018, 3, 2, 1, 2, 1, 5, 9, 0, 'valor total de recebimento de dívidas de operadores', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3019, 3, 2, 1, 2, 1, 1, 9, 0, 'valor total de recebimento de violações', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3020, 3, 2, 1, 2, 1, 2, 9, 0, 'valor total de recebimento de não pagantes', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3021, 3, null, null, null, null, null, 9, 2, 'valor declarado alocado por dia', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3022, 23, null, null, null, null, null, 9, 0, 'recebimento de pagamento diverso', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3023, 21, null, null, null, null, null, 9, 0, 'recebimento de dívida de operador', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3024, 9, null, null, null, null, null, 9, 0, 'recebimento de transação de violação', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3025, 19, null, null, null, null, null, 9, 0, 'recebimento de transação de não pagante', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3026, 30, null, null, null, null, null, 9, 1, 'crédito compensatório de revisão de correção de transações', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3027, 3, 1, 3, 3, 1, 4, 9, 1, 'troco devido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3028, 3, 1, 4, 1, 1, 2, 9, 1, 'valor total fundo de troco devolvido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3029, 30, null, null, null, null, null, 9, 0, 'recebimento de crédito concedido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3030, 3, 2, 1, 2, 1, 6, 9, 0, 'valor total de recebimento de crédito concedido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3031, 3, null, null, null, null, null, 9, 1, 'valor total sangria no caixa em cupons', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(3032, 3, 1, 1, 1, 1, 3, 9, 1, 'valor total coletado em cupom', dbo.trunc_date(getDate()));

insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4000, 3, null, null, null, null, null, 5, 1, 'valor total declarado em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4001, 3, null, null, null, null, null, 5, 1, 'valor total declarado em cheque', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4002, 3, null, null, null, null, null, 5, 1, 'valor total sangria no caixa em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4003, 3, null, null, null, null, null, 5, 1, 'valor total sangria no caixa em cheque', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4004, 3, 1, 1, 1, 1, 1, 5, 1, 'valor total coletado em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4005, 3, 1, 1, 1, 1, 2, 5, 1, 'valor total coletado em cheque', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4006, 3, 1, 3, 2, 1, 2, 5, 1, 'diferença de declaração a menos no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4007, 3, 2, 1, 3, 1, 6, 5, 0, 'diferença de declaração a mais no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4008, 3, 1, 3, 2, 1, 1, 5, 1, 'diferença de arrecadação a menos', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4009, 3, 1, 1, 2, 1, 6, 5, 1, 'diferença de declaração a mais no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4010, 3, 1, 4, 1, 1, 1, 5, 0, 'valor total fundo de troco entregue', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4011, 3, 2, 1, 3, 1, 5, 5, 0, 'diferença de arrecadação a mais', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4012, 3, 1, 1, 2, 1, 5, 5, 0, 'diferença de declaração a menos no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4013, 3, 1, 5, 1, 1, 1, 5, 0, 'receita de venda de cupons', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4014, 3, null, null, null, null, null, 5, 2, 'valor de cupom retirado para venda', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4015, 3, null, null, null, null, null, 5, 2, 'valor de cupom devolvido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4016, 3, 1, 3, 2, 1, 3, 5, 1, 'troco devido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(4017, 3, 1, 4, 1, 1, 2, 5, 1, 'valor total fundo de troco devolvido', dbo.trunc_date(getDate()));

insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(5000, 3, null, null, null, null, null, 2, 1, 'valor total declarado em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(5001, 3, null, null, null, null, null, 2, 1, 'valor total declarado em cheque', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(5002, 3, 1, 3, 6, 1, 2, 2, 1, 'diferença de declaração a menos no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(5003, 3, 2, 1, 3, 1, 6, 2, 0, 'diferença de declaração a mais no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(5004, 3, 1, 3, 6, 1, 1, 2, 1, 'falta de sangria', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(5005, 3, 2, 1, 3, 1, 2, 2, 0, 'sobra de sangria', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(5006, 3, 1, 1, 2, 1, 4, 2, 1, 'sobra de sangria', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(5007, 3, 1, 1, 2, 1, 3, 2, 0, 'falta de sangria', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(5008, 24, null, null, null, null, null, 2, 1, 'ajuste de sangria, débito para coletor de sangria', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(5009, 3, null, null, null, null, null, 2, 2, 'transações de sangria recebidas', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(5010, 3, 1, 1, 2, 1, 5, 2, 0, 'diferença de declaração a menos no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(5011, 3, 1, 1, 2, 1, 6, 2, 1, 'diferença de declaração a mais no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(5012, 3, null, null, null, null, null, 2, 2, 'transações de sangria recebidas por dia', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(5013, 3, null, null, null, null, null, 2, 2, 'valor declarado alocado por dia', dbo.trunc_date(getDate()));

insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6000, 3, 1, 1, 2, 1, 1, 4, 0, 'falta de caixa', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6001, 3, 1, 3, 5, 1, 2, 4, 1, 'falta de caixa', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6002, 3, 2, 1, 3, 1, 1, 4, 0, 'sobra de caixa', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6003, 3, null, null, null, null, null, 4, 1, 'diferença de declaração a menos no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6004, 3, null, null, null, null, null, 4, 0, 'diferença de declaração a mais no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6005, 27, null, null, null, null, null, 4, 0, 'ajuste de crédito na declaração devido à abertura do caixa(dinheiro)', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6006, 27, null, null, null, null, null, 4, 1, 'ajuste de débito na declaração devido à abertura do caixa(dinheiro)', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6007, 28, null, null, null, null, null, 4, 0, 'ajuste de crédito na declaração devido ao fechamento do caixa(dinheiro)', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6008, 28, null, null, null, null, null, 4, 1, 'ajuste de débito na declaração devido ao fechamento do caixa(dinheiro)', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6009, 14, null, null, null, null, null, 4, 0, 'ajuste na quantidade de dinheiro do caixa, crédito', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6010, 14, null, null, null, null, null, 4, 1, 'ajuste na quantidade de dinheiro do caixa, débito', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6011, 15, null, null, null, null, null, 4, 0, 'ajuste de registro de fundo de troco, crédito', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6012, 15, null, null, null, null, null, 4, 1, 'ajuste de registro de fundo de troco, débito', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6013, 25, null, null, null, null, null, 4, 1, 'diferença a mais no ajuste do depósito de malote aberto no caixa', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6014, 25, null, null, null, null, null, 4, 0, 'diferença a menos no ajuste do depósito de malote aberto no caixa', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6015, 24, null, null, null, null, null, 4, 1, 'ajuste de sangria, débito para tesoureiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6016, 8, null, null, null, null, null, 4, 0, 'diminuição do valor declarado em dinheiro devido a ajuste de declaração', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6017, 8, null, null, null, null, null, 4, 1, 'aumento do valor declarado em dinheiro devido a ajuste de declaração', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6018, 8, null, null, null, null, null, 4, 0, 'diminuição do valor declarado em cheque devido a ajuste de declaração', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6019, 8, null, null, null, null, null, 4, 1, 'aumento do valor declarado em cheque devido a ajuste de declaração', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6020, 14, null, null, null, null, null, 4, 0, 'ajuste na quantidade de cheque do caixa, crédito', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6021, 14, null, null, null, null, null, 4, 1, 'ajuste na quantidade de cheque do caixa, débito', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6022, 27, null, null, null, null, null, 4, 0, 'ajuste de crédito na declaração devido à abertura do caixa(cheque)', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6023, 27, null, null, null, null, null, 4, 1, 'ajuste de débito na declaração devido à abertura do caixa(cheque)', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6024, 28, null, null, null, null, null, 4, 0, 'ajuste de crédito na declaração devido ao fechamento do caixa(cheque)', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6025, 28, null, null, null, null, null, 4, 1, 'ajuste de débito na declaração devido ao fechamento do caixa(cheque)', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6026, 26, null, null, null, null, null, 4, 0, 'ajuste de compensação - crédito', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6027, 26, null, null, null, null, null, 4, 1, 'ajuste de compensação - débito', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6028, 24, null, null, null, null, null, 4, 0, 'ajuste de sangria, crédito para tesoureiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(6029, 3, 1, 1, 2, 1, 2, 4, 1, 'sobra de caixa', dbo.trunc_date(getDate()));

insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(7000, 3, 1, 2, 1, 1, 1, 8, 1, 'receita cobrada em pista avi', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(7001, 3, null, null, null, null, null, 8, 0, 'receita cobrada corrigida', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(7002, 3, 2, 1, 1, 1, 1, 8, 0, 'receita nominal corrigida', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(7003, 3, 2, 1, 1, 1, 2, 8, 1, 'valor do desconto concedido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(7004, 3, 3, 2, 2, 1, 1, 8, 0, 'valores isentados', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(7005, 3, 3, 1, 1, 1, 1, 8, 0, 'valores de violações', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(7006, 3, 3, 2, 1, 1, 1, 8, 0, 'valores isentados', dbo.trunc_date(getDate()));
Insert Into Definicaolancamentodeclaracao(Iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(7007, 3, 1, 2, 2, 1, 5, 8, 1, 'valores de não pagantes', dbo.trunc_date(getDate()));
Insert Into Definicaolancamentodeclaracao(Iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(7008, 3, 1, 2, 2, 1, 6, 8, 1, 'valores de crédito concedido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(7009, 3, 2, 1, 1, 1, 3, 8, 1, 'valor do desconto concedido na pista', dbo.trunc_date(getDate()));

insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(8000, 3, null, null, null, null, null, 7, 1, 'receita cobrada corrigida', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(8001, 3, null, null, null, null, null, 7, 0, 'receita cobrada corrigida', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(8002, 3, 2, 1, 1, 1, 1, 7, 0, 'receita nominal corrigida', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(8003, 3, 2, 1, 1, 1, 2, 7, 1, 'valor do desconto concedido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(8004, 3, 3, 2, 2, 1, 1, 7, 0, 'valores isentados', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(8005, 3, 3, 2, 1, 1, 1, 7, 0, 'valores isentados', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(8006, 3, 3, 1, 1, 1, 1, 7, 0, 'valores de violações', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(8007, 3, 1, 2, 1, 1, 3, 7, 1, 'receita cobrada em pista fechada', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(8008, 3, 1, 2, 2, 1, 4, 7, 1, 'valores de não pagantes', dbo.trunc_date(getDate()));
Insert Into Definicaolancamentodeclaracao(Iddefinicaolancamento, Operacaodeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, Tipolancamento, Descricaolancamento, Datainsercao) values(8009, 3, 1, 2, 2, 1, 6, 7, 1, 'valores de crédito concedido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(8010, 3, 2, 1, 1, 1, 3, 7, 1, 'valor do desconto concedido na pista', dbo.trunc_date(getDate()));

insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9000, 3, null, null, null, null, null, 6, 1, 'valor declarado em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9001, 3, null, null, null, null, null, 6, 1, 'valor declarado em cheque', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9002, 3, null, null, null, null, null, 6, 1, 'valor total sangria em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9003, 3, null, null, null, null, null, 6, 1, 'valor total sangria em cheque', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9004, 3, 1, 1, 1, 1, 1, 6, 1, 'valor total coletado em dinheiro', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9005, 3, 1, 1, 1, 1, 2, 6, 1, 'valor total coletado em cheque', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9006, 3, 1, 3, 7, 1, 2, 6, 1, 'diferença de declaração a menos no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9007, 3, 2, 1, 3, 1, 6, 6, 0, 'diferença de declaração a mais no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9008, 3, 1, 1, 2, 1, 7, 6, 1, 'valor a declarar', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9009, 3, 1, 1, 2, 1, 8, 6, 0, 'saldo anterior', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9010, 3, 1, 3, 7, 1, 1, 6, 1, 'diferença de arrecadação a menos', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9011, 3, 1, 1, 2, 1, 6, 6, 1, 'diferença de declaração a mais no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9012, 3, 1, 3, 7, 1, 3, 6, 1, 'troco devido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9013, 3, 1, 1, 3, 1, 1, 6, 1, 'reembolso de caução via operador do PDV', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9014, 3, 1, 1, 3, 1, 2, 6, 1, 'reembolso de taxa de perda ou roubo via operador do PDV', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9015, 3, 1, 1, 3, 1, 3, 6, 1, 'reembolso de saldo via operador do PDV', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9027, 3, 1, 4, 1, 1, 1, 6, 0, 'valor total fundo de troco entregue', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9028, 3, 2, 1, 3, 1, 5, 6, 0, 'diferença de arrecadação a mais', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9030, 3, 1, 1, 2, 1, 5, 6, 0, 'diferença de declaração a menos no malote', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9019, 3, 2, 1, 5, 1, 1, 6, 0, 'pagamento espontâneo', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9020, 3, 2, 1, 5, 1, 2, 6, 0, 'pagamento cobrança rejeitada', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9021, 3, 2, 1, 5, 1, 3, 6, 0, 'pagamento cobrança regular', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9022, 3, 2, 1, 5, 1, 4, 6, 0, 'pagamento adesão', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9023, 3, 2, 1, 5, 1, 5, 6, 0, 'pagamento de novos passes', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9024, 3, 2, 1, 5, 1, 6, 6, 0, 'pagamento extrato extra', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9025, 3, 2, 1, 5, 1, 7, 6, 0, 'pagamento de taxa de perda e roubo', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9026, 3, 2, 1, 5, 1, 8, 6, 0, 'pagamento de taxa de substituição', dbo.trunc_date(getDate()));
--IdDefinicaoLancamento =9027 está livre
--IdDefinicaoLancamento =9028 está livre
--IdDefinicaoLancamento =9029 está livre
--IdDefinicaoLancamento =9030 está livre
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9031, 3, 2, 1, 6, 1, 3, 6, 0, 'reembolso de saldo via transferência bancária' , dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9032, 3, 1, 1, 3, 2, 3, 6, 1, 'reembolso de saldo via transferência bancária' , dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9033, 29, null, null, null, null, null, 6, 0, 'recebimento de pagamento espontaneo', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9034, 29, null, null, null, null, null, 6, 0, 'recebimento de pagamento cobrança rejeitada', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9035, 29, null, null, null, null, null, 6, 0, 'recebimento de pagamento cobrança regular', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9036, 29, null, null, null, null, null, 6, 0, 'recebimento de pagamento adesão', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9037, 27, null, null, null, null, null, 6, 0, 'recebimento de pagamento novos passes', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9038, 27, null, null, null, null, null, 6, 0, 'recebimento de pagamento extrato extra', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9039, 29, null, null, null, null, null, 6, 0, 'recebimento de pagamento taxa de perda ou roubo', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9040, 29, null, null, null, null, null, 6, 0, 'recebimento de substituição', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9041, 29, null, null, null, null, null, 6, 0, 'crédito de ajuste de lançamento', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9042, 29, null, null, null, null, null, 6, 1, 'débito de ajuste de lançamento', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9043, 27, null, null, null, null, null, 6, 0, 'reembolso de caução via operador do PDV', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9044, 27, null, null, null, null, null, 6, 0, 'reembolso de taxa de perda ou roubo via operador do PDV', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9045, 27, null, null, null, null, null, 6, 0, 'reembolso de saldo via operador do PDV', dbo.trunc_date(getDate()));
--IdDefinicaoLancamento =9046está livre
--IdDefinicaoLancamento =9047 está livre
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9048, 28, null, null, null, null, null, 6, 0, 'reembolso de saldo via Tesouraria', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9049, 3, 1, 4, 1, 1, 2, 6, 1, 'valor total fundo de troco devolvido', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9050, 3, 1, 2, 3, 1, 1, 6, 1, 'pagamento espontâneo', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9051, 3, 1, 2, 3, 1, 1, 6, 1, 'pagamento cobrança rejeitada', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9052, 3, 1, 2, 3, 1, 1, 6, 1, 'pagamento cobrança regular', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9053, 3, 1, 2, 3, 1, 1, 6, 1, 'pagamento adesão', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9054, 3, 1, 2, 3, 1, 1, 6, 1, 'pagamento de novos passes', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9055, 3, 1, 2, 3, 1, 1, 6, 1, 'pagamento extrato extra', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9056, 3, 1, 2, 3, 1, 1, 6, 1, 'pagamento de taxa de perda e roubo', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9057, 3, 1, 2, 3, 1, 1, 6, 1, 'pagamento de substituição', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9058, 3, 1, 2, 3, 1, 1, 6, 1, 'pagamento de reposição', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9059, 3, 1, 2, 3, 1, 1, 6, 1, 'pagamento de recuperação', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9060, 29, null, null, null, null, null, 6, 0, 'recebimento de reposição', dbo.trunc_date(getDate()));
insert into DefinicaoLancamentoDeclaracao(IdDefinicaoLancamento, OperacaoDeclaracao, Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Papel, TipoLancamento, DescricaoLancamento, DataInsercao) values(9061, 29, null, null, null, null, null, 6, 0, 'recebimento de recuperação', dbo.trunc_date(getDate()));


----------------------------------------------------------------------------------------------------------------------
---------- Configurações do Contabil / Exportação para ERP ( Padrao Vianorte) -------------------   
----------------------------------------------------------------------------------------------------------------------
--tabela TipoArquivo
--insert into tipoarquivo (idtipoarquivo,descricao,extensao,classe,datainsercao) values (1,'Padrão SGAP','TXT','br.com.compsisnet.xp.sgap.util.ArquivoERPPadrao',dbo.trunc_date(getDate()));
insert into tipoarquivo(idtipoarquivo, descricao, extensao, classe, momentogeracao, datainsercao) values(1, 'SGAP Preliminar', 'PRE', 'br.com.compsisnet.xp.sgap.model.business.configuracao.arquivoERP.layoutERP.ArquivoERPPadrao', 2, dbo.trunc_date(getDate()));
insert into tipoarquivo(idtipoarquivo, descricao, extensao, classe, momentoGeracao, datainsercao) values(2, 'SGAP Definitiva', 'DEF', 'br.com.compsisnet.xp.sgap.model.business.configuracao.arquivoERP.layoutERP.ArquivoERPPadrao', 1, dbo.trunc_date(getDate()));

--tabela EventoFinanceiro
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (1, 100,  'valor total coletado em dinheiro', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (2, 102,  'declarado alocado por dia arrecadador', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (3, 101,  'valor total coletado em cheque', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (4, 103,  'total decl. em cupons próprios arrec.', 3, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (5, 104,  'total decl. em cupons terceiros arrec.', 4, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (6, 105,  'receita cobrada corrigida arrecadador', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (7, 106,  'total diário de não pagantes arrecadador', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (8, 107,  'valor total de violações', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (9, 108,  'total diário de isentos arrecadador', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (10, 109,  'total desconto em pista pelo arrecadador', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (11, 110,  'valor em sobrantes', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (12, 111,  'valor em sobrantes', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (13, 112,  'diferenças a receber', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (14, 113,  'diferenças a receber', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (15, 114,  'diferenças a receber', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (19, 200,  'total declarado em dinheiro coletor san.', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (20, 201,  'total declarado em cheques coletor sang.', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (21, 202,  'vl. declarado aloc. por dia coletor san.', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (22, 203,  'valor em sobrantes', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (23, 204,  'diferenças a receber', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (24, 300,  'valor total coletado em dinheiro', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (25, 301,  'total declarado em cheques supervisor', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (26, 302,  'vl. declarado alocado por dia supervisor', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (27, 303,  'total declarado cupons próprios supervi.', 3, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (28, 304,  'total declarado cupons terceiros superv.', 4, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (29, 305,  'valor em sobrantes', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (30, 306,  'valor de receitas diversas', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (31, 307,  'vl. diário recebimentos diversos superv.', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (32, 308,  'valor de receitas diversas', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (33, 309,  'valor em sobrantes', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (34, 310,  'diferenças a receber', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (35, 311,  'crédito retif. correção trans. supervis.', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (36, 400,  'valor total coletado em dinheiro', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (37, 401,  'vl. total declarado cheques resp. pista', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (38, 402,  'vl. declarado alocado dia resp. pista', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (39, 403,  'total decl. cupons próprio resp. pista', 3, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (40, 404,  'total decl. cupons terceiro resp. pista', 4, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (41, 405,  'valor de receitas diversas', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (42, 406,  'valor de receitas diversas', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (43, 407,  'vl. diário dos receb. diversos r. pista', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (44, 408,  'valor de receitas diversas', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (45, 409,  'valor em sobrantes', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (46, 530,  'diferenças a receber', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (47, 500,  'valor em sobrantes', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (48, 501,  'falta de caixa tesoureiro', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (49, 502,  'aporte no caixa', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (50, 600,  'total declarado dinheiro vend. cupons', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (51, 601,  'vl. total declarado cheques vend. cupons', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (52, 602,  'vl. decl. alocado por dia vend. cupons', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (53, 603,  'receita em vendas de cupons vend. cupons', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (54, 604,  'valor em sobrantes', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (55, 605,  'diferenças a receber', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (56, 700,  'valor total de violações', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (58, 701,  'vl. diário isentos em pista fecha/auto.', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (61, 702,  'vl. diário não pagantes em pista fe/aut', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (63, 800,  'isentos receita eletronica', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (66, 801,  'pagantes receita eletronica', 8, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (69, 900,  'vl.es recebidos do Gestor do Meio Pagto', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (70, 1000,  'vl. depositado de malotes', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (71, 1001,  'vl. recusado de malotes', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (72, 1002,  'vl. depositado + vl. de malotes', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (73, 1100,  'vl. recebido compens. cupons terceiros', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (74, 1101,  'ganho na compensação cupons terceiros', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (75, 1102,  'perda na compensação cupons terceiros', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (76, 1200,  'ganho na compensação cupons próprios', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (77, 1201,  'perda na compensação cupons próprios', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (78, 1300,  'vl. descontado em folha quit. dívida op.', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (79, 1301,  'consolidação prejuízo quit. dívida op.', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (80, 1400,  'consolidação de prejuízo de violações', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (81, 1401,  'consolidação de prejuízo de não pagantes', 0, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (57, 607,  'valor total coletado em dinheiro', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (59, 606,  'valor total coletado em cheque', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (16, 115,  'valor a declarar', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (17, 116,  'saldo anterior', 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (18, 117,  'diferenças a receber', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (62, 609,  'valor de receitas diversas', 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOFINANCEIRO (IDEVENTOFINANCEIRO, CODCLIENTE, DESCRICAO, ORIGEMDADO, DATAINSERCAO) VALUES (60, 608,  'valor em sobrantes', 1, dbo.trunc_date(getDate()));


--tabela OrigemEventoFinanceiro
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	1, 'RCP01A', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	2, 'caixa operador', 'acerto de receita', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	3, 'RCP01B', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	4, NULL, NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	5, NULL, NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	6, 'acerto de receita', 'receita em espécie', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	7, 'receita a receber', 'não pagantes', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	8, 'RCP09', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	9, 'isentos-despeza', 'isentos', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	10, 'desconto-despeza', 'desconto', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	11, 'RCP01G', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	12, 'RCP01G', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	13, 'RCP01E', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	14, 'RCP01E', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	15, 'RCP01E', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	16, 'RCP01C', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	17, 'RCP01D', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	18, 'RCP01E', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	19, 'caixa', 'caixa operador', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	20, 'caixa', 'caixa operador', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	21, 'caixa operador', 'acerto de receita', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	22, 'RCP01G', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	23, 'RCP01E', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	24, 'RCP01A', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	25, 'caixa', 'caixa operador', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	26, 'caixa operador', 'acerto de receita', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	27, NULL, NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	28, NULL, NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	29, 'RCP01G', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	30, 'RCP01F', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	31, 'acerto de receita', 'receita a receber', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	32, 'RCP01F', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	33, 'RCP01G', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	34, 'RCP01E', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	35, 'dívidas a receber', 'créditos a receber', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	36, 'RCP01A', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	37, 'caixa', 'caixa operador', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	38, 'caixa operador', 'acerto de receita', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	39, NULL, NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	40, NULL, NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	41, 'RCP01F', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	42, 'RCP01F', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	43, 'acerto de receita', 'receita a receber', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	44, 'RCP01F', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	45, 'RCP01G', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	46, 'RCP01E', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	47, 'RCP01G', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	48, 'dívidas a receber', 'caixa', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	49, 'caixa', 'banco', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	50, 'caixa', 'caixa operador', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	51, 'caixa', 'caixa operador', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	52, 'caixa operador', 'acerto de receita', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	53, 'acerto de receita', 'cupons vendidos', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	54, 'RCP01G', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	55, 'RCP01E', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	56, 'RCP09', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	57, 'RCP01A', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	58, 'isentos-despeza', 'isentos', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	59, 'RCP01A', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	60, 'RCP01G', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	61, 'receita a receber', 'não pagantes', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	62, 'RCP01F', NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	63, 'isentos-despeza', 'isentos', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	66, NULL, NULL, dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	69, 'conta crédito CGMP', 'conta débito CGMP', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	70, 'banco correspondente', 'conta transitória', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	71, 'perdas', 'conta transitória', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	72, 'conta transitória', 'caixa', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	73, 'caixa', 'cupons a receber', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	74, 'cupons a receber', 'ganho com cupons', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	75, 'perda de cupons', 'cupons a receber', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	76, 'cupons a receber', 'ganho com cupons', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	77, 'perda de cupons', 'cupons a receber', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	78, 'a definir', 'dívidas a receber', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	79, 'a definir', 'dívidas a receber', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	80, 'perda de receita', 'receita a receber', dbo.trunc_date(getDate()));
INSERT INTO ORIGEMEVENTOFINANCEIRO ( IDORIGEM, IDEVENTOFINANCEIRO, CONTACREDITO, CONTADEBITO,DATAINSERCAO ) VALUES (760170053,	81, 'perda de receita', 'receita a receber', dbo.trunc_date(getDate()));


--tabela EventoTipoArquivo
--insert into eventotipoarquivo (idtipoarquivo,ideventofinanceiro,datainsercao) select 1, ideventofinanceiro, dbo.trunc_date(getDate()) from eventofinanceiro;
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (1, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (1, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (2, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (2, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (3, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (3, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (4, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (4, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (5, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (5, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (6, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (6, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (7, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (7, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (8, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (8, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (9, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (9, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (10, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (10, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (11, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (11, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (12, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (12, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (13, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (13, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (14, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (14, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (15, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (15, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (16, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (16, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (17, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (17, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (18, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (18, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (19, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (19, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (20, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (20, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (21, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (21, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (22, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (22, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (23, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (23, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (24, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (24, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (25, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (25, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (26, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (26, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (27, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (27, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (28, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (28, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (29, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (29, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (30, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (30, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (31, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (31, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (32, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (32, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (33, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (33, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (34, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (34, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (35, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (35, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (36, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (36, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (37, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (37, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (38, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (38, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (39, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (39, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (40, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (40, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (41, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (41, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (42, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (42, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (43, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (43, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (44, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (44, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (45, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (45, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (46, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (46, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (47, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (47, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (48, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (48, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (49, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (49, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (50, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (50, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (51, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (51, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (52, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (52, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (53, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (53, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (54, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (54, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (55, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (55, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (56, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (56, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (57, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (57, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (58, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (58, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (59, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (59, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (60, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (60, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (61, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (61, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (62, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (62, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (63, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (63, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (66, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (66, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (69, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (69, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (70, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (70, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (71, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (71, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (72, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (72, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (73, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (73, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (74, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (74, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (75, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (75, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (76, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (76, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (77, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (77, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (78, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (78, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (79, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (79, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (80, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (80, 2, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (81, 1, dbo.trunc_date(getDate()));
INSERT INTO EVENTOTIPOARQUIVO ( IDEVENTOFINANCEIRO, IDTIPOARQUIVO, DATAINSERCAO ) VALUES (81, 2, dbo.trunc_date(getDate()));

--tabela LancamentoEventoFinanceiro
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1002,	4,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1002,	5,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1007,	1,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1008,	3,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1009,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1010,	60,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1011,	16,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1012,	17,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1013,	15,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1014,	15,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1015,	15,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1016,	14,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1017,	13,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1019,	60,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1021,	11,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1022,	12,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1023,	12,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1027,	8,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1030,	6,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1032,	66,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1035,	2,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1038,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1042,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1043,	15,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1044,	62,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (1045,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2001,	25,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2002,	27,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2002,	28,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2005,	24,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2006,	59,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2007,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2008,	60,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2009,	16,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2010,	17,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2011,	34,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2012,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2013,	60,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2015,	33,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2017,	62,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2018,	30,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2019,	29,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2020,	32,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2021,	26,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2022,	31,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2026,	35,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (2027,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3001,	37,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3002,	39,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3002,	40,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3005,	36,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3006,	59,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3007,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3008,	60,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3009,	16,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3010,	17,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3011,	46,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3012,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3013,	60,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3015,	45,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3017,	62,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3018,	42,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3019,	53,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3020,	44,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3021,	38,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3022,	43,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (3027,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (4000,	50,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (4001,	51,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (4004,	57,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (4005,	59,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (4006,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (4007,	60,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (4008,	55,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (4009,	60,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (4011,	54,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (4016,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (5002,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (5003,	60,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (5004,	23,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (5005,	22,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (5011,	60,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (5013,	21,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (6001,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (6002,	47,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (6004,	60,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (7000,	66,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (7005,	56,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (8006,	56,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (8007,	66,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (9004,	57,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (9005,	59,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (9006,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (9007,	60,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (9008,	16,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (9009,	17,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (9010,	18,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (9011,	60,	dbo.trunc_date(getDate()));	
INSERT INTO LANCAMENTOEVENTOFINANCEIRO ( IDDEFINICAOLANCAMENTO, IDEVENTOFINANCEIRO,DATAINSERCAO ) VALUES (9012,	18,	dbo.trunc_date(getDate()));	

-- Controle de Isentos - Tabela TipoIsento -- 
insert into tipoisento(idtipoisento, descricaotipoisento,dataafastamento, ativo, datainsercao, flagassociacao, editavel, tipoveiculo) values(0, 'Sem Descrição', null, 0, dbo.trunc_date(getDate()), 0,0,0);
insert into tipoisento(idtipoisento, descricaotipoisento,dataafastamento, ativo, datainsercao, flagassociacao, editavel, tipoveiculo) values(1, 'Isento Identificado Eletronicamente', null, 0, dbo.trunc_date(getDate()), 0,0,0);
insert into tipoisento(idtipoisento, descricaotipoisento,dataafastamento, ativo, datainsercao, flagassociacao, editavel, tipoveiculo) values(3, 'Isento Artesp', null, 1, dbo.trunc_date(getDate()), 0,0,0);
insert into tipoisento(idtipoisento, descricaotipoisento,dataafastamento, ativo, datainsercao, flagassociacao, editavel, tipoveiculo) values(4, 'Isento de Edital', null, 0, dbo.trunc_date(getDate()), 0,0,0);
insert into tipoisento(idtipoisento, descricaotipoisento,dataafastamento, ativo, datainsercao, flagassociacao, editavel, tipoveiculo) values(5, 'Crédito Concedido', null, 0, dbo.trunc_date(getDate()), 0, 0, 2); --old
insert into tipoisento(idtipoisento, descricaotipoisento,dataafastamento, ativo, datainsercao, flagassociacao, editavel, tipoveiculo) values(6, 'Isento ALESP', null, 1, dbo.trunc_date(getDate()), 0,0,0);
insert into tipoisento(IdTipoIsento, DescricaoTipoIsento,dataafastamento, ativo, dataInsercao, flagAssociacao, editavel, tipoVeiculo) values(901 , 'Isento Credit Granted', null, 0, dbo.trunc_date(GETDATE()),0,0,2);
insert into tipoisento(IdTipoIsento, DescricaoTipoIsento,dataafastamento, ativo, dataInsercao, flagAssociacao, editavel, tipoVeiculo) values(902 , 'Isento ISPM/ISPP', null, 0, dbo.trunc_date(GETDATE()),0,0,0);

------------------
--  Origemisencao --
------------------
--Insert Into Origemisencao (select Idorigem, 902, dbo.trunc_date(getDate()) From Origem Where Tipoorigem = 5);

---------------------------------------------------------------------------
-- Configuração padrão para restrição de acesso por faixa de endereço IP --  ok
---------------------------------------------------------------------------
insert into rangeip(idrangeip, ipinicial, ipfinal, datainsercao) values(1, '0.0.0.0', '255.255.255.255', dbo.trunc_date(getDate()));

------------------------------------------------------------------------------
-- Configuração do Cadastro dos tipos de pista que podem sofrer pré-correção   
------------------------------------------------------------------------------
insert into origemtipopista select idorigem, 0, 0, dbo.trunc_date(getdate()) from origem where tipoorigem = 2;
GO
Insert Into Origemmotivocorrecao select Idorigem, Idmotivocorrecao, 0, dbo.trunc_date(getDate()) From Motivocorrecao, Origem Where Tipoorigem = 2;
GO
-------------------
-- Tipo Violacao --  
-------------------
insert into tipoviolacao (idtipoviolacao, descricao, ativo, datainsercao) values(0, 'Tipo desconhecido', 0, dbo.trunc_date(getDate()));
insert into tipoviolacao (idtipoviolacao, descricao, ativo, datainsercao) values(1, 'Violação Real', 0, dbo.trunc_date(getDate()));
insert into tipoviolacao (idtipoviolacao, descricao, ativo, datainsercao) values(2, 'Marcha á ré', 1, dbo.trunc_date(getDate()));
insert into tipoviolacao (idtipoviolacao, descricao, ativo, datainsercao) values(3, 'Falha em equipamento', 1, dbo.trunc_date(getDate()));
insert into tipoviolacao (idtipoviolacao, descricao, ativo, datainsercao) values(4, 'Ignorado', 0, dbo.trunc_date(getDate()));
insert into tipoviolacao (idtipoviolacao, descricao, ativo, datainsercao) values(5, 'Violação após Timeout', 0, dbo.trunc_date(getDate()));
insert into tipoviolacao (idtipoviolacao, descricao, ativo, datainsercao) values(6, 'Manutenção', 0, dbo.trunc_date(getDate()));

--------------------
-- Cadastro Pista --  
--------------------
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values( 1, 76017, 'Operadores', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values( 2, 76017, 'Tarifas e Categorias', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values( 5, 76017, 'Motivos Fechamento', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values( 6, 76017, 'Emissores Cheque', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values( 7, 76017, 'Eventos', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values( 9, 76017, 'Pistas', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(10, 76017, 'Tipos de Isentos', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(11, 76017, 'Veículos Isentos - Completo', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(12, 76017, 'Veículos Crédito Garantido', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(13, 76017, 'Mensagem de IT', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(14, 76017, 'Emissor / Gestor', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(15, 76017, 'Mídia', 1, dbo.trunc_date(getDate()), 0, 1,1);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(16, 76017, 'Gestor / Meio Pagamento', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(17, 76017, 'Conversão de Categoria', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(18, 76017, 'Veículos com Desconto', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(19, 76017, 'Denominações em Dinheiro', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(20, 76017, 'Denominações em Cupons', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(21, 76017, 'Operadores Offline', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(22, 76017, 'Declarações do Vend de Cupom', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(23, 76017, 'Mídia Full', 1, dbo.trunc_date(getDate()), 0, 1,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(24, 76017, 'Cartões SmartCard', 1,  dbo.trunc_date(getDate()), 0, 0,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(25, 76017, 'Configuração de Pista', 1, dbo.trunc_date(getDate()), 0,0,0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(26, 76017, 'Denominações', 1,  dbo.trunc_date(getDate()), 0, 0, 0);
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(27, 76017, 'Tipo Cupom', 1,  dbo.trunc_date(getDate()), 0, 0, 0);
----28 nao encontrada
insert into cadastropista(tipo, idorigem, descricao, versao, dataversao, flagalterado, loteenvio,modo) values(29, 76017, 'Cadastro de Migração',1, dbo.trunc_date(getDate()), 0, 0, 0);

------------------------
-- Tabela Equipamento -- 
------------------------
insert into Equipamento(idequipamento, descricao, datainsercao) values(-1, 'Outros', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(0, 'Loop saida manual', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(1, 'Loop cabine', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(2, 'Sensor eixo 1 manual', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(3, 'Sensor eixo 2 manual', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(4, 'Sensor eixo 3 manual', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(5, 'Sensor eixo 4 manual', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(6, 'Sensor rodagem 1 manual', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(7, 'Sensor rodagem 2 manual', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(8, 'IT manual', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(9, 'VAS manual', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(10, 'VES manual', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(11, 'Loop saida automatica', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(12, 'Loop entrada automatica', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(13, 'Loop foto automatica', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(14, 'Barreira saida automatica', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(15, 'Barreira entrada automatica', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(16, 'Sensor eixo 1 automatica sentido 1', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(17, 'Sensor eixo 2 automatica sentido 1', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(18, 'Sensor eixo 3 automatica sentido 1', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(19, 'Sensor eixo 4 automatica sentido 1', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(20, 'Sensor rodagem 1 automatica sentido 1', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(21, 'Sensor rodagem 2 automatica sentido 1', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(22, 'IT automatica', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(23, 'VAS automatica', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(24, 'VES automatica', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(25, 'ANTENA1 TAG', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(26, 'ANTENA2 TAG', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(27, 'AVC', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(28, 'PLC', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(29, 'NoBreak', dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(30, 'Loop Corredor de Isentos',  dbo.trunc_date(getDate()));
insert into Equipamento(idequipamento, descricao, datainsercao) values(31, 'Antena DBTrans',  dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(32, 'Impressora', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(33, 'Leitora SmartCard', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(34, 'VVP', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(35, 'VBS Automática', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(36, 'VAS Extra Larga', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(37, 'Sensor de Altura L', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(38, 'Sensor de Altura H', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(39, 'Impressora Adicional 1', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(40, 'Impressora Adicional 2', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(41, 'Gravação no disco remoto', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(42, 'Disco local quase cheio', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(43, 'Disco local cheio', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(44, 'Disco local em falha', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(45, 'Comunicação com a CS', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(46, 'Loop 1 ETC', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(47, 'Loop 2 ETC', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(48, 'Loop 3 ETC', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(49, 'Loop 4 ETC', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(50, 'Loop 5 ETC', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(51, 'Barreira 1 ETC', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(52, 'Barreira 2 ETC', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(53, 'Barreira 3 ETC', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(54, 'Barreira 4 ETC', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(55, 'Barreira 5 ETC', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(56, 'IT Letras Grandes', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(57, 'Ventilador do Gabinete', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(58, 'Pinpad', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(59, 'Detector de velocidade', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(60, 'Sensor eixo suspenso manual 1', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(61, 'Sensor eixo suspenso manual 2', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(62, 'Sensor eixo suspenso auto 1', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(63, 'Sensor eixo suspenso auto 2', dbo.trunc_date(getDate()));
Insert into Equipamento(idequipamento, descricao, datainsercao) Values(64, 'Leitora Interswitch', dbo.trunc_date(getDate()));

-------------------------------
-- Designacao Meio Pagamento --  
-------------------------------																	--ALTERADO
insert into DesignacaoMeioPagamento(IdDesignacao,Descricao,DataInsercao) values(1,'Espécie',dbo.trunc_date(getDate()));
--insert into DesignacaoMeioPagamento(IdDesignacao,Descricao,DataInsercao) values(2,'Promessa Pagto',dbo.trunc_date(getDate()));
--insert into DesignacaoMeioPagamento(IdDesignacao,Descricao,DataInsercao) values(3,'Cartão Crédito',dbo.trunc_date(getDate()));
--insert into DesignacaoMeioPagamento(IdDesignacao,Descricao,DataInsercao) values(4,'Cartão Débito',dbo.trunc_date(getDate()));
--insert into DesignacaoMeioPagamento(IdDesignacao,Descricao,DataInsercao) values(5,'AVI',dbo.trunc_date(getDate()));
--insert into DesignacaoMeioPagamento(IdDesignacao,Descricao,DataInsercao) values(6,'SmartCard Paraná',dbo.trunc_date(getDate()));
--insert into DesignacaoMeioPagamento(IdDesignacao,Descricao,DataInsercao) values(7,'SmartCard Individual',dbo.trunc_date(getDate()));
--insert into designacaomeiopagamento(iddesignacao,descricao,datainsercao) values(8,'Desc.Intervalo de Tempo', dbo.trunc_date(getDate()));
--insert into designacaomeiopagamento(iddesignacao,descricao,datainsercao) values(9,'Credito Concedido',dbo.trunc_date(getDate()));
--insert into DesignacaoMeioPagamento(IdDesignacao,Descricao,DataInsercao) values(10,'Visa Vale Pedágio',dbo.trunc_date(getDate()));
--insert into DesignacaoMeioPagamento(IdDesignacao,Descricao,DataInsercao) values(12,'Passagem Múltipla', dbo.trunc_date(getdate()));

---------------------
-- Pessoa Juridica --  
---------------------																			--ALTERADO
--insert into pessoajuridica(cnpj, idpessoajuridica, razaosocial, inscricaoestadual, inscricaomunicipal, ativa, datainsercao) values('xxxxxxxxxxx', 3, 'CGMP', 'XXXXXXX', 'XXXXXXX', 1, dbo.trunc_date(getDate()));
--insert into pessoajuridica(cnpj, idpessoajuridica, razaosocial, inscricaoestadual, inscricaomunicipal, ativa, datainsercao) values('xxxxxxxxxxx', 4, 'Visa', 'XXXXXXX', 'XXXXXXX', 1, dbo.trunc_date(getDate()));
--insert into pessoajuridica(cnpj, idpessoajuridica, razaosocial, inscricaoestadual, inscricaomunicipal, ativa, datainsercao) values('xxxxxxxxxxx', 7, 'DBTrans', 'xxxxxxxxxxx', 'xxxxxxxxxxx', 1, dbo.trunc_date(getdate()));
--insert into pessoajuridica(cnpj, idpessoajuridica, razaosocial, inscricaoestadual, inscricaomunicipal, ativa, datainsercao) values('03643134100019', 23, 'Concessionária Litoral Norte', 'XXXXXXX', 'XXXXXXX', 1, dbo.trunc_date(getDate()));

------------------------------
-- Endereço pessoa Juridica --  
------------------------------																	--ALTERADO
--insert into enderecopessoajuridica(idpessoajuridica, idendereco, logradouro, numero, complemento, bairro, cidade, estado, pais, cep, datainsercao) values(3, 1, 'xxxxxxxxxxxxx', 842, 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'SP', 'BRASIL', 'XXXXXXXXX', dbo.trunc_date(getDate()));
--insert into enderecopessoajuridica(idpessoajuridica, idendereco, logradouro, numero, complemento, bairro, cidade, estado, pais, cep, datainsercao) values(4, 1, 'xxxxxxxxxxxxx', 125, 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'XX', 'BRASIL', 'XXXXXXXXX', dbo.trunc_date(getDate()));
--insert into enderecopessoajuridica(idpessoajuridica, idendereco, logradouro, numero, complemento, bairro, cidade, estado, pais, cep, datainsercao) values(7, 1, 'xxxxxxxxxxxxx', 7, 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'xxxxxxxxxxxxx', 'XX', 'BRASIL', 'XXXXXXXXX', dbo.trunc_date(getDate()));
--insert into enderecopessoajuridica(idpessoajuridica, idendereco, logradouro, numero, complemento, bairro, cidade, estado, pais, cep, datainsercao) values(23, 1, 'Praça do Pedágio', 10, 'xxxxxxxxxxxxx', 'Enseada do Suá', 'Camaçari', 'BH', 'BRASIL', '42840000', dbo.trunc_date(getDate()));

-----------------
-- Conta Banco -- 
-----------------																				--ALTERADO
--insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(1, 1, 76017, 'Conta Recebimento CGMP', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');
--insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(2, 1, 76017, 'Conta Pagto CGMP', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');
--insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(3, 1, 76017, 'Conta Recebimento Visa Vale', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');
--insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(4, 1, 76017, 'Conta Pagamento Visa Vale', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');
--insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(7, 1, 76017, 'Conta Recebimento DBTrans', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');
--insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(8, 1, 76017, 'Conta Pagamento DBTrans', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');
--insert into contabanco(idconta, idbanco, idorigem, descricaobanco, agencia, numeroconta,enderecoagencia, responsavelagencia, ativo, datainsercao,telefoneagencia) values(23, 1, 76017, 'Conta Via Expressa', 'xxxx', 'xxxx', 'xxxx', 'xxxx', 1, dbo.trunc_date(getDate()), 'xxxx');

------------------------
-- Camara Compensação -- 
------------------------																		--ALTERADO
--insert into camaracompensacao(idcamara, descricao, idreal, idpessoajuridica, situacaoprocentrada,situacaoprocsaida, contapagamento, contarecebimento, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(3, 'CGMP', '290', 3, 1, 1, 1, 2, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));
--insert into camaracompensacao(idcamara, descricao, idreal, idpessoajuridica, situacaoprocentrada,situacaoprocsaida, contapagamento, contarecebimento, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(4, 'Visa', 'Visa', 4, 1, 1, 4, 3, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));
--insert into camaracompensacao(idcamara, descricao, idreal, idpessoajuridica, situacaoprocentrada,situacaoprocsaida, contapagamento, contarecebimento, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(7, 'Nível 2 DBTtrans', 'DBT', 7, 1, 1, 8, 7, dbo.trunc_date(getdate()), dbo.trunc_date(getdate()), dbo.trunc_date(getdate()));
--insert into camaracompensacao(idcamara, descricao, idreal, idpessoajuridica, situacaoprocentrada, situacaoprocsaida, contapagamento, contarecebimento, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(23, 'Via Expressa', '23', 23, 1, 1, 23, 23, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));

------------
-- Gestor -- 
------------																					--ALTERADO
--insert into gestor(idgestor, idreal, idpessoajuridica, descricao, idcamara, tipolistavalidacao, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(3, '290' , 3, 'CGMP',    3, 1, dbo.trunc_date(getDate()), null, dbo.trunc_date(getDate()));
--insert into gestor(idgestor, idreal, idpessoajuridica, descricao, idcamara, tipolistavalidacao, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(4, 'Visa', 4, 'Visa',    4, 1, dbo.trunc_date(getDate()), null, dbo.trunc_date(getDate()));
--insert into gestor(idgestor, idreal, idpessoajuridica, descricao, idcamara, tipolistavalidacao, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(7, 'DBT' , 7, 'DBTrans', 7, 1, dbo.trunc_date(getdate()), null, dbo.trunc_date(getdate()));
--insert into gestor(idgestor, idreal, idpessoajuridica, descricao, idcamara, tipolistavalidacao, datahoracadastro, datahoraultimaatualizacao, datainsercao) values(23, '23', 23, 'Via Expressa', 23, 1, dbo.trunc_date(getdate()), null, dbo.trunc_date(getdate()));

--------------------
-- Meio Pagamento --  
--------------------																			--ALTERADO
--Os meios de pagamento da interoperação cadastrados DEVEM ter os mesmos ids cadastrados na tabela meioPagamentoInteroperacao!
insert into meiopagamento(idmeiopagamento, descricao, idgestor, programartarifa, idmeiopagtotarifa, iddesignacao, alteravel, dataalteracao, datainsercao) values(0,'Nominal' , null, 0, 1, 1, 0, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));
insert into meiopagamento(idmeiopagamento, descricao, idgestor, programartarifa, idmeiopagtotarifa, iddesignacao, alteravel, dataalteracao, datainsercao) values(1,'Dinheiro', null, 1, 1, 1, 0, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));
insert into meiopagamento(idmeiopagamento, descricao, idgestor, programartarifa, idmeiopagtotarifa, iddesignacao, alteravel, dataalteracao, datainsercao) values(2,'Cupom'   , null, 0, 1, 1, 0, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));
insert into meiopagamento(idmeiopagamento, descricao, idgestor, programartarifa, idmeiopagtotarifa, iddesignacao, alteravel, dataalteracao, datainsercao) values(3,'Cheque'  , null, 0, 1, 1, 0, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));
--insert into meiopagamento(idmeiopagamento, descricao, idgestor, programartarifa, idmeiopagtotarifa, iddesignacao, alteravel, dataalteracao, datainsercao) values(4,'Promessa Pagto', null, 0, 1, 2, 0, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));
--5 Isento - CV
--6 Cartão Crédito VISA	
--7 AutoExpresso dbtrans
--insert into meiopagamento(idmeiopagamento, descricao, iddesignacao, programartarifa, idgestor, alteravel, idmeiopagtotarifa, dataalteracao, datainsercao) values(14,'ViaFácil/SemParar', 5, 1, 3, 1, 14, dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));
--insert into meiopagamento(idmeiopagamento, descricao, iddesignacao, programartarifa, idgestor, alteravel, idmeiopagtotarifa, dataalteracao, datainsercao) values(15,'Visa Vale Pedágio',10, 0, 4, 0,  1, dbo.trunc_date(getdate()), dbo.trunc_date(getdate()));
--insert into meiopagamento(idmeiopagamento, descricao, iddesignacao, programartarifa, idgestor, alteravel, idmeiopagtotarifa, dataalteracao, datainsercao) values(16,'Cupom Vale Pedágio Dbtrans',1,0,7,0,1,dbo.trunc_date(getdate()),dbo.trunc_date(getdate()));
--17 smart card individual
--18 smart card empresarial
--19 sgmp pf
--20 sgmp pj
--21 Credit Granted
--22 interswitch
--100	Onda Livre Temp (int. prov. LM)
--101	PEX Temp (interf. provis. Lamsa)
--insert into meiopagamento(idmeiopagamento, descricao, iddesignacao, programartarifa, idgestor, alteravel, idmeiopagtotarifa, dataalteracao, datainsercao) values(23, 'Via Expressa', 5, 1, 23, 1, 1, dbo.trunc_date(getdate()), dbo.trunc_date(getdate()));
--insert into meiopagamento(idmeiopagamento, descricao, iddesignacao, programartarifa, idgestor, alteravel, idmeiopagtotarifa, dataalteracao, datainsercao) values(101,'Via Expressa Temp', 5, 1, 23, 1, 1, dbo.trunc_date(getdate()), dbo.trunc_date(getdate()));
--102	Via Verde Temp (interf. prov. CRT)


-- Meio Pagamento Interoperacao-- 																--ALTERADO
--insert into meiopagamentointeroperacao(idmeiopagamentointeroperacao, descricao, idmeiopagamento, idreal, idgestor, recebeviolador, datahoraultimaatualizacao, ativa, modelo, datahoracadastro, datainsercao, leadtime, flagpermitedesconto, flagexibe, ordem) values (14, 'ViaFácil/SemParar', 14, '290', 3, 1, dbo.trunc_date(getDate()), 0, 'CGMP', dbo.trunc_date(getDate()), dbo.trunc_date(getDate()), 0, 1, 1, 1);
--insert into meiopagamentointeroperacao(idmeiopagamentointeroperacao, descricao, idmeiopagamento, idreal, idgestor, recebeviolador, datahoraultimaatualizacao, ativa, modelo, datahoracadastro, datainsercao, leadtime, flagpermitedesconto, flagexibe, ordem) values (15, 'Visa Vale Pedágio', 15, 'Visa', 4, 0, dbo.trunc_date(getdate()), 1, 'Visa', dbo.trunc_date(getdate()), dbo.trunc_date(getdate()), 0, 0, 0, 2);
--insert into meiopagamentointeroperacao(idmeiopagamentointeroperacao, descricao, idmeiopagamento, idreal, idgestor, recebeviolador, datahoraultimaatualizacao, ativa, modelo, datahoracadastro, datainsercao, leadtime, flagpermitedesconto, flagexibe, ordem) values (16,'Cupom Vale Pedágio Dbtrans',16,'CDBT',7,0,dbo.trunc_date(getdate()),1,'CDBT',dbo.trunc_date(getdate()),dbo.trunc_date(getdate()),0,0,0,3);
--insert into meiopagamentointeroperacao(idmeiopagamentointeroperacao, descricao, idmeiopagamento, idreal, idgestor, recebeviolador, datahoraultimaatualizacao, ativa, modelo, datahoracadastro, datainsercao, leadtime, flagpermitedesconto, flagexibe, ordem) values (23, 'Via Expressa', 23, '23', 23, 0, dbo.trunc_date(getDate()), 1, 'VExp', dbo.trunc_date(getDate()), dbo.trunc_date(getDate()), 0, 0, 1, 3);
--insert into meiopagamentointeroperacao(idmeiopagamentointeroperacao, descricao, idmeiopagamento, idreal, idgestor, recebeviolador, datahoraultimaatualizacao, ativa, modelo, datahoracadastro, datainsercao, leadtime, flagpermitedesconto, flagexibe, ordem) values (101, 'Via Expressa Temp', 101, '101', 23, 0, dbo.trunc_date(getDate()), 1, 'VExp', dbo.trunc_date(getDate()), dbo.trunc_date(getDate()), 0, 0, 1, 4);


-----------no caso da Rodosol, esta tabela somente será preenchida quando os meios de pagamento forem habilitados-----------

--As informaçoes para preencher a tabela codigopracameiopagamento devem ser solicitadas a cada gestor de meio de pagamento
--Via Fácil (por sentido)
--insert into codigopracameiopagamento(idmeiopagamentointeroperacao, codigopracalocal, codigopracameiopagamento, datainsercao, codigopistameiopagamento) values(14, 76017005300001, '0101', dbo.trunc_date(getDate()), '0');

--Smart Card Individual
--insert into codigopracameiopagamento(idmeiopagamentointeroperacao, codigopracalocal, codigopracameiopagamento, datainsercao, codigopistameiopagamento) values(17, 76017005300001, '501', dbo.trunc_date(getDate()), '0');

--Smart Card Empresárial
--insert into codigopracameiopagamento(idmeiopagamentointeroperacao, codigopracalocal, codigopracameiopagamento, datainsercao, codigopistameiopagamento) values(18, 76017005300001, '501', dbo.trunc_date(getDate()), '0');

--Auto expresso DBTrans
--insert into codigopracameiopagamento (idmeiopagamentointeroperacao, codigopracalocal, codigopracameiopagamento, datainsercao, codigopistameiopagamento) values (7, 76017005300001, '9', dbo.trunc_date(getDate()), '232');

--ViSA Vale Pedágio (por sentido)
--insert into codigopracameiopagamento (idmeiopagamentointeroperacao, codigopracalocal, codigopracameiopagamento, datainsercao, codigopistameiopagamento) values (15, 76017005300001, '0101', dbo.trunc_date(getdate()), '0');

--Cupom DBTrans (por praça)
--insert into codigopracameiopagamento(idmeiopagamentointeroperacao, codigopracalocal, codigopracameiopagamento, datainsercao, codigopistameiopagamento) values (16, 760170053 , '518', dbo.trunc_date(getdate()),  '0');


--Pasta Trabalho Meio Pagamento
--insert into pastatrabalhomeiopagamento(
--idmeiopagamentointeroperacao,
--pastaarquivoscomerro,
--pastagravacaolotes,
--pastahistoricocadastros,
--pastalotesenviados,
--pastarecebimentocadastros,
--pastarecebimentoprotocolostecn,
--datainsercao,
--pastarecebimentoprotocolosfina,
--pastahistoricorecebimentoproto,
--pastaenviolotes,
--pastarecebimentoBD,
--pastaenvioimagens,
--pastarecebimentolistafull,
--pastarecebimentocadastrotmp,
--pastaprotocolofinanceirotmp,
--pastaprotocolotecnicotmp,
--PastaEnvioTarifas,
--PastaRecebimentoTarifas,
--PastaRecebimentoTarifasTMP,
--PastaEnvioTarifasTMP,
--PastaRecebimentoVPC,
--PastaRecebimentoVPCTMP,
--PastaRecebimentoVPR,
--PastaRecebimentoVPRTMP,
--PastaHistoricoValePedagio,
--PASTARECEBDESCMANUT, PASTARECEBDESCMANUTTMP, PASTAHISTORICODESCMANUT) values(
--14,
--'D:\Sicat\app\server\sgap\deploy\interop.war\CGMP\ViaFacilSemParar\Erros',
--'D:\Sicat\app\server\sgap\deploy\interop.war\CGMP\ViaFacilSemParar\Lotes',
--'D:\Sicat\app\server\sgap\deploy\interop.war\CGMP\ViaFacilSemParar\HistoricoCadastros',
--'D:\Sicat\app\server\sgap\deploy\interop.war\CGMP\ViaFacilSemParar\LotesEnviados',
--'\\<ip maquina>\cgmp-edi\2.RECEBIMENTO',
--'\\<ip maquina>\cgmp-edi\2.RECEBIMENTO\TRT',
--dbo.trunc_date(getDate()),
--'\\<ip maquina>\cgmp-edi\2.RECEBIMENTO\TRF',
--'D:\Sicat\app\server\sgap\deploy\interop.war\CGMP\ViaFacilSemParar\HistoricoProtocolos',
--'\\<ip maquina>\cgmp-avi\1.PENDENTES',
--'\\<ip maquina bd>\Recebimento',
--'\\<ip maquina>\cgmp-avi\2.IMAGENS',
--'\\<ip maquina bd>\Recebimento',
--'D:\sicat\app\server\sgap\deploy\interop.war\CGMP\ViaFacilSemParar\Cadastros\tmp',
--'D:\sicat\app\server\sgap\deploy\interop.war\CGMP\ViaFacilSemParar\ProtocolosFinanceiros\tmp',
--'D:\sicat\app\server\sgap\deploy\interop.war\CGMP\ViaFacilSemParar\ProtocolosTecnicos\tmp',
--'\\<ip maquina>\cgmp-edi\1.ENVIO\TAF',
--'\\<ip maquina>\cgmp-edi\2.RECEBIMENTO\TAT',
--'D:\Sicat\app\server\sgap\deploy\interop.war\CGMP\TAF\tmp\',
--'D:\Sicat\app\server\sgap\deploy\interop.war\CGMP\TAT\tmp\',
--'D:\CGMP-EDI\2.RECEBIMENTO\VPC',
--'D:\sicat\app\server\sgap\deploy\interop.war\CGMP\ViaFacilSemParar\ValePedagio\VPC\tmp',
--'D:\CGMP-EDI\2.RECEBIMENTO\VPR',
--'D:\sicat\app\server\sgap\deploy\interop.war\CGMP\ViaFacilSemParar\ValePedagio\VPR\tmp',
--'D:\sicat\app\server\sgap\deploy\interop.war\CGMP\ViaFacilSemParar\HistoricoValePedagio',
--'D:\Sicat\app\server\sgap\deploy\interop.war\CGMP\ViaFacilSemParar\DescontoManutencao',
--'D:\Sicat\app\server\sgap\deploy\interop.war\CGMP\ViaFacilSemParar\DescontoManutencao\tmp',
--'D:\Sicat\app\server\sgap\deploy\interop.war\CGMP\ViaFacilSemParar\HistoricoDescontoManutencao');

--Insert into pastatrabalhomeiopagamento
--(idmeiopagamentointeroperacao,
--pastaarquivoscomerro,
--pastagravacaolotes, 
--pastahistoricocadastros,
--pastalotesenviados,
--pastarecebimentocadastros, 
--pastarecebimentoprotocolostecn,
--datainsercao,
--pastarecebimentoprotocolosfina,
--pastahistoricorecebimentoproto,
--pastaenviolotes, pastarecebimentobd,
--pastaenvioimagens, pastaenviotarifas,
--pastarecebimentolistafull, pastaprotocolofinanceirotmp, 
--pastaprotocolotecnicotmp, pastarecebimentocadastrotmp)
--Values
--(7, 'D:\sicat\app\server\sgap\deploy\interop.war\DBTrans\LotesComErro', '\\127.0.0.1\TesteGeracaoLoteDBTrans', NULL, 
--'D:\sicat\app\server\sgap\deploy\interop.war\DBTrans\LoteProcessadosComSucesso', NULL, NULL, dbo.trunc_date(getDate()), NULL, 
--NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--insert into pastatrabalhomeiopagamento (idmeiopagamentointeroperacao, pastaarquivoscomerro, pastagravacaolotes, pastahistoricocadastros, pastalotesenviados, pastarecebimentocadastros, pastarecebimentoprotocolostecn, datainsercao, pastarecebimentoprotocolosfina, pastahistoricorecebimentoproto, pastaenviolotes, pastarecebimentobd, pastaenvioimagens, pastaenviotarifas, pastarecebimentolistafull, pastaprotocolofinanceirotmp, pastaprotocolotecnicotmp, pastarecebimentocadastrotmp, pastaenviotarifastmp, pastarecebimentotarifas, pastarecebimentotarifastmp, pastarecebimentovpc, pastarecebimentovpctmp, pastarecebimentovpr, pastarecebimentovprtmp, pastahistoricovalepedagio, pastarecebdescmanut, pastarecebdescmanuttmp, pastahistoricodescmanut)
--values (16, 'D:\sicat\app\server\sgap\deploy\interop.war\CupomValePedagio\Erros', 'D:\sicat\app\server\sgap\deploy\interop.war\CupomValePedagio\GeracaoMovimento', NULL, 'D:\sicat\app\server\sgap\deploy\interop.war\CupomValePedagio\EnviadosMovimento',  NULL, 'D:\sicat\app\server\sgap\deploy\interop.war\CupomValePedagio\RetornoMovimento', dbo.trunc_date(getdate()), NULL, 'D:\sicat\app\server\sgap\deploy\interop.war\CupomValePedagio\HistoricoRetornoMovimento', 'D:\sicat\app\server\sgap\deploy\interop.war\CupomValePedagio\EnvioMovimento', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


-- Configuracao Meio Pagamento
--insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria, enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes, modorecebimentolotesajuste, modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros, quantidademaxiPIRegistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes, tempopermanenciaregistroscadas, datainsercao, modorecebimentocadastros, flagpermiteinsercaomanual, tipoorigem) values(10, '5', 0, 1, 1, 1, 1, 1, 2, 100000, 720, 43200, 43200, dbo.trunc_date(getDate()), 1,0,2);
--insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria, enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes, modorecebimentolotesajuste, modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros, quantidademaxiPIRegistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes, tempopermanenciaregistroscadas, datainsercao, modorecebimentocadastros, flagpermiteinsercaomanual, tipoorigem) values(11, '5', 0, 1, 1, 1, 1, 1, 2, 100000, 720, 43200, 43200, dbo.trunc_date(getDate()), 1,0,2);
--insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria, enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes, modorecebimentolotesajuste, modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros, quantidademaxiPIRegistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes, tempopermanenciaregistroscadas, datainsercao, modorecebimentocadastros, flagpermiteinsercaomanual, recebemanual, tipoorigem)values (17,5,0,1,1,1,1,1,1,1,720,43200,43200,sysdate,0,0,1,2);
--insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria, enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes, modorecebimentolotesajuste, modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros, quantidademaxiPIRegistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes, tempopermanenciaregistroscadas, datainsercao, modorecebimentocadastros, flagpermiteinsercaomanual, recebemanual, tipoorigem)values (18,5,0,1,1,1,1,1,1,1,720,43200,43200,sysdate,0,0,1,2);
--insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria, enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes, modorecebimentolotesajuste, modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros, quantidademaxiPIRegistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes, tempopermanenciaregistroscadas, datainsercao, modorecebimentocadastros, flagpermiteinsercaomanual, tipoorigem) values(100, '5', 0, 1, 1, 1, 1, 1, 2, 100000, 720, 43200, 43200, dbo.trunc_date(getDate()), 1,0,2);
--insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria, enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes, modorecebimentolotesajuste, modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros, quantidademaxiPIRegistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes, tempopermanenciaregistroscadas, datainsercao, modorecebimentocadastros, flagpermiteinsercaomanual, tipoorigem) values(101, '5', 0, 1, 1, 1, 1, 1, 2, 100000, 720, 43200, 43200, dbo.trunc_date(getDate()), 1,0,2);
--insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria,enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes, modorecebimentolotesajuste,modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros,quantidademaximaregistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes,tempopermanenciaregistroscadas, datainsercao,modorecebimentocadastros, flagpermiteinsercaomanual, tipoorigem, ModoRecebPassagemCompradaVP, ModoRecebPassagemRealizadaVP,PermiteAtribuicaoTagBloqueado, nomeconcessionaria, recebemanual) 
--values (7, '10',  0, 1, 1, 1, 1, 1, 1, 1000, 720, 43200, 43200, dbo.trunc_date(getDate()), 0,0,1,2,1,1,null, 0);

--insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria, enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes, modorecebimentolotesajuste, modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros, quantidademaximaregistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes, tempopermanenciaregistroscadas, datainsercao, modorecebimentocadastros, flagpermiteinsercaomanual, tipoorigem, ModoRecebPassagemCompradaVP, ModoRecebPassagemRealizadaVP,PermiteAtribuicaoTagBloqueado, nomeconcessionaria, recebemanual,MODORECEBDESCMANUTGERAL, MODORECEBDESCMANUTSUBST, MODORECEBDESCMANUTMANUT, MODORECEBDESCMANUTCONC) 
--values (14, '277', 0, 1, 1, 1, 1, 1, 2, 2500, 720, 43200, 43200, dbo.trunc_date(getDate()), 1,1,6,1,1,1,'RodoSol',1,1,1,1,1);

--insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria, enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes,  modorecebimentolotesajuste, recebemanual, modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros, quantidademaximaregistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes, tempopermanenciaregistroscadas, datainsercao, modorecebimentocadastros, flagpermiteinsercaomanual, tipoorigem, permiteatribuicaotagbloqueado, modorecebpassagemcompradavp,  modorecebpassagemrealizadavp, nomeconcessionaria, modorecebdescmanutgeral, modorecebdescmanutsubst, modorecebdescmanutconc, modorecebdescmanutmanut)
--values (15, '277', 0, 1, 1, 1, 1, 1, 1, 0, 5000, 720, 43200, 43200, dbo.trunc_date(getdate()), 1, 0, 6, 0, 1, 1, 'RodoSol', 1, 1, 1, 1);

--insert into configuracaomeiopagamento(idmeiopagamentointeroperacao, codigoconcessionaria, enviotransacoesbloqueadas, modoenviolotes, modogeracaolotes,  modorecebimentolotesajuste, recebemanual, modorecebimentoprottecnicos, modorecebimentoprotfinanceiros, quantidademaximacadastros, quantidademaximaregistroslote, tempomaximodadoscadastro, tempomaximoregistroslotes, tempopermanenciaregistroscadas, datainsercao, modorecebimentocadastros, flagpermiteinsercaomanual, tipoorigem, permiteatribuicaotagbloqueado, modorecebpassagemcompradavp,  modorecebpassagemrealizadavp, nomeconcessionaria, modorecebdescmanutgeral, modorecebdescmanutsubst, modorecebdescmanutconc, modorecebdescmanutmanut)
--values (16, '65', 0, 1, 1, 1, 1, 1, 1, 0, 99999999, 720, 43200, 43200, dbo.trunc_date(getdate()), 1, 0, 6, 0, 1, 1, 'RodoSol', 1, 1, 1, 1);

--------------------------------
-- Rotinas Interoperabilidade --
--------------------------------
--insert into rotinasinteroperabilidade(idmeiopagamentointeroperacao, disponibilizacaocadastros,enviolotes, geracaolotes, insercaotransacao, manipulacaotransacao, recebimentocadastros,recebimentolotesajuste, recebimentoprotocolofinanceiro, recebimentoprotocolotecnico, datainsercao,RecebimentoPassagemCompradaVP,RecebimentoPassagemRealizadaVP, RECEBIMENTODESCMANUT) 
--values (14, 'br.com.compsisnet.xp.sgcc.interop.cgmp.facade.disponibilizacaocadastro.facade.interfaces.DisponibilizacaoCadastroCGMPRemote', 'envioLotesCGMP', 'geracaoLotesCGMP', 'br.com.compsisnet.xp.sgcc.interop.cgmp.facade.insercaocontadetalhes.facade.interfaces.InsercaoContaDetalhesFacadeCGMPRemote', 'appletManutencaoTransacaoCgmp', 'recebimentoCadastrosCGMP', null, 'recebimentoProtocolosFinanceirosCGMP', 'recebimentoProtocolosTecnicosCGMP', dbo.trunc_date(getDate()),'recebimentoPassagemCompradaVPCGMP','recebimentoPassagemRealizadaVPCGMP',  'recebimentoDescManutCGMP');

--insert into rotinasinteroperabilidade(idmeiopagamentointeroperacao, disponibilizacaocadastros, enviolotes, geracaolotes, insercaotransacao,   manipulacaotransacao, recebimentocadastros, recebimentolotesajuste, recebimentoprotocolofinanceiro, recebimentoprotocolotecnico,     datainsercao, recebimentopassagemcompradavp, recebimentopassagemrealizadavp, recebimentodescmanut)
--values (15, NULL, NULL, NULL, NULL, 'appletManutencaoTransacao', NULL, NULL, NULL, NULL, dbo.trunc_date(getdate()), NULL, NULL, NULL);

--insert into rotinasinteroperabilidade(idmeiopagamentointeroperacao, disponibilizacaocadastros, enviolotes, geracaolotes, insercaotransacao,   manipulacaotransacao, recebimentocadastros, recebimentolotesajuste, recebimentoprotocolofinanceiro, recebimentoprotocolotecnico,     datainsercao, recebimentopassagemcompradavp, recebimentopassagemrealizadavp, recebimentodescmanut)
--values (16, NULL, 'movimentoCupomValePedagio', 'movimentoCupomValePedagio', NULL, NULL, NULL, NULL, NULL, 'movimentoCupomValePedagio', dbo.trunc_date(getdate()), NULL, NULL, NULL);

---------------------------
-- Tempos Meio Pagamento --
-----------------------------
--insert into temposmeiopagamento(idmeiopagamentointeroperacao, varreduracadastros, frequenciaenviolotes, frequenciageracaolotes, varreduralotesajuste, varreduraprotocolostecnicos, varreduraprotocolosfinanceiros, datainsercao, VarreduraPassagemCompradaVP, VarreduraPassagemRealizadaVP, varreduraemailatualizacaocad, varreduradescmanutgeral, varreduradescmanutsubst, varreduradescmanutconc, varreduradescmanutmanut) 
--values (14, NULL, NULL, NULL, NULL, NULL, NULL, dbo.trunc_date(getDate()), NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--insert into temposmeiopagamento(idmeiopagamentointeroperacao, varreduracadastros, frequenciaenviolotes, frequenciageracaolotes, varreduralotesajuste,  varreduraprotocolostecnicos, varreduraprotocolosfinanceiros, datainsercao, varredurapassagemcompradavp, varredurapassagemrealizadavp, varreduraemailatualizacaocad, varreduradescmanutgeral, varreduradescmanutsubst, varreduradescmanutconc, varreduradescmanutmanut)
--values (15, NULL, NULL, NULL, NULL, NULL, NULL, dbo.trunc_date(getdate()), NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--insert into temposmeiopagamento(idmeiopagamentointeroperacao, varreduracadastros, frequenciaenviolotes, frequenciageracaolotes, varreduralotesajuste,  varreduraprotocolostecnicos, varreduraprotocolosfinanceiros, datainsercao, varredurapassagemcompradavp, varredurapassagemrealizadavp, varreduraemailatualizacaocad, varreduradescmanutgeral, varreduradescmanutsubst, varreduradescmanutconc, varreduradescmanutmanut)
--values (16, NULL, NULL, NULL, NULL, NULL, NULL, dbo.trunc_date(getdate()), NULL, NULL, NULL, NULL, NULL, NULL, NULL);


----------------------
-- Classe de Tarifa -- 
----------------------																	--ALTERADO
-- Todo meio de pagto que programa tarifa(PROGRAMARTARIFA=1) deve inserir pelo menos um registro em ClasseDeTarifa com codigo privilegio 0
--insert into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values(-1, 1, 'Nominal', 0, 0, dbo.trunc_date(getDate()));
--insert into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values( 1, 1, 'Dinheiro, Cupons', 0, 0, dbo.trunc_date(getDate()));
--Alteração
insert into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values(0, 0, 'Nominal', 0, 0, dbo.trunc_date(getDate()));
insert into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values( 1, 1, 'Dinheiro', 0, 0, dbo.trunc_date(getDate()));
insert into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values( 2, 2, 'Cupom', 0, 0, dbo.trunc_date(getDate()));
insert into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values( 3, 3, 'Cheque', 0, 0, dbo.trunc_date(getDate()));
--insert into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values( 2, 1, 'Usuario Local', 1, 0, dbo.trunc_date(getDate()));
--insert into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values(14, 14, 'Via Fácil/Sem Parar', 0, 0, dbo.trunc_date(getDate()));
--insert into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values(15, 15, 'Visa Vale Pedágio', 0, 0, dbo.trunc_date(getDate()));
--insert into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values(23, 23, 'Via Expressa', 0, 0, dbo.trunc_date(getDate()));
--insert into classedetarifa(idclassedetarifa, idmeiopagamento, descricao, codigoprivilegio, editavel, datainsercao) values(101, 101, 'Via Expressa Temp', 0, 0, dbo.trunc_date(getDate()));

----------------------------------------------------
--  Sumário Gerencial
----------------------------------------------------

-----------------------------
-- Tabela SgCfgTipoSumario -- 
-----------------------------
insert into sgcfgtiposumario(idtiposumario, descricao, datainsercao) values(1, 'Subclassificações Confirmadas', dbo.trunc_date(getDate()));
insert into sgcfgtiposumario(idtiposumario, descricao, datainsercao) values(2, 'Sobreclassificações Confirmadas', dbo.trunc_date(getDate()));
insert into sgcfgtiposumario(idtiposumario, descricao, datainsercao) values(3, 'Subclassificações Eliminadas', dbo.trunc_date(getDate()));
insert into sgcfgtiposumario(idtiposumario, descricao, datainsercao) values(4, 'Subclassificações Minimizadas', dbo.trunc_date(getDate()));
insert into sgcfgtiposumario(idtiposumario, descricao, datainsercao) values(5, 'Subclassificações Criadas', dbo.trunc_date(getDate()));
insert into sgcfgtiposumario(idtiposumario, descricao, datainsercao) values(6, 'Subclassificações Aumentadas', dbo.trunc_date(getDate()));
insert into sgcfgtiposumario(idtiposumario, descricao, datainsercao) values(7, 'Subclassificações sem Categoria Detectada Válida', dbo.trunc_date(getDate()));
insert into sgcfgtiposumario(idtiposumario, descricao, datainsercao) values(8, 'Sobreclassificações sem Categria Detectada Válida', dbo.trunc_date(getDate()));
insert into sgcfgtiposumario(idtiposumario, descricao, datainsercao) values(9, 'Confirmação de Classificação sem Categoria Detectada Válida', dbo.trunc_date(getDate()));
insert into sgcfgtiposumario(idtiposumario, descricao, datainsercao) values(10, 'Classificadas como Candidatas a Violação', dbo.trunc_date(getDate()));
insert into sgcfgtiposumario(idtiposumario, descricao, datainsercao) values(11, 'Classificadas como Candidatas a Violação que foram Confirmadas', dbo.trunc_date(getDate()));
insert into sgcfgtiposumario(idtiposumario, descricao, datainsercao) values(12, 'Classificadas como Candidatas a Violação que foram Ignoradas', dbo.trunc_date(getDate()));

---------------------------------
-- Tabela SgCfgMotivosOcupacao -- 
---------------------------------
insert into sgcfgmotivosocupacao(idocupacao, descricao, motivofechamento, datainsercao) values(3, 'Fim de Turno', 0, dbo.trunc_date(getDate()));
insert into sgcfgmotivosocupacao(idocupacao, descricao, motivofechamento, datainsercao) values(10, 'Refeição', 1, dbo.trunc_date(getDate()));
insert into sgcfgmotivosocupacao(idocupacao, descricao, motivofechamento, datainsercao) values(11, 'Troca de Turno', 1, dbo.trunc_date(getDate()));
insert into sgcfgmotivosocupacao(idocupacao, descricao, motivofechamento, datainsercao) values(12, 'Troca de Pista', 1, dbo.trunc_date(getDate()));
insert into sgcfgmotivosocupacao(idocupacao, descricao, motivofechamento, datainsercao) values(13, 'QTO (banheiro)', 1, dbo.trunc_date(getDate()));
insert into sgcfgmotivosocupacao(idocupacao, descricao, motivofechamento, datainsercao) values(14, 'Fechamento Antecipado', 1, dbo.trunc_date(getDate()));
insert into sgcfgmotivosocupacao(idocupacao, descricao, motivofechamento, datainsercao) values(15, 'Manutenção da Pista', 1, dbo.trunc_date(getDate()));


---------------------------------------
-- Tabela SgCfgCobrancaMeioPagamento -- 
---------------------------------------
insert into sgcfgcobrancameiopagamento(idcobranca, descricao, datainsercao) values(1, 'Pagante', dbo.trunc_date(getDate()));
insert into sgcfgcobrancameiopagamento(idcobranca, descricao, datainsercao) values(2, 'Isento', dbo.trunc_date(getDate()));
insert into sgcfgcobrancameiopagamento(idcobranca, descricao, datainsercao) values(3, 'Violação', dbo.trunc_date(getDate()));
insert into sgcfgcobrancameiopagamento(idcobranca, descricao, datainsercao) values(4, 'Emergência', dbo.trunc_date(getDate()));
insert into sgcfgcobrancameiopagamento(idcobranca, descricao, datainsercao) values(5, 'Desconto', dbo.trunc_date(getDate()));

-----------------------------------------
-- Tabela SgCfgDesignacaoMeioPagamento -- 
-----------------------------------------												--ALTERADO
insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(1, 1, 'Espécie', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(1, 2, 'Promessa Pagamento', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(1, 3, 'Cartão Crédito', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(1, 4, 'Cartão Débito', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(1, 5, 'AVI', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(1, 6, 'SmartCard Empresarial',  dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(1, 7, 'SmartCard Individual',  dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(1, 8, 'Espécie Us.Local', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(1, 9, 'Credito Concedido', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(1, 10, 'Visa Vale Pedágio', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(1, 11, 'Espécie Visa Vale Pedágio',dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(1, 12, 'Passagens Múltiplas', dbo.trunc_date(getDate()));

																						--ALTERADO
insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(2, 1, 'Espécie', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(2, 5, 'AVI', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(2, 6, 'SmartCard Isento',  dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(2, 12, 'Passagens Múltiplas', dbo.trunc_date(getDate()));

																						--ALTERADO
insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(3, 1, 'Pista Manual', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(3, 2, 'Pista Automática', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(3, 3, 'Pista Fechada', dbo.trunc_date(getDate()));

																						--ALTERADO
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(5, 1, 'Usuário Local', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(5, 2, 'Outros', dbo.trunc_date(getDate()));
--insert into SgcfgDesignacaoMeioPagamento (idcobranca, iddesignacao, descricao, datainsercao) values(5, 5, 'AVI', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(5, 6, 'SmartCard Empresarial',  dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(5, 7, 'SmartCard Individual',  dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(5, 8, 'Desconto por Intervalo de Tempo', dbo.trunc_date(getDate()));
--insert into sgcfgdesignacaomeiopagamento (idcobranca, iddesignacao, descricao, datainsercao) values(5, 12, 'Passagens Múltiplas', dbo.trunc_date(getDate()));

------------------------------
--Tabela SgCfgMeioPagamento -- 
------------------------------															--ALTERADO
insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(1, 1, 1, 'Dinheiro', dbo.trunc_date(getDate()), 1);
insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(1, 1, 2, 'Cupom', dbo.trunc_date(getDate()), 1);
insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(1, 1, 3, 'Cheque', dbo.trunc_date(getDate()), 1);
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(1, 2, 4, 'Promessa de Pagamento', dbo.trunc_date(getDate()), 1);
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(1, 5, 14, 'ViaFácil/SemParar', dbo.trunc_date(getDate()), 2);
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(1, 11, 1, 'Espécie Visa Vale Pedágio',dbo.trunc_date(getDate()), 1);
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(1, 1, 16, 'Cupom Vale Pedágio DBTrans', dbo.trunc_date(getdate()), 1);
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(1, 10, 15,'Visa Vale Pedágio', dbo.trunc_date(getdate()), 1);

																						--ALTERADO
insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(2, 1, 1, 'Dinheiro', dbo.trunc_date(getDate()), 1);
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(2, 5, 14, 'ViaFácil/SemParar', dbo.trunc_date(getDate()), 2);

																						--ALTERADO (Adicionado)
insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(3, 1, 1, 'Dinheiro', dbo.trunc_date(getDate()), 1);
insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(3, 1, 2, 'Cupom', dbo.trunc_date(getDate()), 2);
insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(3, 1, 3, 'Cheque', dbo.trunc_date(getDate()), 2);

																						--ALTERADO
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(5, 1, 1, 'Dinheiro', dbo.trunc_date(getDate()), 1);
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(5, 1, 2, 'Cupom', dbo.trunc_date(getDate()), 1);
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(5, 1, 3, 'Cheque', dbo.trunc_date(getDate()), 1);
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(5, 1, 4, 'Promessa de Pagamento', dbo.trunc_date(getDate()), 1);
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(5, 1, 14, 'ViaFácil/SemParar', dbo.trunc_date(getDate()), 2);

																						--ALTERADO
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(5, 2, 1, 'Dinheiro', dbo.trunc_date(getDate()), 1);
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(5, 2, 2, 'Cupom', dbo.trunc_date(getDate()), 1);
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(5, 2, 3, 'Cheque', dbo.trunc_date(getDate()), 1);
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(5, 2, 4, 'Promessa de Pagamento', dbo.trunc_date(getDate()), 1);
--insert into sgcfgmeiopagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(5, 2, 14, 'ViaFácil/SemParar', dbo.trunc_date(getDate()), 2);

--insert into SgcfgMeioPagamento (idcobranca, iddesignacao, idmeiopagamento, descricao, datainsercao, FormaPagamento) values(5, 5, 14, 'ViaFácil/SemParar', dbo.trunc_date(getDate()), 2);

--update sgcfgmeiopagamento set FormaPagamento = 1;
--update sgcfgmeiopagamento set FormaPagamento = 2 where iddesignacao = 5;
--update sgcfgmeiopagamento set FormaPagamento = 2 where idmeiopagamento in (10,11,14,19,20,100,101,102);

---------------------------
--TipoSumarioOperacional -- 
---------------------------
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values( 1, 'Recarga em Pista de Meio de Pagamento em Espécie', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values( 2, 'Sobreclassificação Cobrada Indevidamente', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values( 3, 'Sobreclassificação Cobrada do Arrecadador', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values( 4, 'Receita Espécie Dinheiro', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values( 5, 'Receita Espécie Cheque', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values( 6, 'Receita Espécie Cupom', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values( 7, 'Valor Nominal Corrigido', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values( 8, 'Valor Cobrado Corrigido', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values( 9, 'Desconto Concedido', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(10, 'Recarga em Pista de Meio de Pagamento Eletrônico', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(11, 'Valor Efetivamente Pago no Meio', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(12, 'Violação Confirmada', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(13, 'Não Pagante Confirmado', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(14, 'Isento Confirmado', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(15, 'Isento Não Confirmado', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(16, 'Violação Não Confirmada', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(17, 'Não Pagante Não Confirmado', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(18, 'Subclassificação a Cobrar do Arrecadador', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(19, 'Subclassificação a Reivindicar do Gestor', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(20, 'Crédito Compensatório de Revisão de Transações', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(21, 'Receita Recebida por Meio Pagamento', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(22, 'Isento Confirmado por Meio Pagamento', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(23, 'Desconto Não Confirmado', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(24, 'Crédito Concedido Confirmado', dbo.trunc_date(getDate()));
insert into TipoSumarioOperacional(TipoSumario, Descricao, DataInsercao) values(25, 'Crédito Concedido Não Confirmado', dbo.trunc_date(getDate()));
Insert Into Tiposumariooperacional(tiposumario, Descricao, Datainsercao) Values(26, 'Recebimento de Voucher de Não Pagante em Pista', dbo.trunc_date(getDate()));
Insert Into Tiposumariooperacional(tiposumario, Descricao, Datainsercao) Values(27, 'Recebimento de Voucher de Violação em Pista', dbo.trunc_date(getDate()));
Insert Into Tiposumariooperacional(tiposumario, Descricao, Datainsercao) Values(28, 'Desconto Concedido em Pista' , dbo.trunc_date(getDate()));
Insert Into Tiposumariooperacional(tiposumario, Descricao, Datainsercao) Values(29, 'Isento por Passagens Múltiplas' , dbo.trunc_date(getDate()));
Insert Into Tiposumariooperacional(tiposumario, Descricao, Datainsercao) Values(30, 'ISPM/ISPP não confirmado' , dbo.trunc_date(getDate()));
Insert Into Tiposumariooperacional(tiposumario, Descricao, Datainsercao) Values(31, 'Voucher de Não Pagante – Miniturno da MSG', dbo.trunc_date(getDate()));
Insert Into Tiposumariooperacional(tiposumario, Descricao, Datainsercao) Values(32, 'Voucher de Violação – Miniturno da MSG', dbo.trunc_date(getDate()));
Insert Into Tiposumariooperacional(tiposumario, Descricao, Datainsercao) Values(33, 'Voucher de Não Pagante – Miniturno do Recebimento', dbo.trunc_date(getDate()));
Insert Into Tiposumariooperacional(tiposumario, Descricao, Datainsercao) Values(34, 'Voucher de Violação – Miniturno do Recebimento ', dbo.trunc_date(getDate()));

------------------
-- Tabela Falha -- 
------------------
insert into falha(idfalha, descricaofalha, datainsercao) values(1, 'Falha de Equipamento', dbo.trunc_date(getDate()));

--------------------
-- Tipo Lacamento -- 
--------------------
insert into tipolancamentotransacao(idtipolancamento, descricao, datainsercao) values(1, 'Subclassificação a cobrar do operador', dbo.trunc_date(getDate()));
insert into tipolancamentotransacao(idtipolancamento, descricao, datainsercao) values(2, 'Subclassificação a reivindicar do gestor', dbo.trunc_date(getDate()));
insert into tipolancamentotransacao(idtipolancamento, descricao, datainsercao) values(3, 'Sobreclassificação não cobrada', dbo.trunc_date(getDate()));
insert into tipolancamentotransacao(idtipolancamento, descricao, datainsercao) values(4, 'Sobreclassificação devolver usuário', dbo.trunc_date(getDate()));
insert into tipolancamentotransacao(idtipolancamento, descricao, datainsercao) values(5, 'Sobreclassificação cobrada do operador', dbo.trunc_date(getDate()));
insert into tipolancamentotransacao(idtipolancamento, descricao, datainsercao) values(6, 'Informativo', dbo.trunc_date(getDate()));
insert into tipolancamentotransacao(idtipolancamento, descricao, datainsercao) values(7, 'Valor por meio de pagamento', dbo.trunc_date(getDate()));
insert into tipolancamentotransacao(idtipolancamento, descricao, datainsercao) values(8, 'Violação devido pelo operador', dbo.trunc_date(getDate()));
insert into tipolancamentotransacao(idtipolancamento, descricao, datainsercao) values(9, 'Não pagante devido pelo operador', dbo.trunc_date(getDate()));
insert into tipolancamentotransacao(idtipolancamento, descricao, datainsercao) values(10,'Isento devido pelo operador', dbo.trunc_date(getDate()));

-------------------------
-- Trilha De Auditoria -- 
-------------------------
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(1, 'Ajuste do registro de depósito de malotes', 1, 4, 'Id malote', 'Sequencial', 'Valor total depositado', 'Valor total recusado', null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(2, 'Processo para substituição de malote', 1, 6, 'Id(Anterior)', 'Lacre(Anterior)', 'GTV(Anterior)', 'Id(Atual)', 'Lacre(Atual)', 'GTV(Atual)', null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(3, 'Quitação de transação(Violação / Não Pagante)', 1, 4, 'Valor do recebimento da transação', 'Placa do veículo', 'Id da Declaração', 'Nº recibo', null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(4, 'Estorno de transação quitada', 1, 4, 'Valor recebido na quitação', 'Placa do veículo', 'Id da Declaração na quitação', 'Nº recibo de quitação', null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(5, 'Registro de prejuízo de Violação / Não Pagante', 1, 3, 'Valor do prejuízo', 'Nome do motorista', 'Placa do veículo', null, null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(6, 'Ajuste do registro da data de depósito dos malotes', 1, 3, 'Id malote', 'Data Anterior', 'Nova Data', null, null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(7, 'Fechamento Forçado do Caixa', 1, 3, 'Id declaração Tesoureiro que abriu caixa', 'Id do operador que fechou o caixa', 'data do fechamento forçado', null, null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(8, 'Ajuste da retirada de cupons para venda', 1, 5, 'Valor Total Anterior', 'Quantidade Anterior', 'Valor total atual', 'Quantidade Atual', 'Quantidade de registros alterados', null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(9, 'Liberar Pista para Correção de Transações', 1, 1, 'Operador desconectado', null, null, null, null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(10, 'Senha inválida', 1, 1, 'Operador', null, null, null, null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(11, 'Operador bloqueado por limite de tentativa de aces', 1, 1, 'Operador', null, null, null, null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(12, 'Alteração de senha', 1, 1, 'Operador', null, null, null, null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(13, 'Liberação de Transações de um Lote', 1, 7, 'Número do Lote', 'Quantidade de Registros', 'Valor Total Pago', 'Valor Total Recusado', 'Quantidade Reprovados', 'Valor Total Estornado', 'Valor Total Lote', null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(14, 'Reverter Senha', 1, 1, 'Operador alterado', null, null, null, null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(15, 'Abono de dívida de operador', 1, 4, 'Operador da Dívida', 'Valor da Dívida', 'Valor do Abono', 'Saldo da Conta Corrente do Operador', null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(16, 'Consolidação de prejuízo de dívida de operador', 1, 4, 'Operador da Dívida', 'Valor da Dívida', 'Valor do Prejuízo', 'Saldo da Conta Corrente do Operador', null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(17, 'Estorno de abono de dívida de operador', 1, 5, 'Operador da Dívida', 'Valor da Dívida', 'Valor Estornado', 'Novo Valor', 'Saldo da Conta Corrente do Operador', null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(18, 'Ajuste de Entrega de Troco', 1, 6, 'Papel que Recebeu o Troco', 'Operador que Recebeu o Troco', 'Valor do Troco Anterior', 'Valor do Troco Atual', 'Declaração do Responsável pela Entrega', 'Declaração do Responsável pelo Ajuste', null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(19, 'Ajuste de Área da Tesouraria', 1, 6, 'Área Ajustada', 'Declaração do Responsável', 'Saldo Anterior da Área (dinheiro)', 'Saldo Atual da Área (dinheiro)', 'Saldo Anterior da Área (cheque)', 'Saldo Atual da Área (cheque)', null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(20, 'Ajuste de declaração', 1, 7, 'Decl. Ajustada', 'Operador da Decl.', 'Decl. do Tesoureiro', 'Tesoureiro', 'Valor Anterior Dinheiro', 'Novo Valor Dinheiro', 'Valor Anterior Cheque', 'Novo Valor Cheque', null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(21, 'Ajuste de compensação', 1, 3, 'Declaração de Crédito', 'Declaração de Débito', 'Valor do Ajuste', null, null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(22, 'Processamento de Cadastro de Isentos Edital',1,7, 'Operador','Arquivo Processado', 'Data Upload', 'Data do Processamento', 'QTDERegistrosSucesso', 'QTDERegistrosErro', 'Status Processamento', null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(23, 'Processamento de Cadastro de Isentos Artesp',1,7, 'Operador','Arquivo Processado', 'Data Upload', 'Data do Processamento', 'QTDERegistrosSucesso', 'QTDERegistrosErro', 'Status Processamento', null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(24, 'Estorno de consolidação de prejuízo de dívida', 1, 5, 'Operador da Dívida', 'Valor da Dívida', 'Valor Estornado', 'Novo Valor', 'Saldo da Conta Corrente do Operador', null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(25, 'Estorno de recebimento de dívida de operador', 1, 5, 'Operador da Dívida', 'Valor da Dívida', 'Valor Estornado', 'Novo Valor', 'Saldo da Conta Corrente do Operador', null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(26, 'Estorno de desconto em folha de dívida', 1, 5, 'Operador da Dívida', 'Valor da Dívida', 'Valor Estornado', 'Novo Valor', 'Saldo da Conta Corrente do Operador', null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(27, 'Alteração da Config. da Entrega da Arrecadação', 1, 7, 'Config. Malotes', 'Arrecadador', 'Supervisor', 'Resp. Pista', 'Vendedor Cupons', 'Coletor Sangria', 'Operador POS', null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(28, 'Alteração na Alocação do Responsável por Pista', 1, 7, 'Loc/Sentido Original', 'Inicio Original', 'Fim Original', 'Loc/Sentido Alterado', 'Inicio Alterado', 'Fim Alterado', 'Responsavel Pista', null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(29, 'Desativar/Ativar Pistas',1,2,'Praça/Pista','Ação',null,null,null,null,null,null,null,null,dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(30, 'Configurações Convênio Datas Vencimento', 1, 8, 'Prazo Validade Transação Atual', 'Prazo Validade Transação Anterior', 'Dias Vencimento Provedor Atual', 'Dias Vencimento Provedor Anterior', 'Dias Vencimento Gestor Atual', 'Dias Vencimento Gestor Anterior', 'Meio Pagamento', 'Operador', null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(31, 'Ajuste Títulos', 1, 4,  'Valor Atual', 'Valor Anterior', 'Meio Pagamento', 'Operador', null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(32, 'Configurações Convênio Outros', 1, 8, 'Valor máximo Transação Atual', 'Valor máximo Transação Anterior', 'Percentual Cobrança Gestor Atual', 'Percentual Cobrança Gestor Anterior', 'Percentual Cobrança Câmara Atual', 'Percentual Cobrança Câmara Anterior', 'Meio Pagamento', 'Operador', null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(33, 'Contas Bancárias', 1, 4, 'Id Conta', 'Meio Pagamento', 'Conta', 'Operador', null, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(34,'Cheque de Usuário Bloqueado',1,2,'Identifier','Name',null,null,null,null,null,null,null,null,dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(35, 'Mensagens de Declaração ou Sangria feitas em Pista', 1, 8, 'Identificação da Declaração / Sangria', 'Código Mensagem CV', 'Sequencial da Transação', 'Sequencial da Mensagem', 'Praça, Pista, Sentido', 'Data Ocorrência', 'Mensagem de Erro', 'Instância CV', null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(36, 'Envio de e-mail', 0, 7, 'Servidor', 'Rementente', 'Destinatário Primário', 'Destinatário Secundário', 'Assunto', 'Mensagem Erro', 'Conteúdo do e-mail (apenas 50 caract)', 'null', null, null, dbo.trunc_date(getDate()));
insert into operacao(idoperacao, descricaooperacao, auditoria, qtdecomplemento, descricaocomplemento, descricaocomplemento1, descricaocomplemento2, descricaocomplemento3, descricaocomplemento4, descricaocomplemento5, descricaocomplemento6, descricaocomplemento7, descricaocomplemento8, descricaocomplemento9, datainsercao) values(37, 'Tabela de Tarifas', 1, 6, 'Operação', 'Status', 'Praça', 'Início Vigência', 'Modalidade', 'PAR1 | PAR2 | PAR3', 'null', 'null', null, null, null);

------------------------
-- Operações Do Caixa -- 
------------------------
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(01, 'Entrega de Fundo de Troco', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(02, 'Compactação', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(03, 'Descompactação', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(04, 'Compactação de Fundo de Troco', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(05, 'Criação de Malote', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(06, 'Cancelamento de Malote', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(07, 'Devolução de Fundo de Troco', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(08, 'Recebimento de Declaração', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(09, 'Recebimento de Sangria', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(10, 'Troca Entre Áreas', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(11, 'Abertura de Caixa', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(12, 'Fechamento de Caixa', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(13, 'Ajuste', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(14, 'Compensação', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(15, 'Saldo Anterior na Abertura de Caixa', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(27, 'Abertura de Malote', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(28, 'Aporte', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(30, 'Saldo Anterior na Fechamento de Caixa', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(19, 'Recebimento de Fundo de Troco', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(20, 'Troca Externa', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(21, 'Reconstituição de Fundo de Troco', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(22, 'Ajuste na Abertura do Caixa', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(23, 'Ajuste no Fechamento do Caixa', dbo.trunc_date(getDate()));
insert into OperacaoCaixa(idOperacao, descricao, dataInsercao) values(24, 'Descompactação de Fundo de Troco', dbo.trunc_date(getDate()));

--------------------------
-- Tipo Codigo Mensagem -- 
--------------------------
Insert into TipoCodigoMensagem (idtipocv, descricaotipocv, flagvisualizacao, datainsercao) Values (0, 'Inserção manual', 0, dbo.trunc_date(getDate()));
Insert into TipoCodigoMensagem (idtipocv, descricaotipocv, flagvisualizacao, datainsercao) Values (1, 'Transação veicular normal', 0, dbo.trunc_date(getDate()));
Insert into TipoCodigoMensagem (idtipocv, descricaotipocv, flagvisualizacao, datainsercao) Values (2, 'Transação veicular com anomalia', 0, dbo.trunc_date(getDate()));
Insert into TipoCodigoMensagem (idtipocv, descricaotipocv, flagvisualizacao, datainsercao) Values (3, 'Notificações de pista', 1, dbo.trunc_date(getDate()));
Insert into TipoCodigoMensagem (idtipocv, descricaotipocv, flagvisualizacao, datainsercao) Values (4, 'Retorno de comunicação com sensores', 1, dbo.trunc_date(getDate()));
Insert into TipoCodigoMensagem (idtipocv, descricaotipocv, flagvisualizacao, datainsercao) Values (5, 'Perda de comunicação com sensores', 1, dbo.trunc_date(getDate()));
Insert into TipoCodigoMensagem (idtipocv, descricaotipocv, flagvisualizacao, datainsercao) Values (6, 'Transações Financeiras', 1, dbo.trunc_date(getDate()));
Insert into TipoCodigoMensagem (idtipocv, descricaotipocv, flagvisualizacao, datainsercao) Values (7, 'Sinalização de erros', 1, dbo.trunc_date(getDate()));
Insert into TipoCodigoMensagem (idtipocv, descricaotipocv, flagvisualizacao, datainsercao) Values (8, 'Mudanças de estado na pista', 1, dbo.trunc_date(getDate()));
Insert into TipoCodigoMensagem (idtipocv, descricaotipocv, flagvisualizacao, datainsercao) Values (9, 'Ocorrências operacionais', 1, dbo.trunc_date(getDate()));
insert into TipoCodigoMensagem (idtipocv, descricaotipocv, flagvisualizacao, datainsercao) values (10, 'Heart beat', 0, dbo.trunc_date(getDate()));
insert into TipoCodigoMensagem (idtipocv, descricaotipocv, flagvisualizacao, datainsercao) values (11,'Cancelamento de Transações', 1, dbo.trunc_date(getDate()));

---------------------
-- Codigo Mensagem -- 
---------------------
insert into CodigoMensagem (CodigoCV, Descricao, Grupo, DataInsercao, FlagSumarizacao, IdTipoCV) values (-8, 'Ocorrência inserção manual ISPM/ISPP AVI', 1, getdate(), 0,0);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (-7, 'Ocorrência inserção manual crédito concedido', 1, dbo.trunc_date(getDate()), 0, 0);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (-6, 'Ocorrência inserção manual violação', 1, dbo.trunc_date(getDate()), 0, 0);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (-5, 'Ocorrência inserção manual isento', 1, dbo.trunc_date(getDate()), 0, 0);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (-4, 'Ocorrência inserção manual espécie', 1, dbo.trunc_date(getDate()), 0, 0);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (-3, 'Ocorrência violação inserção manual AVI', 1, dbo.trunc_date(getDate()), 0, 0);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (-2, 'Ocorrência inserção manual AVI', 1, dbo.trunc_date(getDate()), 0, 0);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (0, 'Ocorrência indefinida', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1, 'Mudança de data e hora', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2, 'Abertura de pista Manual', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (3, 'Abertura de pista Automatica', 1, dbo.trunc_date(getDate()), 1, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (4, 'Abertura de pista Mista', 1, dbo.trunc_date(getDate()), 1, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (5, 'TimeOut de abertura', 1, dbo.trunc_date(getDate()), 1, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (6, 'Fechamento de pista', 1, dbo.trunc_date(getDate()), 1, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (7, 'Timeout para fechamento de pista', 1, dbo.trunc_date(getDate()), 1, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (8, 'Fechamento parcial de pista', 1, dbo.trunc_date(getDate()), 1, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (9, 'Confirmação de reabertura', 1, dbo.trunc_date(getDate()), 1, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (10, 'Timeout para reabertura de pista', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (11, 'Operador Solicitou abertura', 1, dbo.trunc_date(getDate()), 1, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (12, 'Operador Solicitou fechamento', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (13, 'Operador Solicitou pausa', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (14, 'Operador Solicitou reabertura', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (15, 'Código do operador errado duas vezes', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (16, 'Alteração de tarifas', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (17, 'Timeout confirm. de mudança de tarifas', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (18, 'Entrada em manutenção', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (19, 'Saída de manutenção', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (20, 'Saída manutenção irregular (bypass direto)', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (21, 'Entrada em manutenção abortada por timeout', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (22, 'Timeout na saída de manutenção', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (23, 'Entrada em emergencia', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (24, 'Saída de emergencia', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (25, 'Veículo atinge det sem classif', 1, dbo.trunc_date(getDate()), 0, 9);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (26, 'Timeout de saída de veículo', 1, dbo.trunc_date(getDate()), 0, 9);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (27, 'Classificação cancelada após confirmação', 1, dbo.trunc_date(getDate()), 0, 11);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (28, 'Classificação cancelada após emissão de recibo', 1, dbo.trunc_date(getDate()), 0, 11);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (29, 'Reclassificação (modo com conf.)', 1, dbo.trunc_date(getDate()), 0, 9);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (30, 'Impressão extra de recibo', 1, dbo.trunc_date(getDate()), 0, 9);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (31, 'Timeout confirm. de classificação', 1, dbo.trunc_date(getDate()), 0, 9);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (32, 'Chave da caixa de pista acionada', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (33, 'Chave da caixa de pista inativa', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (34, 'Perda de comunicação com a CS', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (35, 'Retorno da comunicação com a CS', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (36, 'Perda de comunicação com o Serv', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (37, 'Retorno da comunicação com o Serv', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (38, 'Mudança de estado não autorizada', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (39, 'Arquivo local de ocorrências corrompido', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (40, 'Arquivo remoto de ocorrências corrompido', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (41, 'Pouco espaço no disco local', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (42, 'Falha em disco remoto', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (43, 'Falha em disco local', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (44, 'Arrecadador confirmou sangria', 1, dbo.trunc_date(getDate()), 0, 6);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (45, 'Detectado veículo sem TAG', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (46, 'CV ligado', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (47, 'Erro fatal na inicialização do módulo de cadastro', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (48, 'Falha na leitura do cad. não gerada por ausência rede', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (49, 'Pedal de alarme sentido 1 acionado', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (50, 'Pedal de alarme sentido 2 acionado', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (51, 'Acionado sensor da extra large', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (52, 'Falha na leitura das tarifas', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (53, 'Lido novo arquivo de tarifas', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (54, 'Falha na leitura das operadores', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (55, 'Lido novo arquivo de operadores', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (56, 'Operador deu login', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (57, 'Operador deu logout', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (58, 'Classificação cancelada sem confirmação', 1, dbo.trunc_date(getDate()), 0, 11);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (59, 'Veículo desviado para a pista manual', 1, dbo.trunc_date(getDate()), 0, 9);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (60, 'LMC Local ativado', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (61, 'LMC Local desativado', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (62, 'Veículo nâo autorizado na automática', 1, dbo.trunc_date(getDate()), 0, 9);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (63, 'Veículo nâo autorizado na manual', 1, dbo.trunc_date(getDate()), 0, 9);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (64, 'Caracter proibido na String do TAG', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (65, 'Dado incompleto na String do TAG', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (66, 'Tamanho incorreto no campo da String do TAG', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (67, 'Dado chave incorreto na String do TAG', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (68, 'Carga de Chaves do Cartão Smart Card', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (69, 'Pedido de Reset do CV', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (70, 'Ocorrência de Heart Beat', 1, dbo.trunc_date(getDate()), 0, 10);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (71, 'Ocorrência de mudança de instância do CV', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (72, 'Ocorrênca de troca de arquivo de mensagem local e da rede', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (73, 'Ocorrência do arquivo de sequenciais inexistente', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (74, 'Anomalia de detecção/classificação - Dinheiro', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (75, 'Classificação desbloqueada - Dinheiro', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (76, 'Transação Normal - Dinheiro', 1, dbo.trunc_date(getDate()), 0, 1);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (77, 'Anomalia de detceção/classificação - Isento', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (78, 'Classificação desbloqueada - Isento', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (79, 'Transação Normal - Isento', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (80, 'Anomalia de detecção/classificação - Não Pago', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (81, 'Classificação desbloqueada - Isento - Não Pago', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (82, 'Transação Normal - Não Pago', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (83, 'Anomalia de detecção/classificação - Cartão Smart', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (84, 'Classificação desbloqueada - Cartão Smart', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (85, 'Transação Normal - Cartão Smart', 1, dbo.trunc_date(getDate()), 0, 1);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (86, 'Carga do Cartao Smart', 1, dbo.trunc_date(getDate()), 0, 6);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (87, 'Ocorrencia de Sangria', 1, dbo.trunc_date(getDate()), 0, 6);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (88, 'Anomalia de detecção/classificação - TAG', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (89, 'Transação Normal - TAG', 1, dbo.trunc_date(getDate()), 0, 1);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (90, 'Anomalia de detecção/classificação - VVP', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (91, 'Classificação desbloqueada - VVP', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (92, 'Transação Normal - VVP', 1, dbo.trunc_date(getDate()), 0, 1);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (93, 'Anomalia de deteção/classificação - CARTÃO', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (94, 'Classificação desbloqueada - CARTÃO', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (95, 'Transação Normal - CARTÃO', 1, dbo.trunc_date(getDate()), 0, 1);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (96, 'Anomalia de deteção/classificação - ISPM/ISPP', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (97, 'Classificação desbloqueada - ISPM/ISPP', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (98, 'Transação Normal - ISPM/ISPP', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (99, 'Falha na gravação de fotos no servidor de imagem', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (100, 'Retorno na gravação de fotos no servidor de imagem', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (101, 'Atraso na gravação de fotos no servidor de imagem', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (102, 'Anomalia de detecção/classificação - Violador', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (103, 'Transação normal cupom', 1, dbo.trunc_date(getDate()), 0, 1);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (104, 'Transação normal cheque', 1, dbo.trunc_date(getDate()), 0, 1);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (105, 'Transação anomola cupom', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (106, 'Transação anomala cheque', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (107, 'Classificação desbloqueada - Cupom', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (108, 'Classificação desbloqueada - Cheque', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (109, 'Abertura de pista automática pela CS', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (110, 'Falha Fatal', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (111, 'Anomalia de det/clas - Usuário c/ desconto', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (112, 'Classificação desbloqueada - Usuário c/ desconto', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (113, 'Transação Normal - Usuário c/ desconto', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (114, 'Transação Anômala - Entrada Isento Retorno', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (115, 'Classificação desbloqueada - Entrada Isento Retorno', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (116, 'Transação Normal - Entrada Isento Retorno', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (117, 'Transação Anômala - Saída Isento Retorno', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (118, 'Classificação Desbloqueada - Saida Isento Retorno', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (119, 'Transação Normal - Saída Isento Retorno', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (120, 'Pagamento em Pista', 1, dbo.trunc_date(getDate()), 0, 6);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (121, 'Ocorrência de bateria no-break ativada', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (122, 'Ocorrência de bateria no-break desativada', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (123, 'Ocorrência de finalização bateria fraca', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (124, 'Loop OFF Falha Barreira', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (125, 'Loop ON Falha Barreira', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (126, 'Ocorrência de Nível de Memória Acima do Normal', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (127, 'Transação Normal - Tag em Pista Manual', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (128, 'Transação Anômala DET <> CLA - Tag em Pista Manual', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (129, 'Classificação Desbloqueada - Tag em Pista Manual', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (130, 'Isento Passagens Consecutivas - Dif Det/Cla', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (131, 'Isento Passagens Consecutivas - Desbloqueado', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (132, 'Isento Passagens Consecutivas - Transação Normal', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (133, 'Recebimento de Novo Cadastro', 1, dbo.trunc_date(getDate()), 0, 3);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (134, 'Entrada em Modo de Operação Degradada', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (135, 'Saída do Modo de Operação Degradada', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (136, 'Time out ao efetuar Reset da antena AVI', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (137, 'Antena AVI sem comunicação  com o CV', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (138, 'Função LPR ativada pela CS', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (139, 'Função LPR desativada pela CS', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (140, 'Passagem de Moto em Pista Exclusiva', 1, dbo.trunc_date(getDate()), 1,     9);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (141, 'Passagem de Veículo Extra-Largo em Pista Exclusiva', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (142, 'Excedido a quantidade configurada de Log Exception', 1, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (143, 'Classificação desbloqueada - TAG Pista Mista Não Exclusiva', 1, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (144, 'Fechamento de Miniturno', 1, dbo.trunc_date(getDate()), 0, 8);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (145, 'Retorno de comunicação com antena DBTrans', 0, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (146, 'Falha de comunicação com antena DBTrans', 0, dbo.trunc_date(getDate()), 0, 7);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (147, 'Loop acionado sem transação', 0, dbo.trunc_date(getDate()), 0, 9);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (148, 'Veículo parado sobre os sensores', 0, dbo.trunc_date(getDate()), 0, 9);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (149, 'Retorno após acionar sensores', 0, dbo.trunc_date(getDate()), 0, 9);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (150, 'Sensores acionados em marchaa ré', 0, dbo.trunc_date(getDate()), 0, 9);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (151, 'Transação Normal - Crédito Concedido', 0, dbo.trunc_date(getDate()), 0, 1);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (152, 'Anomalia de detecção/classificação - Crédito Concedido', 0, dbo.trunc_date(getDate()), 0, 2);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (153, 'Classificação desbloqueada - Crédito Concedido', 0, dbo.trunc_date(getDate()), 0, 2);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (154, 'Carga do Cartão RFID', 1, dbo.trunc_date(getDate()), 0, 6);
Insert into Codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (155, 'Veículo ejetado da Pista Expressa',1, dbo.trunc_date(getDate()), 0, 9);
Insert into Codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (156, 'Limpeza da Fila da Pista Expressa',1, dbo.trunc_date(getDate()), 0,7);
Insert into Codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (157, 'Cheque de Usuário Bloqueado',1, dbo.trunc_date(getDate()), 0,9);
insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (158, 'Pagamento de Voucher',1, dbo.trunc_date(getdate()), 0,6);
insert into CodigoMensagem (CodigoCV, Descricao, Grupo, DataInsercao, FlagSumarizacao, IdTipoCV) values (159 , 'Transação Normal - Cupom DBTrans', 1, dbo.trunc_date(getdate()) , 0,1);
insert into CodigoMensagem (CodigoCV, Descricao, Grupo, DataInsercao, FlagSumarizacao, IdTipoCV) values (160 , 'Transação Anômala - Cupom DBTrans',1 , dbo.trunc_date(getdate()), 0 ,2);
insert into CodigoMensagem (CodigoCV, Descricao, Grupo, DataInsercao, FlagSumarizacao, IdTipoCV) values (161 , 'Classificação desbloqueada - Cupom DBTrans', 1, dbo.trunc_date(getdate()), 0,2);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (162, 'Declaração / Sangria em Pista com Malote', 1, dbo.trunc_date(getdate()), 0, 6);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (163, 'Pacotes da Declaração / Sangria em Pista com Malote', 1, dbo.trunc_date(getdate()), 0, 6);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (164, 'Cupons da Declaração / Sangria em Pista com Malote', 1, dbo.trunc_date(getdate()), 0, 6);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (165, 'Malote em Pista', 1, dbo.trunc_date(getdate()), 0, 6);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (166, 'Velocidade Máxima Atingida', 1, dbo.trunc_date(getdate()), 0, 7);
Insert into codigomensagem (CODIGOCV, DESCRICAO, IDTIPOCV, GRUPO, DATAINSERCAO, FLAGSUMARIZACAO) Values (167, 'Classificação Desbloqueada - Interswitch', 2, 1, dbo.TRUNC_DATE(GETDATE()),  0);
Insert into codigomensagem (CODIGOCV, DESCRICAO, IDTIPOCV, GRUPO, DATAINSERCAO, FLAGSUMARIZACAO) Values (168, 'Transação Normal - Interswitch', 1, 1, dbo.TRUNC_DATE(GETDATE()),  0);
Insert into codigomensagem (CODIGOCV, DESCRICAO, IDTIPOCV, GRUPO, DATAINSERCAO, FLAGSUMARIZACAO) Values (169, 'Anomalia de Detecção/classificação - Interswitch', 2, 1, dbo.TRUNC_DATE(GETDATE()),  0);
Insert into codigomensagem (CODIGOCV, DESCRICAO, IDTIPOCV, GRUPO, DATAINSERCAO, FLAGSUMARIZACAO) Values (170, 'Recarga com Cartão de Débito Interswitch', 6, 1, dbo.TRUNC_DATE(GETDATE()),  0);
Insert into codigomensagem (CODIGOCV, DESCRICAO, IDTIPOCV, GRUPO, DATAINSERCAO, FLAGSUMARIZACAO) Values (171, 'Placa detectada pelo OCR não atende os requisitos', 7, 1, dbo.TRUNC_DATE(GETDATE()),  0);
Insert into codigomensagem (CODIGOCV, DESCRICAO, IDTIPOCV, GRUPO, DATAINSERCAO, FLAGSUMARIZACAO) Values (172, 'A foto/leitura da placa não foi disponibilizada a tempo', 7, 1, dbo.TRUNC_DATE(GETDATE()),  0);
Insert into codigomensagem (CODIGOCV, DESCRICAO, IDTIPOCV, GRUPO, DATAINSERCAO, FLAGSUMARIZACAO) Values (173, 'Placa detectada pelo OCR atende os requisitos configurados', 7, 1, dbo.TRUNC_DATE(GETDATE()),  0);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (174, 'Cadastro de midia com mais registros que configuração do ini', 1, dbo.trunc_date(getdate()), 0, 7);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (175, 'Cad. midia corrompido cabeçalho c/ menos registros que corpo', 1, dbo.trunc_date(getdate()), 0, 7);

Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1000, 'Loop saída manual OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1001, 'Loop cabine OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1002, 'Sensor eixo 1 manual OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1003, 'Sensor eixo 2 manual OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1004, 'Sensor eixo 3 manual OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1005, 'Sensor eixo 4 manual OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1006, 'Sensor rodagem 1 manual OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1007, 'Sensor rodagem 2 manual OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1008, 'IT manual OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1009, 'VAS manual OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1010, 'VES manual OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1011, 'Loop saída automática OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1012, 'Loop entrada automática OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1013, 'Loop foto automática OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1014, 'Barreira saída automática OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1015, 'Barreira entrada automatica OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1016, 'Sensor eixo 1 automática sentido 1 OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1017, 'Sensor eixo 2 automática sentido 1 OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1018, 'Sensor eixo 3 automática sentido 1 OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1019, 'Sensor eixo 4 automática sentido 1 OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1020, 'Sensor rodagem 1 automática sentido 1 OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1021, 'Sensor rodagem 2 automática sentido 1 OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1022, 'IT automática OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1023, 'VAS automática OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1024, 'VES automática OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1025, 'ANTENA1 TAG OK', 1, dbo.trunc_date(getDate()), 0,  4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1026, 'ANTENA2 TAG OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1027, 'AVC OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1028, 'PLC OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1029, 'NoBreak OK', 1, dbo.trunc_date(getDate()), 0, 4);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1030, 'Loop corredor de isentos OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (1031, 'ANTENA3 TAG OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1032, 'Impressora OK', 1, dbo.trunc_date(getDate()), 0,4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1033, 'Leitora SmarCard OK', 1, dbo.trunc_date(getDate()), 0,4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1034, 'Leitora VVP OK', 1, dbo.trunc_date(getDate()), 0,4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1035, 'VBS Automatica OK', 1, dbo.trunc_date(getDate()), 0,4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1036, 'VAS Extra Largo OK', 1, dbo.trunc_date(getDate()), 0,4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1037, 'Sensor de Altura L OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1038, 'Sensor de Altura H OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1039, 'Impressora Adicional 1 OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1040, 'Impressora Adicional 2 OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1041, 'Gravação no disco remoto OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1042, 'Disco local quase cheio OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1043, 'Disco local cheio OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1044, 'Disco local em falha OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1045, 'Comunicação com a CS OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1046, 'Loop 1 ETC OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1047, 'Loop 2 ETC OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1048, 'Loop 3 ETC OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1049, 'Loop 4 ETC OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1050, 'Loop 5 ETC OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1051, 'Barreira 1 ETC OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1052, 'Barreira 2 ETC OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1053, 'Barreira 3 ETC OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1054, 'Barreira 4 ETC OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1055, 'Barreira 5 ETC OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1056, 'IT Letras Grandes OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1057, 'Ventilador do Gabinete OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1058, 'Pinpad OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1059, 'Detector de velocidade OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1060, 'Sensor eixo suspenso manual 1 OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1061, 'Sensor eixo suspenso manual 2 OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1062, 'Sensor eixo suspenso auto 1 OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1063, 'Sensor eixo suspenso auto 2 OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (1064, 'Leitora Interswitch Ok',         1, dbo.trunc_date(getDate()), 0, 4);

Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2000, 'Loop saída manual não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2001, 'Loop cabine não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2002, 'Sensor eixo 1 manual não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2003, 'Sensor eixo 2 manual não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2004, 'Sensor eixo 3 manual não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2005, 'Sensor eixo 4 manual não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2006, 'Sensor rodagem 1 manual não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2007, 'Sensor rodagem 2 manual não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2008, 'IT manual não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2009, 'VAS manual não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2010, 'VES manual não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2011, 'Loop saida automatica não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2012, 'Loop entrada automatica não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2013, 'Loop foto automatica não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2014, 'Barreira saida automatica não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2015, 'Barreira entrada automatica não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2016, 'Sensor eixo 1 automática sentido 1 não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2017, 'Sensor eixo 2 automática sentido 1 não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2018, 'Sensor eixo 3 automática sentido 1 não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2019, 'Sensor eixo 4 automática sentido 1 não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2020, 'Sensor rodagem 1 automática sentido 1 não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2021, 'Sensor rodagem 2 automática sentido 1 não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2022, 'IT automática não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2023, 'VAS automática não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2024, 'VES automatica não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2025, 'ANTENA1 TAG não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2026, 'ANTENA2 TAG não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2027, 'AVC não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2028, 'PLC não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2029, 'NoBreak não OK', 1, dbo.trunc_date(getDate()), 0, 5);
Insert into CodigoMensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2030, 'Loop corredor de isentos não OK', 1, dbo.trunc_date(getDate()), 0, 5);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) values (2031, 'ANTENA3 TAG NÃO OK', 1, dbo.trunc_date(getDate()), 0, 5);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2032, 'Impressora NOK', 1, dbo.trunc_date(getDate()), 0,4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2033, 'Leitora SmarCard NOK', 1, dbo.trunc_date(getDate()), 0,4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2034, 'Leitora VVP não OK', 1, dbo.trunc_date(getDate()), 0,4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2035, 'VBS Automatica NOK', 1, dbo.trunc_date(getDate()), 0,4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2036, 'VAS Extra Largo NOK', 1, dbo.trunc_date(getDate()), 0,4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2037, 'Sensor de Altura L não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2038, 'Sensor de Altura H não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2039, 'Impressora Adicional 1 não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2040, 'Impressora Adicional 2 não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2041, 'Gravação no disco remoto não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2042, 'Disco local quase cheio não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2043, 'Disco local cheio não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2044, 'Disco local em falha não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2045, 'Comunicação com a CS não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2046, 'Loop 1 ETC não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2047, 'Loop 2 ETC não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2048, 'Loop 3 ETC não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2049, 'Loop 4 ETC não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2050, 'Loop 5 ETC não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2051, 'Barreira 1 ETC não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2052, 'Barreira 2 ETC não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2053, 'Barreira 3 ETC não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2054, 'Barreira 4 ETC não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2055, 'Barreira 5 ETC não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2056, 'IT Letras Grandes não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2057, 'Ventilador do Gabinete não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2058, 'Pinpad não OK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2059, 'Detector de velocidade NOK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2060, 'Sensor eixo suspenso manual 1 NOK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2061, 'Sensor eixo suspenso manual 1 NOK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2062, 'Sensor eixo suspenso auto 1 NOK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2063, 'Sensor eixo suspenso auto 2 NOK', 1, dbo.trunc_date(getDate()), 0, 4);
insert into codigomensagem (codigocv, descricao, grupo, datainsercao, flagsumarizacao, idtipocv) Values (2064, 'Leitora Interswitch não Ok', 1, dbo.trunc_date(getDate()), 0, 4);

-------------------------------
-- Grupo de Eventos da Pista -- 
-------------------------------
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (1, 'Violações', 10, 10, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (2, 'Abertura', 0, 20, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (3, 'Fech. Pista', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (4, 'loop manual', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (5, 'loop cabine', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (6, 'sensor det', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (7, 'IT', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (8, 'sist. img', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (9, 'loop auto', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (10, 'l ent auto', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (11, 'l foto auto', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (12, 'barr óptica', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (13, 'antena AVI', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (14, 'AVC', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (15, 'nobreak', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (16, 'l cor isen', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (17, 'impressora', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (18, 'leit Scard', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (19, 'leitora VVP', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (20, 'disco', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (21, 'comunic CS', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (22, 'loop 1 ETC', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (23, 'loop 2 ETC', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (24, 'loop 3 ETC', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (25, 'loop 4 ETC', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (26, 'loop 5 ETC', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (27, 'Vent. Gabin', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (28, 'Pinpad', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (29, 'Dect. vel.', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (30, 'e susp man', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (31, 'e susp auto', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (32, 'Comun Serv', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (33, 'Dado Antena', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (34, 'Arq Corromp', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (35, 'Falha Fatal', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (36, 'Manutenção', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (37, 'Emergência', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (38, 'Ret comunic', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (39, 'leitura cad', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (40, 'Canc trans', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (41, 'Reinício CV', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (42, 'F. memória', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (43, 'M degradado', 100, 1, 60, dbo.trunc_date(getDate()));
insert into grupoeventopista (idgrupo, descricao, porcentagemfluxo, numeroocorrencias, basetempo, datainsercao) values (44, 'OCR', 100, 1, 60, dbo.trunc_date(getDate()));

------------------------
-- Grupo de mensagens --  
------------------------
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(1, 25, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(2, 2, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(2, 3, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(2, 4, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(2, 9, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(3 ,6, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(3, 7, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(3, 8, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(4,2000, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(5,2001, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(6,2002, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(6,2003, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(6,2004, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(6,2005, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(6,2006, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(6,2007, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(6,2016, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(6,2017, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(6,2018, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(6,2019, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(6,2020, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(6,2021, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(6,2037, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(6,2038, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(7,2008, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(7,2022, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(7,2056, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(8,99, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(8,101, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(8,2009, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(8,2010, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(8,2023, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(8,2024, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(8,2035, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(8,2036, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(9,2011, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(10,2012, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(11,2013, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(12,124, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(12,125, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(12,2014, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(12,2015, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(12,2051, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(12,2052, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(12,2053, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(12,2054, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(12,2055, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(13,137, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(13,146, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(13,2025, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(13,2026, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(13,2031, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(14,2027, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(14,2028, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(15,121, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(15,122, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(15,123, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(15,2029, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(16,2030, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(17,2032, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(17,2039, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(17,2040, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(18,2033, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(19,2034, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(20,41, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(20,42, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(20,43, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(20,2041, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(20,2042, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(20,2043, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(20,2044, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(21,34, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(21,2045, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(22,2046, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(23,2047, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(24,2048, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(25,2049, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(26,2050, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(27,2057, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(28,2058, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(29,2059, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(30,2060, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(30,2061, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(31,2062, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(31,2063, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(32,36, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(33,39, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(33,40, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(33,175, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(34,64, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(34,65, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(34,66, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(34,67, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(35,47, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(35,110, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(36,18, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(36,19, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(36,20, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(36,21, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(36,22, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(37,23, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(37,24, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(38,49, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(38,50, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(39,48, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(39,52, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(39,54, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(39,174, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(40,27, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(40,28, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(40,58, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(41,69, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(41,71, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(42,126, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(43,134, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(44,171, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(44,172, dbo.trunc_date(getDate()));
insert into gruposmensagens(idgrupo, codigocv, datainsercao) values(44,173, dbo.trunc_date(getDate()));

-------------------
-- Ação Correção -- 
-------------------
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(0, 'Sem Correção', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(1, 'Violação Confirmada', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(2, 'Violação Não Confirmada', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(3, 'Novo Meio Pagto', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(4, 'Transação Ignorada', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(5, 'Mídia Atribuída', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(6, 'Meio Pagto Confirmado', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(7, 'Meio Pagto Não Confirmado', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(8, 'Categoria Corrigida', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(9, 'Isento Confirmado', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(10, 'Isento Não Confirmado', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(11, 'Mídia Aceita', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(12, 'Desconto confirmado', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(13, 'Desconto não confirmado', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(14, 'Isento de Retorno Confirmado', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(15, 'Isento de Retorno Não Confirmado', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(16, 'Crédito Concedido Confirmado', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(17, 'Crédito Concedido Não Confirmado', dbo.trunc_date(getDate()));
--18 nao tem
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(19, 'Violação Quitada',dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(20, 'ISPM/ISPP confirmado', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(21, 'ISPM/ISPP não confirmado', dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(22, 'Extra-Largo Confirmado',dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(23, 'Extra-Largo Não Confirmado',dbo.trunc_date(getDate()));
insert into acaocorrecao(idacaocorrecao, descricao, datainsercao) values(24, 'Voucher Recebido', dbo.trunc_date(getDate()));

---------------------
-- Motivo Correção -- 
---------------------
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(0, 'Sem Correção', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(1, 'Diferença det cla', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(2, 'Timeout', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(3, 'Violação', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(4, 'Não Pagante', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(5, 'Isento', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(6, 'Tag Bloqueado', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(7, 'Tag sem veículo', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(8, 'Desbloqueio', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(9, 'Desbloqueio de Isento', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(10, 'Desbloqueio de Não Pagante', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(11, 'Isento com Timeout', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(12, 'Não Pagante com Timeout', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(13, 'Tarifa diferenciada', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(14, 'Isento de Retorno', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(15, 'Transação em Emergência', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(16, 'Crédito Concedido', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(17, 'Crédito Concedido com Timeout', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(18, 'Desbloqueio de Crédito Concedido', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(19, 'Mídia sem Cad. Complementar',dbo.trunc_date(getDate()));    
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(20, 'ISPM/ISPP', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(21, 'Falha de Equipamento', dbo.trunc_date(getDate()));
insert into motivocorrecao(idmotivocorrecao, descricao, datainsercao) values(22, 'Extra-Largo', dbo.trunc_date(getDate()));


-----------------------
-- Relatórios Grupos -- 
-----------------------
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(1, 76017, 'Abonos', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(2, 76017, 'Ajuste', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(3, 76017, 'Auditoria', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(4, 76017, 'Tesouraria', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(5, 76017, 'Consolidação', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(6, 76017, 'Cupons', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(7, 76017, 'Desempenho Operacional', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(8, 76017, 'Dívidas de Operadores', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(9, 76017, 'Dívidas de Usuários', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(10, 76017, 'Ocorrências e Falhas', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(11, 76017, 'Fechamento da Arrecadação', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(12, 76017, 'Malotes', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(13, 76017, 'Receita', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(14, 76017, 'Reconciliação', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(15, 76017, 'Tráfego', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(16, 76017, 'Recibos', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(17, 76017, 'Termos', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(18, 76017, 'Interoperação', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(19, 76017, 'Configurações', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(20, 76017, 'Estatísticos', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(21, 76017, 'Títulos', dbo.trunc_date(getDate()));
insert into relatoriogrupo(idgrupo, idorigem, titulo, datainsercao) values(22, 76017, 'Lotes', dbo.trunc_date(getDate()));

----------------------
-- Relatórios Lista -- 
----------------------
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(1, 'Papéis', 'Geral', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(2, 'Operadores', 'Geral', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(3, 'Arrecadadores', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(4, 'Supervisores', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(5, 'Tesoureiros', 'Gestão de Arrecadação', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(6, 'Operação Auditável', 'Geral', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(7, 'Praças', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(8, 'Pistas', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(9, 'Falhas', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(10, 'Dívidas de Usuários - Situação de Pagamento', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(11, 'Dívidas de Usuários - Com ou sem multa', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(12, 'Áreas da Tesouraria', 'Geral', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(13, 'Classificação de Transações quanto à Cobrança', 'Pédagio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(14, 'Declarantes', 'Pédagio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(15, 'Contas', 'Gestão de Arrecadação', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(16, 'Transportadoras', 'Gestão de Arrecadação', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(17, 'Ordem de Apresentação Malotes', 'Gestão de Arrecadação', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(18, 'Condições de Pagamento', 'Dívidas de Usuários', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(19, 'Tipos de Isentos', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(20, 'Tipos de Veículos', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(21, 'Gestores', 'Interoperação', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(22, 'Meios de Pagamento', 'Interoperação', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(23, 'Credores','Interoperação',dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(24, 'Devedores','Interoperação',dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(25, 'Estado TF','Interoperação',dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(26, 'Emissores','Interoperação',dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(27, 'Status CGMP','Interoperação',dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(28, 'Status SGMP','Interoperação',dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(29, 'Status CC-Rio','Interoperação',dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(30, 'Status de Malotes','Malotes',dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(31, 'Etapas do Processo da Interoperação','Interoperação',dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(32, 'Quinzena', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(33, 'Classificação de Transações quanto à Cobrança e Designação', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(34, 'Pistas e praças', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(35, 'Meio Pagamento CC', 'Câmara de Compensação', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(36, 'Provedor de Serviços', 'Câmara de Compensação', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(37, 'Lotes', 'Câmara de Compensação', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(38, 'Praças e Pistas', 'Tráfego', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(39, 'Ordem de Apresentação Reconciliação da Arrecadação', 'Reconciliação', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(40, 'Tipos de Cadastros', 'Geral', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(41, 'Lista Genérica', 'Geral', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(42, 'Fontes do Repasse', 'Interoperação', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(43, 'Códigos de Mensagens', 'Ocorrências e Falhas', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) Values(44, 'Situação Cadastro', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) Values(45, 'Perfis', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) Values(46, 'Cargos', 'Pedágio', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(47, 'Emissores', 'Interoperação', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(48, 'Malotes', 'Malotes', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(49, 'Status Perfil', 'Interoperação', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(50, 'Meios de Pagamento com Desconto','Interoperação', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(51, 'Tipos de Ocorrências', 'Ocorrências e Falhas', dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(52, 'Status Lote - DBtrans','Geral',dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(53, 'Lista de tipo usuario','Geral',dbo.trunc_date(getDate()));
insert into relatoriolista(idlista, descricao, grupo, datainsercao) values(54, 'Emissores', 'Interoperação', dbo.trunc_date(getDate()));

----------------
-- Relatórios --
----------------
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1001, 2, 76017, 'Ajuste de Declarações', dbo.trunc_date(getDate()), '1.0.0', 'ajusteDeclaracaoRel.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1002, 3, 76017, 'Analítico de Correção de Transações', dbo.trunc_date(getDate()), '1.0.0', 'analiticocorrtran.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1003, 6, 76017, 'Analítico de Cupons Recebidos', dbo.trunc_date(getDate()), '1.0.0', 'AnaliticoCuponsRecebidosRel.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1004, 4, 76017, 'Lançamentos no Caixa', dbo.trunc_date(getDate()), '1.0.0', 'lancamentoscaixa.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1005, 4, 76017, 'Custódia', dbo.trunc_date(getDate()), '1.0.0', 'custodia.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1006, 6, 76017, 'Analítico de Venda de Cupons', dbo.trunc_date(getDate()), '1.0.0', 'analiticovendacupom.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1007, 5, 76017, 'Consolidação de Declaração de Arrecadador', dbo.trunc_date(getDate()), '3.0.0', 'ConsolidacaoDeclaracaoArrecadador.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1008, 5, 76017, 'Consolidação de Declaração de Supervisor', dbo.trunc_date(getDate()), '1.0.0', 'ConsolidacaoDeclaracaoSupervisor.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1009, 5, 76017, 'Consolidação de Declaração de Responsável por Pista', dbo.trunc_date(getDate()), '1.0.0', 'ConsolidacaoDeclaracaoResponsavelPista.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1010, 13, 76017, 'Arrecadação Mensal', dbo.trunc_date(getDate()), '3.0.0', 'arrecmensal.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1011, 6, 76017, 'Compensação de Cupons', dbo.trunc_date(getDate()), '1.0.0', 'CompensacaoCuponsRel.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1012, 5, 76017, 'Consolidação de Declaração de Coletor de Sangria', dbo.trunc_date(getDate()), '1.0.0', 'ConsolidacaoDeclaracaoColetorSangria.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1013, 5, 76017, 'Consolidação de Vendedor de Cupons', dbo.trunc_date(getDate()), '1.0.0', 'consoldeclvend.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1014, 1, 76017, 'Controle de Abonos', dbo.trunc_date(getDate()), '1.0.0', 'controleabonos.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1015, 15, 76017, 'Demanda Média Diária', dbo.trunc_date(getDate()), '3.0.0', 'demandadiaria.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1016, 7, 76017, 'Desempenho Operacional Arrecadador',  dbo.trunc_date(getDate()), '1.0.0', 'desempenhooperaarrecad.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1017, 10, 76017, 'Falhas',  dbo.trunc_date(getDate()), '3.0.0', 'relatorioFalha.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1018, 4, 76017, 'Lançamentos da Área - Detalhado',  dbo.trunc_date(getDate()), '1.0.0', 'lancamentosareadetalhado.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1019, 4, 76017, 'Lançamentos da Área - Sintético', dbo.trunc_date(getDate()), '1.0.0', 'lancamentosareasintetico.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1020, 7, 76017, 'Melhor Hora do Arrecadador', dbo.trunc_date(getDate()), '1.0.0', 'MelhorHoraArrecadadorRel.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1021, 14, 76017, 'Reconciliação da Declaração - Coletor de Sangria', dbo.trunc_date(getDate()), '1.0.0', 'reconcdeclarreccolsangria.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1022, 14, 76017, 'Reconciliação da Declaração - Vendedor de Cupons', dbo.trunc_date(getDate()), '1.0.0', 'reconcdeclvend.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1023, 7, 76017, 'Tempo Médio de Atendimento - Analítico', dbo.trunc_date(getDate()), '3.0.0', 'tempomedioatendanalitico.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1024, 15, 76017, 'Transações AVI com Categoria Discrepante', dbo.trunc_date(getDate()), '1.0.0', 'TransacaoAVICategoriaDiscrepanteRel.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1025, 3, 76017, 'Trilha de Auditoria', dbo.trunc_date(getDate()), '1.0.0', 'trilhaauditoria.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1026, 6, 76017, 'Consolidação de Venda de Cupons', dbo.trunc_date(getDate()), '3.0.0', 'ConsolidacaoDeVendaDeCupons.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1027, 8, 76017, 'Dívidas de Operadores', dbo.trunc_date(getDate()), '1.0.0', 'dividasoperadores.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1028, 9, 76017, 'Violações', dbo.trunc_date(getDate()), '1.0.0', 'violacoes.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1029, 5, 76017, 'Consolidação de Declaração de Tesoureiro', dbo.trunc_date(getDate()), '1.0.0', 'ConsolidacaoDeclaracaoTesoureiro.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1030, 11, 76017, 'Demonstrativo Financeiro da Arrecadação', dbo.trunc_date(getDate()), '1.0.0', 'DemonstrativoFinanceiroDaArrecadacao.jasper', 0, 1);
Insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1031, 13, 76017, 'Receita e Tráfego', dbo.trunc_date(getDate()), '1.0.0', 'TrafegoVinculadoReceitaCalculada.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1032, 14, 76017, 'Reconciliação da Arrecadação - Responsável por Pista', dbo.trunc_date(getDate()), '1.0.0', 'reconcarrecresp.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1033, 14, 76017, 'Reconciliação da Arrecadação - Supervisor', dbo.trunc_date(getDate()), '1.0.0', 'reconcarrecsuper.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1034, 14, 76017, 'Reconciliação da Arrecadação - Vendedor de Cupons', dbo.trunc_date(getDate()), '1.0.0', 'reconcarrecvend.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1035, 12, 76017, 'Malotes', dbo.trunc_date(getDate()), '1.0.0', 'malotes.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1036, 14, 76017, 'Reconciliação da Arrecadação - Coletor de Sangria', dbo.trunc_date(getDate()), '1.0.0', 'reconcarrecarreccolsangria.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1037, 13, 76017, 'Arrecadação Horária', dbo.trunc_date(getDate()), '1.0.0', 'arrechoraria.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1038, 13, 76017, 'Arrecadação Diária', dbo.trunc_date(getDate()), '1.0.0', 'arrecdiaria.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1039, 14, 76017, 'Reconciliação da Arrecadação - Arrecadador', dbo.trunc_date(getDate()), '1.0.0', 'reconcarrecarrec.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio, arquivoDetalhe ) values(1040, 13, 76017, 'Arrecadação por Categoria e Meio de Pagamento', dbo.trunc_date(getDate()), '1.0.0', 'arreccatmeiopagto.jasper', 0, 1,'arreccatmeiopagtodetalhado.jasper');
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1042, 15, 76017, 'Usuario Local', dbo.trunc_date(getDate()), '1.0.0', 'passusuariolocal.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1043, 18, 76017, 'Detalhes de Lotes', dbo.trunc_date(getDate()), '1.0.0', 'DetalhesDeLotes.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1044, 18, 76017, 'Fluxo de Caixa Por Lote', dbo.trunc_date(getDate()), '1.0.0', 'FluxoDeCaixaPorLote.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1045, 13, 76017, 'Consolidação Diária de Isentos', dbo.trunc_date(getDate()), '1.0.0', 'consoldiaisentos.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1046, 13, 76017, 'Veículos Isentos', dbo.trunc_date(getDate()), '3.0.0', 'veiculosIsentos.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1047, 14, 76017, 'Reconciliação da Declaração - Arrecadador', dbo.trunc_date(getDate()), '1.0.0', 'reconcdeclarrec.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1048, 14, 76017, 'Reconciliação da Declaração - Supervisor', dbo.trunc_date(getDate()), '1.0.0', 'reconcdeclsuper.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1049, 14, 76017, 'Reconciliação da Declaração - Responsável por Pista', dbo.trunc_date(getDate()), '1.0.0', 'reconcdeclresp.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1050, 15, 76017, 'Usuario Local - Primeira Passagem', dbo.trunc_date(getDate()), '1.0.0', 'primeirapassagemusuariolocal.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1051, 5, 76017, 'Consolidação de Declaração de Operador de PDV', dbo.trunc_date(getDate()), '1.0.0', 'ConsolidacaoDeclaracaoOperadorPOS.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1052, 12, 76017, 'Composição Malotada', dbo.trunc_date(getDate()), '1.0.0', 'composicaoMalotada.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1053, 19, 76017, 'Cadastro de Isentos', dbo.trunc_date(getDate()), '3.0.0', 'cadastrodeisentos.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1054, 19, 76017, 'Cadastro de Operadores', dbo.trunc_date(getDate()), '3.0.0', 'cadastrodeoperadores.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1055, 18, 76017, 'Histórico de Interoperabilidade CGMP', dbo.trunc_date(getDate()), '1.0.0', 'historicointeroperabilidadecgmp.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1056, 18, 76017, 'Detalhado de Passagens CGMP', dbo.trunc_date(getDate()), '1.0.0', 'detalhadodepassagenscgmp.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1057, 4, 76017, 'Histórico de Controle de Troco', dbo.trunc_date(getDate()), '3.0.0', 'HistoricoControleTrocoRel.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio, arquivoDetalhe ) values(1059, 15, 76017, 'Passagem de Veículos por Categoria e Meio de Pagamento', dbo.trunc_date(getDate()), '1.0.0', 'passcatmeiopagto.jasper', 0, 1,'passcatmeiopagtodetalhado.jasper');
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1060, 15, 76017, 'Horário de Passagens de Veículos por Meio de Pagamento', dbo.trunc_date(getDate()), '1.0.0', 'passhorariomeiopagto.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1061, 4, 76017, 'Saldo Instantâneo do Caixa', dbo.trunc_date(getDate()), '1.0.0', 'saldoinstantaneocaixa.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1062, 16, 76017, 'Recibo de Declaração', dbo.trunc_date(getDate()), '1.0.0', 'recibodeclaracao.jasper', 0, 0);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1063, 16, 76017, 'Recibo de Sangria', dbo.trunc_date(getDate()), '1.0.0', 'recibosangria.jasper', 0, 0);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1064, 17, 76017, 'Termo de Reconhecimento de Dívida', dbo.trunc_date(getDate()), '3.0.0', 'TermoReconhecimentoDivida17.jasper', 0, 0);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1065, 16, 76017, 'Talão de Depósito Bancário', dbo.trunc_date(getDate()), '1.0.0', 'reciboDepBancarioMalote.jasper', 0, 0);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1066, 27, 76017,'Voucher de Isento Posto',dbo.trunc_date(getDate()),'1.0.0','voucherIsentoPosto.jasper',0,1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1067, 18, 76017,'Detalhado de Passagens CC-Rio',dbo.trunc_date(getDate()),'1.0.0','detalhadodepassagensccrio.jasper',0,1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1068, 18, 76017, 'Fluxo de Caixa por Data', dbo.trunc_date(getDate()), '1.0.0', 'fluxodecaixa.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1069, 18, 76017, 'Log de Eventos da Interoperação', dbo.trunc_date(getDate()), '1.0.0', 'logeventosinteroperacao.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao ,arquivo, modo, listarelatorio) values(1070, 20, 76017, 'Estatístico Horário Por Categoria', dbo.trunc_date(getDate()), '1.0.0', 'EstatisticoHorarioPorCategoria.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1071, 15, 76017, 'Resumo Mensal do Movimento de Tráfego e Arrecadação', dbo.trunc_date(getDate()), '1.0.0', 'rmmta.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao ,arquivo, modo, listarelatorio) values(1072, 15, 76017, 'Tráfego por Categoria - Horário', dbo.trunc_date(getDate()), '1.0.0', 'TrafegoPorCategoriaHorario.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao ,arquivo, modo, listarelatorio) values(1073, 15, 76017, 'Tráfego por Categoria - Diário', dbo.trunc_date(getDate()), '1.0.0', 'TrafegoPorCategoriaDiario.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao ,arquivo, modo, listarelatorio) values(1074, 15, 76017, 'Tráfego por Categoria - Mensal', dbo.trunc_date(getDate()), '3.0.0', 'TrafegoPorCategoriaMensal.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao ,arquivo, modo, listarelatorio) values(1075, 18, 76017, 'Transações AVI em Pista Manual', dbo.trunc_date(getDate()), '1.0.0', 'estatisticotransacoesavipistamanual.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao ,arquivo, modo, listarelatorio) values(1076, 18, 76017, 'Analítico de Transações Manuais AVI', dbo.trunc_date(getDate()), '1.0.0', 'analiticotransacoesmanuaisavi.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1077, 15, 76017, 'Detalhado de Passagens Visa Vale Pedágio', dbo.trunc_date(getDate()), '1.0.0', 'detalhadodepassagensvisavalepedagio.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, versao, arquivo, modo, listarelatorio, datainsercao) values(1078, 8, 76017, 'Dívidas de Operadores - Extrato', '1.0.0', 'dividasoperadoresextrato.jasper', 0, 1, dbo.trunc_date(getDate()));
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, versao, arquivo, modo, listarelatorio, datainsercao) values(1079, 15, 76017, 'Usuário Local - Resumo', '1.0.0', 'passusuariolocalresumo.jasper', 0, 1, dbo.trunc_date(getDate()));
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1080, 13, 76017, 'Informações da Violação', dbo.trunc_date(getDate()), '1.0.0', 'imagensViolacao.jasper', 0, 0);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1081, 2, 76017, 'Verificação de Transações', dbo.trunc_date(getDate()),'1.0.0','imagensVerificacao.jasper','0','0');
--INSERT INTO relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1082, 11, 76017, 'Fechamento Econômico Financeiro', dbo.trunc_date(getDate()), '1.0.0', 'FechamentoEconomicoFinanceiro.jasper', 0, 1); 
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1083, ?, 76017, 'ISPM por Tempo', dbo.trunc_date(getDate()), '3.0.0', ?,0, 1); -- nao implementado
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1084, 8, 76017, 'Termo de Reconhecimento de Dívidas por Período', dbo.trunc_date(getDate()), '3.0.0', 'termoreconhecimentodividaperiodo17.jasper',0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1085, 13, 76017, 'Informações da Transação',dbo.trunc_date(getDate()),'1.0.0','transacao.jasper',0,0);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, versao, arquivo, modo, listarelatorio, datainsercao) values(1086, 20, 76017, 'Detalhado de Passagens de Veículos Isentos - Manual', '1.0.0', 'PassagensDeVeiculosIsentosManual.jasper', 0, 1, dbo.trunc_date(getDate()));
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, versao, arquivo, modo, listarelatorio, datainsercao) values(1087, 20, 76017, 'Detalhado de Passagens de Veículos Isentos - AVI', '1.0.0', 'PassagensDeVeiculosIsentosAVI.jasper', 0, 1, dbo.trunc_date(getDate()));
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) VALUES(1088, 19, 76017, 'Histórico de Cadastros de Pista', dbo.trunc_date(getDate()), '3.0.0', 'historicoCadastrosPista.jasper', 0, 1);
--1089 a 1097 relatorios legados da rota
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio) values(1098, 18, 76017, 'Detalhes de Recebimento de Lotes', dbo.trunc_date(getDate()), '1.0.0', 'DetalhesRecebimentoLotes.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1099,  3, 76017, 'Aquisições de Placas com LPR', dbo.trunc_date(getDate()), '1.0.0', 'ProcessamentoLPROfflineRel.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1100, 11, 76017, 'Recibo de Pagamento de Transações', dbo.trunc_date(getDate()), '1.0.0', 'ReciboViolacoesNaoPagantes.jasper', 0, 0);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1101, 11, 76017, 'Voucher de Não Pagantes', dbo.trunc_date(getDate()), '1.0.0', 'TermoReconhecimentoDividaNaoPagantes.jasper', 0, 0);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1102, 19, 76017, 'Histórico de Alocação de Mídias a Veículos Isentos', dbo.trunc_date(getDate()), '1.0.0', 'historicoAlocacaoMidia.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1103, 19, 76017, 'Cadastro de Usuários Isentos', dbo.trunc_date(getDate()), '1.0.0', 'isentoRegistroUsuario.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1104, 15, 76017, 'Passagens de Isento por Conta', dbo.trunc_date(getDate()), '1.0.0', 'passagensIsentoConta.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1105, 18, 76017, 'Fluxo de Caixa por Fonte do Repasse', dbo.trunc_date(getDate()), '1.0.0', 'fluxodecaixaporfonterepasse.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1106, 10, 76017, 'Ocorrências no Corredor de Motos', dbo.trunc_date(getDate()), '3.0.0', 'OcorrenciasCorredorMotos.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1107, 20, 76017, 'Analítico de Passagens de Veículos Em Pista Extra Larga', dbo.trunc_date(getDate()), '1.0.0', 'AnaliticoPassagensPistaExtraLarga.jasper', 0, 1);
--Insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1108, 15, 76017, 'Detalhado de Passagens Smart Card', dbo.trunc_date(getDate()), '1.0.0', 'detalhadodepassagenssmartcard.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1109, 18, 76017, 'Relatório Movimentação Diária de Tráfego Automático (MDT-AUTO)', dbo.trunc_date(getDate()), '1.0.0', 'MDTAuto.jasper', 0, 1);
--Insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1110, 15, 76017, 'Detalhado de Recargas Smart Card', dbo.trunc_date(getDate()), '1.0.0', 'detalhadoderecargasmartcard.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1111,  6, 76017, 'Sintético de Cupons Recebidos', dbo.trunc_date(getDate()), '3.0.0', 'SinteticoCuponsRecebidosRel.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1112, 15, 76017, 'Detalhado de Passagens DBTrans', dbo.trunc_date(getDate()), '1.0.0', 'detalhadodepassagensdbtrans.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1113, 15, 76017, 'Detalhado de Lotes DBTrans', dbo.trunc_date(getDate()), '1.0.0', 'detalhadolotesdbtrans.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1114, 18, 76017, 'Passagens Compradas Vale Pedágio', dbo.trunc_date(getDate()), '1.0.0', 'PassagensCompradasValePedagio.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1115, 18, 76017, 'Passagens Realizadas Vale Pedágio', dbo.trunc_date(getDate()), '1.0.0', 'PassagensRealizadasValePedagio.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1116, 18, 76017, 'Consolidado de Passagens Vale Pedágio',  dbo.trunc_date(getDate()), '3.0.0', 'ConsolidadoPassagensValePedagio.jasper', 0, 1); 
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1117, 13, 76017, 'Financeiro de Receita Manual',  dbo.trunc_date(getDate()), '1.0.0', 'FinanceiroReceitaManual.jasper', 0, 1); 
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1118, 13, 76017, 'Financeiro de Receita Automática',  dbo.trunc_date(getDate()), '1.0.0', 'FinanceiroReceitaAutomatica.jasper', 0, 1); 
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1119, 13, 76017, 'Descontos Mensais',  dbo.trunc_date(getDate()), '1.0.0', 'DescontosMensais.jasper', 0, 1); 
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1120, 13, 76017, 'Descontos Diários',  dbo.trunc_date(getDate()), '1.0.0', 'DescontosDiarios.jasper', 0, 1); 
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1121, 13, 76017, 'Descontos Horários',  dbo.trunc_date(getDate()), '1.0.0', 'DescontosHorarios.jasper', 0, 1); 
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1122, 13, 76017, 'Arrecadação Diária por Meio de Pagamento',  dbo.trunc_date(getDate()), '3.0.0', 'ArrecDiariaMeioPagto.jasper', 0, 1); 
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1123, 13, 76017, 'Arrecadação Mensal por Meio de Pagamento',  dbo.trunc_date(getDate()), '1.0.0', 'ArrecMensalMeioPagto.jasper', 0, 1); 
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1124, 19, 76017, 'Histórico de Declarações',  dbo.trunc_date(getDate()), '1.0.0', 'HistoricoDeclaracao.jasper', 0, 1); 
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1125, 18, 76017, 'Perfil de Desconto',  dbo.trunc_date(getDate()), '3.0.0', 'PerfilDesconto.jasper', 0, 1); 
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1126, 18, 76017, 'Mídias Atribuídas ao Controle de Desconto', getDate(), '3.0.0', 'MidiaAtribuidaControleDesconto.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1127, 18, 76017, 'Histórico de Alocação de Mídias ao Controle de Descontos', getdate(), '3.0.0', 'HistoricoAlocacaoMidiasControleDesconto.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1128, 18, 76017, 'Análise de Perfis de Descontos', getdate(), '3.0.0', 'AnalisePerfisDesconto.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1129, 18, 76017, 'Passagens com Desconto', getdate(), '3.0.0', 'PassagensDescontoDBTrans.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1130, 19, 76017, 'Relatório de Tarifas', dbo.trunc_date(getDate()), '1.0.0', 'programacaotarifas.jasper', 0, 0);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1131, 12, 76017, 'Histórico de Importação de Arquivos de Depósito de Malotes', dbo.trunc_date(getDate()), '1.0.0', 'HistoricoImportacaoArquivoDepositoMalote.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1132, 19, 76017, 'Contas Credit Granted', dbo.trunc_date(getDate()), '1.0.0', 'contasCreditGranted.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1133, 15, 76017, 'Passagens Credit Granted por Conta', dbo.trunc_date(getDate()), '1.0.0', 'passagenscontacreditgranted.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1134, ?, 76017, 'Analítico de Cupons Classificados', dbo.trunc_date(getDate()), '3.0.0', ?, 0, 1);-- nao implementado
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1135, 13, 76017, 'Fatura de Credit Granted', dbo.trunc_date(getDate()), '1.0.0', 'faturaCreditGranted.jasper', 0, 1);
--INSERT INTO RELATORIO (IDRELATORIO, IDGRUPO, IDORIGEM, TITULO, DATAINSERCAO, VERSAO, ARQUIVO, MODO, LISTARELATORIO, USEBEAN)values(1136, 15, 76017, 'Acompanhamento de dívidas de operadores',getdate(),'3.0.0','acompanhamentoVDA.jasper',0,1,0);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1137, 15, 76017, 'Reconciliação AVC/SA', dbo.trunc_date(getDate()), '1.0.0', 'reconciliacaoAVCSA.jasper',0,1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1138, 9,  76017, 'Não Pagantes', dbo.trunc_date(getDate()), '1.0.0', 'naoPagantes.jasper', 0, 1); 
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1139, 13, 76017, 'Mensal de Passagens por Meio de Pagamento', dbo.trunc_date(getDate()), '3.0.0', 'PassMensalMeioPagto.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1140, 13, 76017, 'Diário de Passagens por Meio de Pagamento', dbo.trunc_date(getDate()), '1.0.0', 'PassDiarioMeioPagto.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1141, 4,  76017, 'Transferência de Caixa', dbo.trunc_date(getDate()), '3.0.0', 'TransferenciaCaixa.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1142, 10, 76017, 'Ocorrências de Pista', dbo.trunc_date(getDate()), '1.0.0', 'OcorrenciasPista.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1143, 8,  76017, 'Dívidas e Quitações - Arrecadador', dbo.trunc_date(getDate()), '3.0.0', 'DividasQuitacoesArrecadador.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1144, 8,  76017, 'Dívidas e Quitações - Supervisor', dbo.trunc_date(getDate()), '3.0.0', 'DividasQuitacoesSupervisor.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1145, 8,  76017, 'Dívidas e Quitações - Responsável por Pista', dbo.trunc_date(getDate()), '3.0.0', 'DividasQuitacoesResponsavelPista.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1146, 8,  76017, 'Dívidas e Quitações - Vendedor de Cupons', dbo.trunc_date(getDate()), '3.0.0', 'DividasQuitacoesVendedorCupons.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1147, 8,  76017, 'Dívidas e Quitações - Coletor de Sangria', dbo.trunc_date(getDate()), '3.0.0', 'DividasQuitacoesColetorSangria.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1148, 19, 76017, 'Cadastro de Categorias',  dbo.trunc_date(getDate()), '1.0.0', 'CadastroCategorias.jasper', 0, 1); 
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1149, 22, 76017, 'Sintético de Cupons DBTRANS', dbo.trunc_date(getDate()), '1.0.0', 'SinteticoCupomDBTrans.jasper', 0,1);  
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1150, 18, 76017, 'Relatório de Verificação de Passagens com Desconto CGMP',  dbo.trunc_date(getDate()), '1.0.0', 'descontoCGMPVerificacao.jasper', 0, 1); 
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1151, 15, 76017, 'Compreensivo Não Consolidado', dbo.trunc_date(getDate()), '1.0.0', 'compreensivonaoconsolidado.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1152, 9,  76017, 'Pagamentos Diversos', dbo.trunc_date(getDate()), '1.0.0', 'PagamentosDiversos.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1153, 18, 76017, 'Relatório Geral CGMP',  dbo.trunc_date(getDate()), '1.0.0', 'descontoCGMPGeral.jasper', 0, 1); 
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1154, 18, 76017, 'Relatório de Substituição CGMP', dbo.trunc_date(getDate()), '1.0.0', 'descontoCGMPSubstituicao.jasper', 0, 1); 
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1155, 17, 76017, 'Recibo de Pagamento Diverso', dbo.trunc_date(getDate()), '1.0.0', 'recibopagamentodiverso.jasper', 0, 0);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1156, 15, 76017, 'Detalhado de Passagens Múltiplas', dbo.trunc_date(getDate()), '1.0.0', 'DetalhadoPassagensMultiplas.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1157, 13, 76017, 'Resumo Financeiro de Passagens Múltiplas', dbo.trunc_date(getDate()), '1.0.0', 'ResumoFinanceiroPassagensMultiplas.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1158, 15, 76017, 'Exceções de Passagens Múltiplas', dbo.trunc_date(getDate()), '1.0.0', 'ExcecoesPassagensMultiplas.jasper', 0, 1);
insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, usebean, relatorioclass,datainsercao, versao, arquivo, modo, listarelatorio )values(1159, 15, 76017, 'Demonstrativo Contábil', 1, 'br.com.compsisnet.xp.comRod.control.report.ReportCommand1159', dbo.trunc_date(getDate()), '3.0.0', 'demonstrativoContabil.jasper', 0, 1);
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1161, ?, 76017, 'Demonstrativo de Receitas AVI',dbo.trunc_date(getDate()), '3.0.0', ?, 0, 1); --não implementado
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1162, ?, 76017, 'Estatístico de Correção',dbo.trunc_date(getDate()), '3.0.0', ?, 0, 1); --não implementado
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1163, ?, 76017, 'Relatório de Rastreamento de Transações CGMP',dbo.trunc_date(getDate()), '3.0.0', ?, 0, 1); --não implementado
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1164, ?, 76017, 'Transação com Excesso de Velocidade',dbo.trunc_date(getDate()), '3.0.0', ?, 0, 1); --não implementado
--insert into relatorio(idrelatorio, idgrupo, idorigem, titulo, datainsercao, versao, arquivo, modo, listarelatorio)values(1165, 13, 76017, 'Recargas em Pista', dbo.trunc_date(getDate()), '3.0.0', 'RecargaPista.jasper', 0, 0);


-------------------------
-- Relatorio Parametro --
-------------------------
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1001, 1, null, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1001, 2, 'listaOperadores', 'Responsável', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1001, 3, 'listaOperadores_2', 'Declarante', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString_2', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1001, 4, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1002, 1, null, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1002, 2, 'listaArrecadadores', 'Arrecadadores', null, dbo.trunc_date(getDate()), 1, 3, 'arrecadadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1002, 3, 'listaSupervisores', 'Supervisores', null, dbo.trunc_date(getDate()), 1, 4, 'supervisoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1002, 4, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1003, 2, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1003, 1, null, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1004, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1004, 2, 'listaPracas', 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1005, 1, 'listaAreas', 'Área', null, dbo.trunc_date(getDate()), 1, 12, 'areasString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1005, 2, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1006, 2, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1006, 1, null, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1007, 1, 'dataDeclaracao', 'Declaração', null, dbo.trunc_date(getDate()), 12, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1007, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 3, 2, 'operadoresString', 0, null, null, null);
--OU
--INSERT INTO relatorioparametro (IDRELATORIO,IDPARAMETRO,NOME,OPCIONAL,TITULO,COLUNA,DATAINSERCAO,TIPO,IDLISTA,NOMEEXIBICAO,VALOROPCIONALINICIAL,VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL,QUERY) VALUES (1007,1,NULL,0,'Período',NULL, GETDATE(),6,NULL,NULL,NULL,NULL,NULL,NULL);
--INSERT INTO relatorioparametro (IDRELATORIO,IDPARAMETRO,NOME,OPCIONAL,TITULO,COLUNA,DATAINSERCAO,TIPO,IDLISTA,NOMEEXIBICAO,VALOROPCIONALINICIAL,VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL,QUERY) VALUES (1007,2,'listaOperadores',0,'Operador',NULL, GETDATE(),1,2,'operadoresString',NULL,NULL,NULL,NULL);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1007, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
Insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional,  nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query)values(1007, 4, 'listaLogica', 'Exibir Detalhes Transações', NULL, dbo.trunc_date(getDate()), 9, NULL, NULL, 0, NULL, NULL, NULL, NULL);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1008, 1, 'dataDeclaracao', 'Declaração', null, dbo.trunc_date(getDate()), 12, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1008, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 3, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1008, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1009, 1, 'dataDeclaracao', 'Declaração', null, dbo.trunc_date(getDate()), 12, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1009, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 3, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1009, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1010, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 4, null, null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1010, 2, 'listaArrecadadores', 0, 'Arrecadadores', null, dbo.trunc_date(getDate()), 1, 3, 'arrecadadoresString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1010, 3, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1010, 4, 'listaPracaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1011, 1, null, 'Período de Resgate', null, dbo.trunc_date(getDate()), 5, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1012, 1, 'dataDeclaracao', 'Declaração', null, dbo.trunc_date(getDate()), 12, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1012, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 3, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1012, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1013, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1013, 1, 'dataDeclaracao', 'Declaração', null, dbo.trunc_date(getDate()), 12, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1013, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 3, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1014, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1014, 2, 'listaOperadores', 'Operadores Abonados', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1014, 3, 'listaOperadores_2', 'Operadores Responsáveis', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString_2', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1014, 4, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1015, 1, null, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1015, 2, 'listaTipoVeiculo', 'Tipos Veículos', null, dbo.trunc_date(getDate()), 1, 20, 'tipoVeiculoString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1015, 3, 'listaPracaPistaSentido', 'Pistas', null, dbo.trunc_date(getDate()), 1, 8, 'pracaPistaSentidoString', 0, null, null, null);
INSERT INTO RELATORIOPARAMETRO (IDRELATORIO, IDPARAMETRO, NOME, OPCIONAL, TITULO, COLUNA,DATAINSERCAO, TIPO, IDLISTA, NOMEEXIBICAO, VALOROPCIONALINICIAL, VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL, QUERY) VALUES(1016, 1, NULL, 0, 'Período', NULL,  dbo.trunc_date(getDate()),7, NULL, NULL, NULL, NULL, NULL, NULL); 
INSERT INTO RELATORIOPARAMETRO (IDRELATORIO, IDPARAMETRO, NOME, OPCIONAL, TITULO, COLUNA,DATAINSERCAO, TIPO, IDLISTA, NOMEEXIBICAO, VALOROPCIONALINICIAL, VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL, QUERY) VALUES(1016, 2, 'listaOperadores', 0, 'Operadores', NULL,  dbo.trunc_date(getDate()), 1, 2, 'operadoresString', NULL, NULL, NULL, NULL); 
INSERT INTO RELATORIOPARAMETRO (IDRELATORIO, IDPARAMETRO, NOME, OPCIONAL, TITULO, COLUNA,DATAINSERCAO, TIPO, IDLISTA, NOMEEXIBICAO, VALOROPCIONALINICIAL, VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL, QUERY) VALUES(1016, 3, 'listaPracas', 0, 'Praça', NULL,  dbo.trunc_date(getDate()), 1, 7, 'pracasString', NULL, NULL, NULL, NULL); 
INSERT INTO RELATORIOPARAMETRO (IDRELATORIO, IDPARAMETRO, NOME, OPCIONAL, TITULO, COLUNA,DATAINSERCAO, TIPO, IDLISTA, NOMEEXIBICAO, VALOROPCIONALINICIAL, VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL, QUERY) VALUES(1017, 1, NULL, 0, 'Período', NULL,  dbo.trunc_date(getDate()), 7, NULL, NULL, NULL, NULL, NULL, NULL); 
INSERT INTO RELATORIOPARAMETRO (IDRELATORIO, IDPARAMETRO, NOME, OPCIONAL, TITULO, COLUNA,DATAINSERCAO, TIPO, IDLISTA, NOMEEXIBICAO, VALOROPCIONALINICIAL, VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL, QUERY) VALUES(1017, 2, 'listaPracas', 0, 'Praça', NULL,  dbo.trunc_date(getDate()), 1, 7, 'pracasString', NULL, NULL, NULL, NULL); 
INSERT INTO RELATORIOPARAMETRO (IDRELATORIO, IDPARAMETRO, NOME, OPCIONAL, TITULO, COLUNA,DATAINSERCAO, TIPO, IDLISTA, NOMEEXIBICAO, VALOROPCIONALINICIAL, VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL, QUERY) VALUES(1017, 3, 'listaPracaPistaSentido', 0, 'Pistas', NULL,  dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', NULL, NULL, NULL, NULL); 
INSERT INTO RELATORIOPARAMETRO (IDRELATORIO, IDPARAMETRO, NOME, OPCIONAL, TITULO, COLUNA,DATAINSERCAO, TIPO, IDLISTA, NOMEEXIBICAO, VALOROPCIONALINICIAL, VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL, QUERY) VALUES(1017, 4, 'listaFalhas', 0, 'Falhas', NULL,  dbo.trunc_date(getDate()), 1, 9, 'falhasString', NULL, NULL, NULL, NULL); 
INSERT INTO RELATORIOPARAMETRO (IDRELATORIO, IDPARAMETRO, NOME, OPCIONAL, TITULO, COLUNA,DATAINSERCAO, TIPO, IDLISTA, NOMEEXIBICAO, VALOROPCIONALINICIAL, VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL, QUERY) VALUES(1018, 1, NULL, 0, 'Período', NULL,  dbo.trunc_date(getDate()), 7, NULL, NULL, NULL, NULL, NULL, NULL); 
INSERT INTO RELATORIOPARAMETRO (IDRELATORIO, IDPARAMETRO, NOME, OPCIONAL, TITULO, COLUNA,DATAINSERCAO, TIPO, IDLISTA, NOMEEXIBICAO, VALOROPCIONALINICIAL, VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL, QUERY) VALUES(1018, 2, 'listaPracas', 0, 'Praça', NULL,  dbo.trunc_date(getDate()), 3, 7, 'pracasString', NULL, NULL, NULL, NULL); 
INSERT INTO RELATORIOPARAMETRO (IDRELATORIO, IDPARAMETRO, NOME, OPCIONAL, TITULO, COLUNA,DATAINSERCAO, TIPO, IDLISTA, NOMEEXIBICAO, VALOROPCIONALINICIAL, VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL, QUERY) VALUES(1018, 3, 'listaAreas', 0, 'Área', NULL,  dbo.trunc_date(getDate()), 1, 12, 'areasString', NULL, NULL, NULL, NULL); 
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1019, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1019, 2, 'listaPracas', 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1019, 3, 'listaAreas', 'Área', null, dbo.trunc_date(getDate()), 1, 12, 'areasString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1020, 1, 'datainicial', 'Mês', null, dbo.trunc_date(getDate()), 10, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1020, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1020, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1021, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1021, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1021, 2, 'listaOperadores', 'Operadores', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1022, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1022, 2, 'listaOperadores', 'Operadores', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1022, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1023, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1023, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1023, 3, 'listaPracaPistaSentido', 'Pistas', null, dbo.trunc_date(getDate()), 1, 8, 'pracaPistaSentidoString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1024, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1024, 2, 'listaPracaPistaSentido', 'Pistas', null, dbo.trunc_date(getDate()), 1, 8, 'pracaPistaSentidoString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1025, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1025, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1025, 3, 'listaOperacoes', 'Operação', null, dbo.trunc_date(getDate()), 1, 6, 'operacoesString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1025, 4, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1026, 2, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1026, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1027, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1027, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1027, 3, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query ) values (1027, 4, 'listaLogica', 0, 'Exibir Detalhes', null, dbo.trunc_date(getDate()), 9, null, null, null, null, null, null);
insert into relatorioparametro (idrelatorio,idparametro,nome,opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values (1028,1,null,0,'Período',null,getdate(),7,null,null,null,null,null,null);
insert into relatorioparametro (idrelatorio,idparametro,nome,opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values (1028,2,'dataquitacao',1,'Período Pagamento',null,getdate(),7,null,null,'01/01/1900 00:00:00','01/01/2100 00:00:00','exibeOpcional',null);
insert into relatorioparametro (idrelatorio,idparametro,nome,opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values (1028,3,'listacondicaoPagamento',0,'Condição de Pagamento',null,getdate(),1,18,'condicaoPagamentoString',null,null,null,null);
insert into relatorioparametro (idrelatorio,idparametro,nome,opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values (1028,4,'listaPracas',0,'Praça',null,getdate(),1,7,'pracasString',null,null,null,null);
insert into relatorioparametro (idrelatorio,idparametro,nome,opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values (1028,5,'listaPracaPistaSentido',0,'Pistas',null,getdate(),1,38,'pracaPistaSentidoString',null,null,null,null);
insert into relatorioparametro (idrelatorio,idparametro,nome,opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values (1028,6,'listaLogica',0,'Multa',null,getdate(),1,11,'logicaString',null,null,null,null);
insert into relatorioparametro (idrelatorio,idparametro,nome,opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values (1028,7,'tipoViolacao',0,'Tipo Violação',null,getdate(),1,53,'tipoViolacaoString',null,null,null,'Select idtipoviolacao id, descricao from tipoviolacao order by descricao');
insert into relatorioparametro (idrelatorio,idparametro,nome,opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values (1028,8,'ordem',0,'Ordem',null,getdate(),3,53,'ordemString',null,null,null,'select 5 id, ''Data de Ocorrência'' descricao from dual union select 13 id, ''Data de Pagamento'' descricao from dual');
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1029, 1, 'dataDeclaracao', 'Declaração', null, dbo.trunc_date(getDate()), 12, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1029, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 3, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1029, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1030, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1030, 2, 'listaPracas', 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', 0, null, null, null);
Insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)Values (1031, 1, NULL, 0, 'Período', NULL, dbo.trunc_date(getDate()), 5, NULL, NULL, NULL, NULL, NULL, NULL);
Insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)Values (1031, 2, 'listaOperadores', 0, 'Operador', NULL, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', NULL, NULL, NULL, NULL);
Insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)Values (1031, 3, 'listaPracas', 0, 'Praças', NULL, dbo.trunc_date(getDate()), 1, 7, 'pracasString', NULL, NULL, NULL, NULL);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1032, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1032, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1032, 3, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1032, 4, 'ordem', 'Ordem', null, dbo.trunc_date(getDate()), 3, 39, 'ordemString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1033, 3, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1033, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1033, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1033, 4, 'ordem', 'Ordem', null, dbo.trunc_date(getDate()), 3, 39, 'ordemString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1034, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1034, 2, 'listaOperadores', 'Operadores', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1034, 3, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1034, 4, 'ordem', 'Ordem', null, dbo.trunc_date(getDate()), 3, 39, 'ordemString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1035, 1, 'criacao', 'Período de Criação', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1035, 2, 'deposito', 'Período de Depósito', null, dbo.trunc_date(getDate()), 5, null, null, 1, 'exibeOpcional1', '01/01/1900', '01/01/2100');
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1035, 3, 'listaDeclarantes', 'Operadores', null, dbo.trunc_date(getDate()), 1, 14, 'declarantesString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1035, 4, 'listaContas', 'Contas', null, dbo.trunc_date(getDate()), 1, 15, 'contasString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1035, 5, 'listaTransportadoras', 'Transportadoras', null, dbo.trunc_date(getDate()), 1, 16, 'transportadorasString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1035, 6, 'ordem', 'Ordem', null, dbo.trunc_date(getDate()), 3, 17, 'ordemString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1035, 7, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1035, 8, 'listaStatusMalote', 0, 'Status', null, dbo.trunc_date(getDate()), 1, 30, 'statusMaloteString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1035, 9, 'gtv', 1, 'GTV', null, dbo.trunc_date(getDate()), 2, null, null, null, null, 'exibeOpcional2');
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1036, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1036, 2, 'listaOperadores', 'Operadores', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1036, 3, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1036, 4, 'ordem', 'Ordem', null, dbo.trunc_date(getDate()), 3, 39, 'ordemString', 0, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1037, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 6, null, null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1037, 2, 'listaArrecadadores', 0, 'Arrecadador', null, dbo.trunc_date(getDate()), 1, 3, 'arrecadadoresString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1037, 3, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1037, 4, 'listaPracaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1038, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1038, 2, 'listaArrecadadores', 0, 'Arrecadador', null, dbo.trunc_date(getDate()), 1, 3, 'arrecadadoresString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao,valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1038,3,'listaPracas',0,'Praça',null,dbo.trunc_date(getDate()),1,7,'pracasString',null,null,null,null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao) values(1038, 4, 'listaPracaPistaSentido', 'Pista', null, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString');
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1039, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1039, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1039, 3, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1039, 4, 'ordem', 'Ordem', null, dbo.trunc_date(getDate()), 3, 39, 'ordemString', 0, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1040, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1040, 2, 'listaOperadores', 0, ' Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao,valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1040,3,'listaPracas',0,'Praça',null,dbo.trunc_date(getDate()),1,7,'pracasString',null,null,null,null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao) values(1040, 4, 'listaPracaPistaSentido', 'Pista', null, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString');
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao) values(1040, 5, 'listaCobrancaSumarioGerencial', 'Cobrança', null, dbo.trunc_date(getDate()), 1, 13, 'cobrancaSumarioGerencialString');
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query ) values(1040, 6, 'listaLogica', 0, 'Exibir Detalhes', null, dbo.trunc_date(getDate()), 9, null, null, null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1042, 1, null, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1042, 2, 'textoPlaca', 'Placa do Veículo', null, dbo.trunc_date(getDate()),14, null, 'placaString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1042, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna,datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1043, 1, 'listaMeiosPagamento', 0, 'Meios de Pagamento', null, dbo.trunc_date(getDate()), 1, 22, 'listaMeiosPagamentoString', null, null, null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna,datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1043, 2, null, 0, 'Período de Corte', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null);
Insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) Values (1044, 1, 'listaGestores', 'Gestores', NULL, dbo.trunc_date(getDate()), 1, 53, 'listaGestoresString', 0, NULL, NULL, NULL, 'select idgestor id, descricao descricao from gestor where idgestor in (3, 4, 7)');
--Insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) Values (1044, 2, 'listaMeiosPagamento', 'Meios de Pagamento', NULL, dbo.trunc_date(getDate()), 1, 53, 'listaMeiosPagamentoString', 0, NULL, NULL, NULL,  'select idmeiopagamentointeroperacao id, descricao descricao from meiopagamentointeroperacao where idmeiopagamentointeroperacao in (7, 14)');
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna,datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1044, 3, null, 0, 'Período de Pagamento', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null);
insert into relatorioparametro (idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1044, 4, 'listaLogica', 0, 'Exibir Detalhes Vale Pedágio VF/SP', NULL, dbo.trunc_date(getDate()), 9, NULL, NULL, NULL, NULL, NULL, NULL); 
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1045, 1, null, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1045, 2, 'listaTiposIsentos', 'Tipo', null, dbo.trunc_date(getDate()), 1, 19, 'tiposIsentosString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1045, 3, 'listaPracaPistaSentido', 'Pistas', null, dbo.trunc_date(getDate()), 1, 8, 'pracaPistaSentidoString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1046, 1, null, 'Data de Validade', null, dbo.trunc_date(getDate()), 5, null, null, 1, 'exibeOpcional1', '01/01/1900', '01/01/2100');
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1046, 2, 'listaTiposIsentos', 'Tipo de Isento', null, dbo.trunc_date(getDate()), 1, 19, 'tiposIsentosString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1046, 3, 'listaPracas', 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1047, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1047, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1047, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1048, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1048, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1048, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1049, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1049, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1049, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1050, 1, null, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1050, 2, 'textoPlaca', 'Placa do Veículo', null, dbo.trunc_date(getDate()),14, null, 'placaString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1050, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1051, 1, 'dataDeclaracao', 'Declaração', null, dbo.trunc_date(getDate()), 12, null, null, 0, null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1051, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 3, 2, 'operadoresString', 0, null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1051, 3, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1052, 1, null, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1052, 2, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1053, 1, null, 0, 'Data de Cadastro', null, dbo.trunc_date(getDate()), 7, null, null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1053, 2, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1054, 1, null, 0, 'Data de Cadastro', null, dbo.trunc_date(getDate()), 7, null, null, null, null, null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1054, 2, 'listaLogica', 0, 'Exibir Detalhes', NULL, dbo.trunc_date(getDate()), 9, NULL, NULL, NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) Values (1054, 3, 'situacaoCadastro', 0, 'Situação Cadastro',   NULL, dbo.trunc_date(getDate()), 1, 44, NULL, NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) Values (1054, 4, 'listaCargos', 0, 'Cargo', NULL, dbo.trunc_date(getDate()), 1, 46, NULL,  NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) Values (1054, 5, 'listaPerfis', 0, 'Perfil', NULL, dbo.trunc_date(getDate()), 1, 45, NULL,  NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) Values (1054, 6, 'departamento', 1, 'Departamento', NULL, dbo.trunc_date(getDate()), 2, NULL, NULL, NULL, NULL, 'exibeOpcional1', NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) Values (1054, 7, 'divisao', 1, 'Divisão',  NULL, dbo.trunc_date(getDate()), 2, NULL, NULL, NULL, NULL, 'exibeOpcional2', NULL);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1055, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1055, 2, null, 'Faixa de Lotes', null, dbo.trunc_date(getDate()), 15, null, null, 0, null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1055, 3, 'listaLogica', 'Exibir Detalhes Transações', null, dbo.trunc_date(getDate()), 9, null, null, 0, null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1056, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
--insert into relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query)Values(1056, 2, 'listaEmissores', 'Emissor', NULL, dbo.trunc_date(getDate()), 1, 53, 'emissoresString', 0,  NULL, NULL, NULL, 'select idemissor id , descricao descricao from emissormeiopagamento where idmeiopagamentointeroperacao = 14');
--insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1056, 3, 'statusCGMP', 'Status', null, dbo.trunc_date(getDate()), 1, 27, 'statusCGMPString', 0, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao,valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1056, 4, 'listaPracas', 0, 'Praças', NULL, dbo.trunc_date(getDate()), 1, 7, 'pracasString', NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1056, 5, 'tag', 1, 'Tag', NULL, dbo.trunc_date(getDate()), 2, NULL, NULL, NULL, NULL, 'exibeOpcional1', NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1056, 6, 'placa', 1, 'Placa', NULL, dbo.trunc_date(getDate()), 2, NULL, NULL, NULL, NULL, 'exibeOpcional2', NULL);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1057, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1057, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1057, 3, 'listaPapeis', 'Papel', null, dbo.trunc_date(getDate()), 1, 1, 'papeisString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1057, 4, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1059, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 6, null, null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1059, 2, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1059, 3, 'listaPracaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1059, 4, 'listaOperadores', 0, 'Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1059, 5, 'listaCobrancaSumarioGerencial', 0, 'Cobranças', null, dbo.trunc_date(getDate()), 1, 13, 'cobrancaSumarioGerencialString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query ) values(1059, 6, 'listaLogica', 0, 'Exibir Detalhes', null, dbo.trunc_date(getDate()), 9, null, null, null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1060, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 6, null, null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao,valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1060,2,'listaPracas',0,'Praça',null,dbo.trunc_date(getDate()),1,7,'pracasString',null,null,null,null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao) values(1060, 3, 'listaPracaPistaSentido', 'Pista', null, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString');
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao) values(1060, 4, 'listaArrecadadores', 'Arrecadadores', null, dbo.trunc_date(getDate()), 1, 3, 'arrecadadoresString');
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1061, 1, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1062, 1, 'iddeclaracao', 'ID Declaracao', null, dbo.trunc_date(getDate()), 2, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1063, 1, 'id', 'ID Sangria', null, dbo.trunc_date(getDate()), 2, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1064, 1, 'id', 'id', null, dbo.trunc_date(getDate()), 2, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1064, 2, 'listaOperadores', 'Operador', null, dbo.trunc_date(getDate()), 3, 2, 'operadoresString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1064, 3, 'dataDeclaracao', 'Data Declaração', null, dbo.trunc_date(getDate()), 12, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1064, 4, 'textoGenerico', 'Texto', null, dbo.trunc_date(getDate()), 2, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1065, 1, 'idmalote', 'ID Malote', null, dbo.trunc_date(getDate()), 2, null, null, 0, null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalfinal,nomeparametroopcional) values(1066,1,'placaVeiculo',0,'Placa Veiculo',null,dbo.trunc_date(getDate()),2,null,null,null,null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalfinal,nomeparametroopcional) values(1066,2,'codigoVoucher',0,'Codigo do Voucher',null,dbo.trunc_date(getDate()),2,null,null,null,null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalfinal,nomeparametroopcional) values(1066,3,'pracaValidade',0,'Praca de Validade',null,dbo.trunc_date(getDate()),2,null,null,null,null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalfinal,nomeparametroopcional) values(1066,4,'validadeVoucher',0,'Validade do Voucher',null,dbo.trunc_date(getDate()),2,null,null,null,null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalfinal,nomeparametroopcional) values(1066,5,'categoriaVeiculo',0,'Categoria do Veiculo',null,dbo.trunc_date(getDate()),2,null,null,null,null);
--1067 ver parametros qdo for habilitar
insert into Relatorioparametro(idrelatorio, idparametro, opcional, titulo, datainsercao, tipo, valoropcionalinicial, valoropcionalfinal)values(1068, 1  , 1   , 'Período de Pagamento', dbo.trunc_date(getDate()), 5   , '01/01/1900' , '01/01/2200');
--Insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) Values (1068, 2, 'listaGestores', 'Gestores', 'Gestor', dbo.trunc_date(getDate()), 1, 53, 'listaGestoresString', 0, NULL, NULL, NULL, 'select idgestor id, descricao descricao from gestor where idgestor in (3, 4,7)');
--Insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) Values (1068, 3, 'listaMeioPagto', 'Meios de Pagamento', 'Meio Pagamento', dbo.trunc_date(getDate()), 1, 53, 'listaMeiosPagamentoString', 0, NULL, NULL, NULL,  'select idmeiopagamentointeroperacao id, descricao descricao from meiopagamentointeroperacao where idmeiopagamentointeroperacao in (7, 14)');
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values(1068, 4 , NULL   , 1, 'Faixa de Lotes', null , dbo.trunc_date(getDate()),15  ,null  ,null , null        , null        ,'faixaLoteOpcional'  ,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values(1068, 5 ,'envio' , 1, 'Data de Envio' , null , dbo.trunc_date(getDate()), 5  ,null  ,null , '01/01/1900', '01/01/2200','dataEnvioOpcional'  ,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values(1068, 6 ,'ordem1', 0, 'Ordem 1'       , null , dbo.trunc_date(getDate()), 3  ,53    ,null , null        , null        ,null                 ,'select 4 id, ''Data Pagamento'' descricao from dual union select 5 id, ''Data Envio'' descricao from dual union select 3 id, ''Lote'' descricao from dual');
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values(1068, 7 ,'ordem2', 0, 'Ordem 2'       , null , dbo.trunc_date(getDate()), 3  ,53    ,null , null        , null        ,null                 ,'select 4 id, ''Data Pagamento'' descricao from dual union select 5 id, ''Data Envio'' descricao from dual union select 3 id, ''Lote'' descricao from dual');
--insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1069, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1069, 2, 'listaEtapasProcessoInterop', 'Etapas do processo', null, dbo.trunc_date(getDate()), 1, 31, 'listaEtapasProcessoInteropString', 0, null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1069, 3, 'listaMeiosPagamento', 'Meio de Pagamento', null, dbo.trunc_date(getDate()), 1, 22, 'listaMeiosPagamentoString', 0, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1070, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1070, 2, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1070, 3, 'listaPracaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1071, 1, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1071, 2, 'quinzena', 0, 'Quinzena', null, dbo.trunc_date(getDate()), 3, 32, 'quinzenaString', null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1071, 3, 'datainicial', 0, 'Mês/Ano', null, dbo.trunc_date(getDate()), 10, null, null, null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1071, 4, 'listaLogica', 0, 'Gerar Arquivo', null, dbo.trunc_date(getDate()), 9, null, 'logicaString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1072, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 6, null, null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1072, 2, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1072, 3, 'listaPracaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1072, 4, 'listaCobrancaDesignacaoSumGer', 0, 'Cobrança / Designação', null, dbo.trunc_date(getDate()), 1, 33, 'CobrancaDesignacaoSumGerString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1073, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1073, 2, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1073, 3, 'listaPracaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1073, 4, 'listaCobrancaDesignacaoSumGer', 0, 'Cobrança / Designação', null, dbo.trunc_date(getDate()), 1, 33, 'CobrancaDesignacaoSumGerString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1074, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 4, null, null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1074, 2, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1074, 3, 'listaPracaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional) values(1074, 4, 'listaCobrancaDesignacaoSumGer', 0, 'Cobrança / Designação', null, dbo.trunc_date(getDate()), 1, 33, 'CobrancaDesignacaoSumGerString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1075, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1075, 2, 'listaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()), 1, 8, 'listaPistaSentidoString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1075, 3, 'listaOperadores', 0, 'Operadores', null, dbo.trunc_date(getDate()), 1, 2, 'listaOperadoresString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1076, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1076, 2, 'listaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()), 1, 8, 'listaPistaSentidoString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1076, 3, 'listaOperadores', 0, 'Operadores', null, dbo.trunc_date(getDate()), 1, 2, 'listaOperadoresString', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1077, 1, 'listapracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasstring', null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1077, 2, null, 0, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, datainsercao) values(1078, 1, null, 0, 'Período', null, 7, null, null, null, null, null, dbo.trunc_date(getDate()));
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, datainsercao) values(1078, 2, 'listaOperadores', 0, 'Operador', null, 1, 2, 'operadoresString', null, null, null, dbo.trunc_date(getDate()));
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, datainsercao) values(1078, 3, 'listaPracas', 0, 'Praças', null, 1, 7, 'pracasString', null, null, null, dbo.trunc_date(getDate()));
--1080 ---nao tem parametro
--1081 --nao tem parametro
--INSERT INTO RELATORIOPARAMETRO (IDRELATORIO, IDPARAMETRO, NOME, OPCIONAL, TITULO, COLUNA,DATAINSERCAO, TIPO, IDLISTA, NOMEEXIBICAO, VALOROPCIONALINICIAL, VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL, QUERY) VALUES(1082, 1, NULL, 0, 'Período', NULL,  dbo.trunc_date(getDate()), 5, NULL, NULL, NULL, NULL, NULL, NULL); 
--INSERT INTO RELATORIOPARAMETRO (IDRELATORIO, IDPARAMETRO, NOME, OPCIONAL, TITULO, COLUNA,DATAINSERCAO, TIPO, IDLISTA, NOMEEXIBICAO, VALOROPCIONALINICIAL, VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL, QUERY) VALUES(1082, 2, 'listaPracas', 0, 'Praça', NULL,  dbo.trunc_date(getDate()), 1, 7, 'pracasString', NULL, NULL, NULL, NULL); 
--1083 --nao implementado
insert into relatorioparametro (idrelatorio, idparametro, nome, opcional, titulo, datainsercao, tipo, idlista, nomeexibicao) values (1084, 1, null,              0, 'Período',  getdate(), 5, null, null);                
insert into relatorioparametro (idrelatorio, idparametro, nome, opcional, titulo, datainsercao, tipo, idlista, nomeexibicao) values (1084, 2, 'listaOperadores', 0, 'Operador', getDate(), 1, 2,    'operadoresString');           
insert into relatorioparametro (idrelatorio, idparametro, nome, opcional, titulo, datainsercao, tipo, idlista, nomeexibicao) values (1084, 3, 'listaPracas', 0, 'Praças', getDate(), 1, 7,    'pracasString');            
--1085 --nao tem parametro
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1086, 1, null, 'Período', null, dbo.trunc_date(getDate()), 6, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1086, 2, 'listaPracas', 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1086, 3, 'listaPracaPistaSentido', 'Pistas', null, dbo.trunc_date(getDate()), 1, 34, 'pracaPistaSentidoString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1086, 4, 'listaTiposIsentos', 'Tipo', null, dbo.trunc_date(getDate()), 1, 19, 'tiposIsentosString',0, null, null, null);
insert into relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1086, 5,'placa','Placa', null, dbo.trunc_date(getDate()),2,null,null,1,'exibeOpcional1',null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1087, 1, null, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1087, 2, 'listaPracas', 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1087, 3, 'listaPracaPistaSentido', 'Pistas', null, dbo.trunc_date(getDate()), 1, 34, 'pracaPistaSentidoString', 0, null, null, null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) Values(1087, 4, 'listaTAGs', 1, 'Lista de TAGs', NULL, dbo.trunc_date(getDate()), 2, NULL, NULL, NULL, NULL, 'exibeOpcional1', NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) Values(1087, 5, 'listaMeiosPagamento', 0, 'Meios de Pagamento', NULL, dbo.trunc_date(getDate()), 3, 22, 'listaMeiosPagamentoString', NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) Values(1087, 6, 'listaEmissores', 0, 'Lista de Emissores',  NULL, dbo.trunc_date(getDate()), 1, 26, NULL, NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) Values(1088, 1, null, 0, 'Data Disponibilização', null, dbo.trunc_date(getDate()), 7, null, null, null, null, null, null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) Values(1088, 2, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null, null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) Values(1088, 3, 'listaTipoCadastro', 0, 'Tipo de Cadastro', null, dbo.trunc_date(getDate()), 1, 40, 'tipoCadastroString', null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) Values(1098, 1, 'listaMeiosPagamento', 'Meios de Pagamento', NULL, dbo.trunc_date(getDate()), 3, 53, 'listaMeiosPagamentoString', 0, NULL, NULL, NULL, 'select idmeiopagamentointeroperacao id, descricao descricao from meiopagamentointeroperacao where idmeiopagamentointeroperacao = 14');
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) Values(1098, 2, 'listaGestores', 'Gestores', NULL, dbo.trunc_date(getDate()), 1, 53, 'listaGestoresString', 0, NULL, NULL, NULL, 'select idgestor id, descricao descricao from gestor where idgestor in (3, 4)');
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, datainsercao) values(1098, 3, 'recebimento', 1, 'Periodo Recebimento', null, 7, null, null, '01/01/1900 00:00:00', '01/01/2100 00:00:00', 'exibeOpcional1', dbo.trunc_date(getDate()));
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, datainsercao) values(1098, 4, 'pagamento', 1, 'Periodo Pagamento', null, 7, null, null, '01/01/1900 00:00:00', '01/01/2100 00:00:00', 'exibeOpcional2', dbo.trunc_date(getDate()));
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, datainsercao) values(1098, 5, 'idLote', 1, 'idLote', null, 2, null, null, null, null, 'exibeOpcional3', dbo.trunc_date(getDate()));
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1099, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1099, 2, 'listaPracas', 0, 'Praça',   null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1100,1,'transacao',0,'Transacao',null,dbo.trunc_date(getDate()),2,null,'transacao',null,null,null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1100,2,'motivoImpressao',0,'Motivo Impressão',null,dbo.trunc_date(getDate()),2,null,'motivoImpressao',null,null,null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1100,3,'controleImpressao',0,'Controle Impressão',null,dbo.trunc_date(getDate()),2,null,'controleImpressao',null,null,null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1100,4,'sufixo',0,'Sufixo',null,dbo.trunc_date(getDate()),2,null,'sufixo',null,null,null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1100,5,'sequencialImpressao',0,'Sequencial Impressão',null,dbo.trunc_date(getDate()),2,null,'sequencialImpressao',null,null,null,null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1101,1,'transacao',0,'Transacao',null,dbo.trunc_date(getDate()),2,null,'transacao',null,null,null,null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1101,2,'motivoImpressao',0,'Motivo Impressão',null,dbo.trunc_date(getDate()),2,null,'motivoImpressao',null,null,null,null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1101,3,'controleImpressao',0,'Controle Impressão',null,dbo.trunc_date(getDate()),2,null,'controleImpressao',null,null,null,null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1101,4,'texto',0,'Texto',null,dbo.trunc_date(getDate()),2,null,'texto',null,null,null,null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1101,5,'sufixo',0,'Sufixo',null,dbo.trunc_date(getDate()),2,null,'sufixo',null,null,null,null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1101,6,'sequencialImpressao',0,'Sequencial Impressão',null,dbo.trunc_date(getDate()),2,null,'sequencialImpressao',null,null,null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1102,1,(null),0,'Data Alocação',(null),dbo.trunc_date(getDate()),5,(null),(null),(null),(null),(null),(null));
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1102,2,'numeroTag',1,'Mídia',null,dbo.trunc_date(getDate()),2,null,null,null,null,'exibeOpcional1',null);
Insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional,  nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query)Values(1102,3, 'listaGestores', 'Gestores', NULL, dbo.trunc_date(getDate()), 1, 21, 'listaGestoresString', 1, 'exibeOpcional2', NULL, NULL, NULL);
Insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional,  nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query)Values(1102,4, 'listaMeiosPagamento', 'Meios de Pagamento', NULL, dbo.trunc_date(getDate()), 3, 22, 'listaMeiosPagamentoString', 0, null, NULL, NULL, NULL);
Insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional,  nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query)Values(1102,5, 'listaEmissores', 'Lista de Emissores', NULL, dbo.trunc_date(getDate()), 1, 26, 'emissoresString', 0, null, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1103,1,'usuario',0,'Usuários',(null),dbo.trunc_date(getDate()),3,53,(null),(null),(null),(null),'select 2 id, ''Pessoa Física'' descricao from dual union select 1 id, ''Pessoa Jurídica'' descricao from dual');
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1103,2,(null),0,'Período',(null),dbo.trunc_date(getDate()),7,(null),(null),(null),(null),(null),(null));
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1103,3,'listaTipoOrganizacao',0,'Tipo de Organização',(null),dbo.trunc_date(getDate()),1,53,'tiposString',null,null,null,'select idtipoorganizacao id, descricao descricao from tipoorganizacao');
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1103,4,'listaDepartamento',0,'Departamento',(null),dbo.trunc_date(getDate()),1,53,'departamentosString',null,null,null,'select iddepartamento id , descricao descricao from departamento');
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1103,5,'listaDivisao',0,'Divisão',(null),dbo.trunc_date(getDate()),1,53,'divisoesString',null,null,null,'select iddivisao id, descricao descricao from divisao');
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1103,6,'listaQualificacao',0,'Qualificação',(null),dbo.trunc_date(getDate()),1,53,'qualificacoesString',null,null,null,'select  idqualificacao id, descricao descricao from qualificacao');
insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) values(1104,1, null, 'Data Cadastro', null, dbo.trunc_date(getDate()), 7, null,0, 1,'exibeOpcional1','01/01/2000','01/01/2050',null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1104,2,'listausuario',0,'Usuários',(null),dbo.trunc_date(getDate()),1,53,'usuariosString',(null),(null),(null),'select 2 id, ''Pessoa Física'' descricao from dual union select 1 id, ''Pessoa Jurídica'' descricao from dual');
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1105, 1, 'pagamento', 0, 'Período de Pagamento', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) values(1105, 2, 'listaGestores', 'Gestores ', 'Gestor', dbo.trunc_date(getDate()), 1, 53, 'listaGestoresString', 0, NULL, NULL, NULL, 'select idgestor id, descricao descricao from gestor where idgestor = 3');
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) values(1105, 3, 'listaMeioPagto', 'Meios de Pagamento', 'Meio Pagamento', dbo.trunc_date(getDate()), 1, 53, 'listaMeiosPagamentoString', 0, NULL, NULL, NULL, 'select idmeiopagamentointeroperacao id, descricao descricao from meiopagamentointeroperacao where idmeiopagamentointeroperacao = 14');
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1105, 4, 'fonteRepasse', 0, 'Fonte do Repasse', 'Fonte do Repasse', dbo.trunc_date(getDate()), 1, 42, 'fonteRepasseString', null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1106, 1, NULL, 0, 'Período', NULL, dbo.trunc_date(getDate()), 5, NULL, NULL, NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1106, 2, 'listaPracas', 0, 'Praças', NULL, dbo.trunc_date(getDate()), 1, 7, 'pracasString', NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1106, 3, 'listaPracaPistaSentido', 0, 'Pistas', NULL, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1106, 4, 'listaCodigoMensagem', 0, 'Código Mensagem', NULL, dbo.trunc_date(getDate()), 3, 43, 'codigoMensagemString', NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1107, 1, NULL, 0, 'Período', NULL, dbo.trunc_date(getDate()), 7, NULL, NULL, NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1107, 2, 'listaPracas', 0, 'Praças', NULL, dbo.trunc_date(getDate()), 1, 7, 'pracasString', NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1107, 3, 'listaPracaPistaSentido', 0, 'Pistas', NULL, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) values(1108, 1, 'listapracas', 'Praça', NULL, dbo.trunc_date(getDate()), 3, 7, 'pracasstring', 0, NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) values(1108, 2, NULL, 'Período', NULL,dbo.trunc_date(getDate()), 7, NULL, NULL, 0, NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1109, 1, NULL, 0, 'Período', NULL, dbo.trunc_date(getDate()), 5, NULL, NULL, NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1109, 2, 'listaPracas', 0, 'Praças', NULL, dbo.trunc_date(getDate()), 1, 7, 'pracasString', NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) values(1110, 1, 'listapracas', 'Praça', NULL, dbo.trunc_date(getDate()), 3, 7, 'pracasstring', 0, NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) values(1110, 2, NULL, 'Período', NULL, dbo.trunc_date(getDate()), 7, NULL, NULL, 0, NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1111, 1, NULL, 0, 'Período', NULL, dbo.trunc_date(getDate()), 5, NULL, NULL, NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1111, 2, 'listaPracas', 0, 'Praças', NULL, dbo.trunc_date(getDate()), 1, 7, 'pracasString', NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) values(1112, 1, 'listapracas', 'Praça', NULL, dbo.trunc_date(getDate()), 1, 7, 'pracasstring', 0, NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional,  nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query)Values(1112, 2, 'listaPracaPistaSentido', 'Pista', NULL, dbo.trunc_date(getDate()), 1, 8, 'pracaPistaSentidoString', 0, NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) values(1112, 3, NULL, 'Período', NULL,dbo.trunc_date(getDate()), 7, NULL, NULL, 0, NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) values(1112, 4, 'idLote', 'Lote', NULL,dbo.trunc_date(getDate()), 2, NULL, NULL, 1, 'exibeOpcional1', NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao,valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)  values(1112, 5,'numeroTag',1,'Número TAG',null,dbo.trunc_date(getDate()),2,null,null,null,null,'exibeOpcional2',null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao,valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)  values(1112, 6,'statusLote',0,'Status Lote',null,dbo.trunc_date(getDate()),1,52,'statusLoteString',null,null,null,null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) values(1113, 1, NULL, 'Período', NULL,dbo.trunc_date(getDate()), 7, NULL, NULL, 0, NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) values(1113, 2, 'listapracas', 'Praça', NULL, dbo.trunc_date(getDate()), 3, 7, 'pracasstring', 0, NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) values(1113, 3, 'idLote', 'Lote', NULL,dbo.trunc_date(getDate()), 2, NULL, NULL, 1, 'exibeOpcional1', NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1114, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1114, 2, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1115, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1115, 2, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1115, 3, 'listaEmissores', 0, 'Emissor', null, dbo.trunc_date(getDate()), 1, 53, 'emissoresString', null, null, null, 'select idemissor id, descricao descricao from emissormeiopagamento where idmeiopagamentointeroperacao = 14');
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1115, 4, 'tag', 1, 'Tag', null, dbo.trunc_date(getDate()), 2, null, null, null, null, 'exibeOpcional1', null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1116, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1116, 2, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1116, 3, 'listaEmissores', 0, 'Emissor', null, dbo.trunc_date(getDate()), 1, 53, 'emissoresString', null, null, null, 'select idemissor id, descricao descricao from emissormeiopagamento where idmeiopagamentointeroperacao = 14');
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1116, 4, 'tag', 1, 'Tag', null, dbo.trunc_date(getDate()), 2, null, null, null, null, 'exibeOpcional1', null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1117, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null, null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1118, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1119, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 4, null, null, null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1119, 2, 'listaArrecadadores', 0, 'Arrecadadores', null, dbo.trunc_date(getDate()), 1, 3, 'arrecadadoresString', null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1119, 3, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1119, 4, 'listaPracaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', null, null, null, null);	
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1120, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1120, 2, 'listaArrecadadores', 0, 'Arrecadador', null, dbo.trunc_date(getDate()), 1, 3, 'arrecadadoresString', null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1120, 3, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1120, 4, 'listaPracaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1121, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 6, null, null, null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1121, 2, 'listaArrecadadores', 0, 'Arrecadadores', null, dbo.trunc_date(getDate()), 1, 3, 'arrecadadoresString', null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1121, 3, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1121, 4, 'listaPracaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', null, null, null, null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1122, 1, null,0,'Período',null,dbo.trunc_date(getDate()),5,null,null, null, null, null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1122, 2, 'listaArrecadadores',0,'Arrecadador',null,dbo.trunc_date(getDate()),1,3,'arrecadadoresString', null, null, null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1122, 3, 'listaPracas',0,'Praças',null,dbo.trunc_date(getDate()),1,7,'pracasString', null, null, null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1122, 4, 'listaPracaPistaSentido',0,'Pistas',null,dbo.trunc_date(getDate()),1,38,'pracaPistaSentidoString', null, null, null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1123, 1, null,0,'Período',null,dbo.trunc_date(getDate()),4,null,null, null, null, null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1123, 2, 'listaArrecadadores',0,'Arrecadador',null,dbo.trunc_date(getDate()),1,3,'arrecadadoresString', null, null, null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1123, 3, 'listaPracas',0,'Praças',null,dbo.trunc_date(getDate()),1,7,'pracasString', null, null, null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1123, 4, 'listaPracaPistaSentido',0,'Pistas',null,dbo.trunc_date(getDate()),1,38,'pracaPistaSentidoString', null, null, null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1124, 1, 'listaPracas',0,'Praças',null,dbo.trunc_date(getDate()),1,7,'pracasString', null, null, null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1124, 2,  null,0,'Período',null,dbo.trunc_date(getDate()),5,null,null, null, null, null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1124, 3, 'listaDeclarantes',0,'Declarantes',null,dbo.trunc_date(getDate()),1,2,'declarantesString', null, null, null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1124, 4, 'listaResponsaveis',0,'Responsáveis',null,dbo.trunc_date(getDate()),1,2,'responsaveisString', null, null, null,null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1125, 1, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1125, 2, 'listaSituacaoPerfil', 0, 'Situação', null, dbo.trunc_date(getDate()), 1, 49, 'situacaoPerfilString', null, null, null, null);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1126, 1, 'listaPracas', 0, 'Praças', null, getDate(), 1, 7, 'pracasString', null, null, null, null);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1126, 2, 'listaMeiosPagamento', 0, 'Meios de Pagamento', null, getDate(), 1, 53, 'listaMeiosPagamentoString', null, null, null, 'SELECT IDMEIOPAGAMENTOINTEROPERACAO ID, DESCRICAO DESCRICAO  FROM MEIOPAGAMENTOINTEROPERACAO WHERE FLAGPERMITEDESCONTO = 1');
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1126, 3, 'listaEmissores', 0, 'Lista de Emissores', null, getDate(), 1, 54, 'listaEmissoresString', null, null, null, null);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1126, 4, 'descricao', 1, 'Descrição ', NULL, getDate(), 2, NULL, NULL, NULL, NULL, 'exibeOpcional1', NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1126, 5, 'idmidia', 1, 'Número Mídia', NULL, getDate(), 2, NULL, NULL, NULL, NULL, 'exibeOpcional2', NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1126, 6, 'alocacao', 1, 'Período de Alocação', NULL, getDate(), 5, NULL, NULL, '01/01/1900', '01/01/2100', NULL, NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1127, 1, 'alocacao', 0, 'Período de Alocação', NULL, getdate(), 5, NULL, NULL, NULL, NULL, NULL, NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1127, 2, 'desalocacao', 1, 'Período de Desalocação', NULL, getdate(), 5, NULL, NULL,'01/01/1900', '01/01/2100', 'exibeOpcional1', NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1127, 3, 'listaMeiosPagamento', 0, 'Meios de Pagamento', 'Meio Pagamento', getdate(), 1, 53, 'listaMeiosPagamentoString', NULL, NULL, NULL, 'SELECT IDMEIOPAGAMENTOINTEROPERACAO ID, DESCRICAO DESCRICAO  FROM MEIOPAGAMENTOINTEROPERACAO WHERE FLAGPERMITEDESCONTO = 1');
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1127, 4, 'listaEmissores', 0, 'Lista de Emissores', NULL, getdate(), 1, 54, 'listaEmissoresString', NULL, NULL, NULL, NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1127, 5, 'descricao', 1, 'Descrição ', NULL, getdate(), 2, NULL, NULL, NULL, NULL, 'exibeOpcional2', NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1127, 6, 'idmidia', 1, 'Número Mídia', NULL, getdate(), 2, NULL, NULL, NULL, NULL, 'exibeOpcional3', NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1127, 7, 'listaPracas', 0, 'Praças', NULL, getdate(), 1, 7, 'pracasString', NULL, NULL, NULL, NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1128, 1, 'periodo', 0, 'Período', NULL, getdate(), 4, NULL, NULL, NULL, NULL, NULL, NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1128, 2, 'listaPracas', 0, 'Praças', NULL, getdate(), 3, 7, 'pracasString', NULL, NULL, NULL, NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1128, 3, 'idmidia', 1, 'Número Mídia', NULL, getdate(), 2, NULL, NULL, NULL, NULL, 'exibeOpcional1', NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1128, 4, 'listaMeiosPagamento', 0, 'Meios de Pagamento', 'Meio Pagamento', getdate(), 1, 53, 'listaMeiosPagamentoString', NULL, NULL, NULL, 'SELECT IDMEIOPAGAMENTOINTEROPERACAO ID, DESCRICAO DESCRICAO  FROM MEIOPAGAMENTOINTEROPERACAO WHERE FLAGPERMITEDESCONTO = 1');
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1128, 5, 'listaEmissores', 0, 'Lista de Emissores', NULL, getdate(), 1, 54, 'listaEmissoresString', NULL, NULL, NULL, NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1129, 1, 'periodo', 0, 'Período', NULL, getdate(), 5, NULL, NULL, NULL, NULL, NULL, NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1129, 2, 'listaPracas', 0, 'Praças', NULL, getdate(), 3, 7, 'pracasString', NULL, NULL, NULL, NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1129, 3, 'listaPracaPistaSentido', 0, 'Pistas', null, getdate(), 1, 34, 'pracaPistaSentidoString', null, null, null, null);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1129, 4, 'idmidia', 1, 'Número Mídia', NULL, getdate(), 2, NULL, NULL, NULL, NULL, 'exibeOpcional1', NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1129, 5, 'listaMeiosPagamento', 0, 'Meios de Pagamento', 'Meio Pagamento', getdate(), 1, 53, 'listaMeiosPagamentoString', NULL, NULL, NULL, 'SELECT IDMEIOPAGAMENTOINTEROPERACAO ID, DESCRICAO DESCRICAO  FROM MEIOPAGAMENTOINTEROPERACAO WHERE FLAGPERMITEDESCONTO = 1');
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1129, 6, 'listaEmissores', 0, 'Lista de Emissores', NULL, getdate(), 1, 54, 'listaEmissoresString', NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1130, 1, 'idtabelatarifa', 0, 'ID Tabela Tarifa', NULL, dbo.trunc_date(getDate()), 2, NULL, NULL, NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1130, 2, 'idpraca', 0, 'ID Praca', NULL, dbo.trunc_date(getDate()), 2, NULL, NULL, NULL, NULL, NULL, NULL);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1131, 1, null, 0, 'Período', null,  dbo.trunc_date(getDate()), 5, null, null, null, null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1131, 2, 'textoGenerico', 1, 'Arquivo', null,  dbo.trunc_date(getDate()), 2, null, null, null, null, 'exibeOpcional1', null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1131, 3, null, 1, 'Faixa de Malote', null,  dbo.trunc_date(getDate()), 15, null, null, null, null, 'exibeOpcional3', null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1131, 4, 'listaOperadores', 1, 'Responsavel', null,  dbo.trunc_date(getDate()), 1, 2, 'operadoresString', null, null, 'exibeOpcional2', null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1131, 5, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null, null);
--insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1131, 6, 'listaLogica', 0, 'Exibir Detalhes', null, dbo.trunc_date(getDate()), 9, null, null, null, null, null, null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1132, 1, NULL, 1, 'Data Cadastro', NULL, dbo.trunc_date(getDate()), 7, NULL, '0', dbo.trunc_date(getDate()), dbo.trunc_date(getDate())+20000, 'exibeOpcional1', NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1132, 2, 'listausuario', 0, 'Usuários', NULL, dbo.trunc_date(getDate()), 1, 53, 'usuariosString', NULL, NULL, NULL, 'select 2 id, ''Pessoa Física'' descricao from dual union select 1 id, ''Pessoa Jurídica'' descricao from dual');
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1133, 1, NULL, 0, 'Período', NULL, dbo.trunc_date(getDate()), 7, NULL, NULL, NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1133, 2, 'listausuario', 0, 'Usuários', NULL, dbo.trunc_date(getDate()), 3, 53, 'usuariosString', NULL, NULL, NULL, 'select 2 id, ''Pessoa Física'' descricao from dual union select 1 id, ''Pessoa Jurídica'' descricao from dual');
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1133, 3, 'listatipoorganizacao', 1, 'Tipos de Organização', NULL, dbo.trunc_date(getDate()), 1, 53, 'tipoOrganizacaoString', NULL, NULL, 'exibeOpcional1', 'select idtipoorganizacao id, descricao from tipoorganizacao');
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1133, 4, 'listadepartamento', 1, 'Departamentos', NULL, dbo.trunc_date(getDate()), 1, 53, 'departamentoString', NULL, NULL, 'exibeOpcional2', 'select iddepartamento id, descricao from departamento');
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1133, 5, 'listadivisao', 1, 'Divisões', NULL, dbo.trunc_date(getDate()), 1, 53, 'divisaoString', NULL, NULL, 'exibeOpcional3', 'select iddivisao id, descricao from divisao');
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1133, 6, 'listaqualificacao', 1, 'Qualificações', NULL, dbo.trunc_date(getDate()), 1, 53, 'qualificacaoString', NULL, NULL, 'exibeOpcional4', 'select idqualificacao id, descricao from qualificacao');
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1133, 7, 'nome', 1, 'Nome', NULL, dbo.trunc_date(getDate()), 2, NULL, NULL, NULL, NULL, 'exibeOpcional5', NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1135, 1, NULL, 0, 'Período Cobrança', NULL, dbo.trunc_date(getDate()), 7, NULL, NULL, NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1135, 2, 'listacontausuario', 0, 'Contas Usuário', NULL, dbo.trunc_date(getDate()), 1, 53, 'contausuarioString', NULL, NULL, NULL, 'select idconta id, idconta descricao from contausuario');
--Insert into RELATORIOPARAMETRO (IDRELATORIO,IDPARAMETRO,NOME,OPCIONAL,TITULO,COLUNA,DATAINSERCAO,TIPO,IDLISTA,NOMEEXIBICAO,VALOROPCIONALINICIAL,VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL,QUERY) values (1136,1,null,0,'Período de Apuração',null,getdate(),7,null,null,null,null,null,null);
--Insert into RELATORIOPARAMETRO (IDRELATORIO,IDPARAMETRO,NOME,OPCIONAL,TITULO,COLUNA,DATAINSERCAO,TIPO,IDLISTA,NOMEEXIBICAO,VALOROPCIONALINICIAL,VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL,QUERY) values (1136,2,'dataquitacao',0,'Período de Quitação',null,getdate(),7,null,null,null,null,null,null);
--Insert into RELATORIOPARAMETRO (IDRELATORIO,IDPARAMETRO,NOME,OPCIONAL,TITULO,COLUNA,DATAINSERCAO,TIPO,IDLISTA,NOMEEXIBICAO,VALOROPCIONALINICIAL,VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL,QUERY) values (1136,3,'listaPapeis',0,'Papel',null,getdate(),1,1,'papeisString',null,null,null,null);
--Insert into RELATORIOPARAMETRO (IDRELATORIO,IDPARAMETRO,NOME,OPCIONAL,TITULO,COLUNA,DATAINSERCAO,TIPO,IDLISTA,NOMEEXIBICAO,VALOROPCIONALINICIAL,VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL,QUERY) values (1136,4,'listaOperadores',0,'Operador',null,getdate(),1,2,'operadoresString',null,null,null,null);
--Insert into RELATORIOPARAMETRO (IDRELATORIO,IDPARAMETRO,NOME,OPCIONAL,TITULO,COLUNA,DATAINSERCAO,TIPO,IDLISTA,NOMEEXIBICAO,VALOROPCIONALINICIAL,VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL,QUERY) values (1136,5,'listaPracas',0,'Praça',null,getdate(),1,7,'pracasString',null,null,null,null);
--Insert into RELATORIOPARAMETRO (IDRELATORIO,IDPARAMETRO,NOME,OPCIONAL,TITULO,COLUNA,DATAINSERCAO,TIPO,IDLISTA,NOMEEXIBICAO,VALOROPCIONALINICIAL,VALOROPCIONALFINAL,NOMEPARAMETROOPCIONAL,QUERY) values (1136,6,'agrupaoperador',0,'Agrupar Operadores',null,getdate(),9,null,null,null,null,null,null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1137, 1, null,0,'Período',null,dbo.trunc_date(getDate()),7,null,null,null,null,null,null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1137, 2,'listaPracas',0,'Praças',null,dbo.trunc_date(getDate()),1,7,'pracasString',null,null,null,null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1137, 3,'listaPracaPistaSentido',0,'Pistas',null,dbo.trunc_date(getDate()),1,38,'pracaPistaSentidoString',null,null,null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1138, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, null, null, null, null); 
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1138, 2, 'listacondicaoPagamento', 0, 'Condição de Pagamento', null, dbo.trunc_date(getDate()), 1, 18, 'condicaoPagamentoString', null, null, null, null); 
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1138, 3, 'listaPracaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()), 1, 8, 'pracaPistaSentidoString', null, null, null, null); 
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1139, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()),4,null,null, null, null, null, null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1139, 2, 'listaArrecadadores', 0, 'Arrecadador', null, dbo.trunc_date(getDate()),1,3,'arrecadadoresString', null, null, null, null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1139, 3, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()),1,7,'pracasString', null, null, null, null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1139, 4, 'listaPracaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()),1,38,'pracaPistaSentidoString', null, null, null, null);
insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1139, 5, 'listaCobrancaSumarioGerencial', 0, 'Cobrança', null, dbo.trunc_date(getDate()), 1, 53, 'cobrancaSumarioGerencialString',null,null,null,'select idcobranca id, descricao from sgcfgcobrancameiopagamento where idcobranca <> 3');
insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1140, 1, NULL, 0, 'Período', NULL,  dbo.trunc_date(getDate()), 5, NULL, NULL, NULL, NULL, NULL, NULL); 
insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1140, 2, 'listaArrecadadores', 0, 'Arrecadador', NULL,  dbo.trunc_date(getDate()), 1, 3, 'arrecadadoresString', NULL, NULL, NULL, NULL); 
insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1140, 3, 'listaPracas', 0, 'Praças', NULL,  dbo.trunc_date(getDate()), 1, 7, 'pracasString', NULL, NULL, NULL, NULL); 
insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1140, 4, 'listaPracaPistaSentido', 0, 'Pistas', NULL,  dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', NULL, NULL, NULL, NULL); 
insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1140, 5, 'listaCobrancaSumarioGerencial', 0, 'Cobrança', NULL,  dbo.trunc_date(getDate()), 1, 53, 'cobrancaSumarioGerencialString', NULL, NULL, NULL, 'select idcobranca id, descricao from sgcfgcobrancameiopagamento where idcobranca <> 3'); 
insert into Relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query)values(1141, 1, null, 'Período', null, dbo.trunc_date(getDate()), 6, null, null, 0, null, null, null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1141, 2, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null,null);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1142, 1, NULL, 0, 'Período', NULL, dbo.trunc_date(getDate()), 5, NULL, NULL, NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1142, 2, 'listaArrecadadores', 0, ' Operador', NULL, dbo.trunc_date(getDate()), 1, 2, 'arrecadadoresString', NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1142, 3, 'listaPracas', 0, 'Praças', NULL, dbo.trunc_date(getDate()), 3, 7, 'pracasString', NULL, NULL, NULL, NULL);
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1142, 4, 'listaPracaPistaSentido', 0, 'Pistas', NULL, dbo.trunc_date(getDate()), 1, 34, 'pracaPistaSentidoString', NULL, NULL, NULL, NULL);
insert into Relatorioparametro (idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional,query)values(1142, 5, 'listaTipoOcorrencias', 0, 'Tipos Ocorrências', NULL, dbo.trunc_date(getDate()), 1, 51, 'tipoOcorrenciasString', NULL, NULL, NULL, NULL);
insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1143, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1143, 2, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional, query)values(1143, 3, 'listaOperadores', 0, ' Operadores', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1143, 4, 'listaLogica', 0, 'Exibir Abono', null, dbo.trunc_date(getDate()), 9, null, null, null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1144, 2, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional, query)values(1144, 3, 'listaOperadores', 0, ' Operadores', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1144, 4, 'listaLogica', 0, 'Exibir Abono', null, dbo.trunc_date(getDate()), 9, null, null, null, null, null, null);
insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1145, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1145, 2, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional, query)values(1145, 3, 'listaOperadores', 0, ' Operadores', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1145, 4, 'listaLogica', 0, 'Exibir Abono', null, dbo.trunc_date(getDate()), 9, null, null, null, null, null, null);
insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1146, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1146, 2, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional, query)values(1146, 3, 'listaOperadores', 0, ' Operadores', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1146, 4, 'listaLogica', 0, 'Exibir Abono', null, dbo.trunc_date(getDate()), 9, null, null, null, null, null, null);
insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1147, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1147, 2, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 3, 7, 'pracasString', null, null, null, null);
insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional, query)values(1147, 3, 'listaOperadores', 0, ' Operadores', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', null, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1147, 4, 'listaLogica', 0, 'Exibir Abono', null, dbo.trunc_date(getDate()), 9, null, null, null, null, null, null);
insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1148, 1, 'idTabelaCategorias', 0, 'idTabelaCategorias', NULL,  dbo.trunc_date(getDate()), 2, NULL, NULL, NULL, NULL, NULL, NULL); 
--insert into Relatorioparametro (idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional,query)values(1149, 1, NULL, 0, 'Período', NULL, dbo.trunc_date(getDate()), 5, NULL, NULL, NULL, NULL, NULL, NULL);
--insert into Relatorioparametro (idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional,query)values(1149, 2, 'idLote', 1, 'Lote', NULL, dbo.trunc_date(getDate()), 2, NULL, NULL, NULL, NULL, 'exibeOpcional1', NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1150, 1, NULL, 0, 'Período', NULL,  dbo.trunc_date(getDate()), 4, NULL, NULL, NULL, NULL, NULL, NULL); 
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1150, 2, NULL, 0, 'Faixa de Sequencial', NULL,  dbo.trunc_date(getDate()), 15, NULL, NULL, NULL, NULL, NULL, NULL); 
insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1151, 1, NULL, 0, 'Período', NULL,  dbo.trunc_date(getDate()), 7, NULL, NULL, NULL, NULL, NULL, NULL); 
insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1151, 2, 'listaPracas', 0, 'Praça', NULL,  dbo.trunc_date(getDate()), 3, 7, 'pracasString', NULL, NULL, NULL, NULL); 
insert into relatorioparametro (idrelatorio,idparametro,nome,opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values (1152,1,null,0,'Período',null,dbo.trunc_date(getDate()),7,null,null,null,null,null,null);
insert into relatorioparametro (idrelatorio,idparametro,nome,opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values (1152,2,'listaPracas',0,'Praças',null,dbo.trunc_date(getDate()),1,7,'pracasString',null,null,null,null);
insert into relatorioparametro (idrelatorio,idparametro,nome,opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values (1152,3,'listaOperadores',0,'Operadores',null,dbo.trunc_date(getDate()),1,2,'operadoresString',null,null,null,null);
insert into relatorioparametro (idrelatorio,idparametro,nome,opcional,titulo,coluna,datainsercao,tipo,idlista,nomeexibicao,valoropcionalinicial,valoropcionalfinal,nomeparametroopcional,query) values (1152,4,'listaTipoPagamento',0,'Tipos de Pagamento',null,dbo.trunc_date(getDate()),1,53,'tipopagamentoString',null,null,null,'select iditem id, descricao from itempagamento order by lower(descricao)');
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1153, 1, NULL, 0, 'Período', NULL,  dbo.trunc_date(getDate()), 4, NULL, NULL, NULL, NULL, NULL, NULL); 
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1153, 2, NULL, 0, 'Faixa de Sequencial', NULL,  dbo.trunc_date(getDate()), 15, NULL, NULL, NULL, NULL, NULL, NULL); 
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1154, 1, NULL, 0, 'Período', NULL,  dbo.trunc_date(getDate()), 4, NULL, NULL, NULL, NULL, NULL, NULL); 
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1154, 2, NULL, 0, 'Faixa de Sequencial', NULL,  dbo.trunc_date(getDate()), 15, NULL, NULL, NULL, NULL, NULL, NULL); 
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1154, 3, 'listaEmissoresOri', 0, 'Emissor Origem', NULL,  dbo.trunc_date(getDate()), 1, 53, 'emissoresOriString', NULL, NULL, NULL, 'select idemissor id , descricao descricao from emissormeiopagamento where idmeiopagamentointeroperacao = 14'); 
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1154, 4, 'tagOrigem', 1, 'TAG Origem', NULL,  dbo.trunc_date(getDate()), 2, NULL, NULL, NULL, NULL, NULL, NULL); 
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1154, 5, 'listaEmissoresDst', 0, 'Emissor Destino', NULL,  dbo.trunc_date(getDate()), 1, 53, 'emissoresDstString', NULL, NULL, NULL, 'select idemissor id , descricao descricao from emissormeiopagamento where idmeiopagamentointeroperacao = 14'); 
--insert into relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1154, 6, 'tagDestino', 1, 'TAG Destino', NULL,  dbo.trunc_date(getDate()), 2, NULL, NULL, NULL, NULL, NULL, NULL); 
insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query)values(1155, 1, 'idpagamento', 0, 'Identificador do Pagamento', null, dbo.trunc_date(getDate()), 2, null, null, null, null, null, null);
--insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional, query) values(1156, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, null, null, null,null);
--insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional, query) values(1156, 2, 'listaArrecadadores', 0, ' Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', null, null, null,null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1156, 3, 'listaPracas', 0, 'Praças', NULL, dbo.trunc_date(getDate()), 1, 7, 'pracasString', NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1156, 4, 'listaPracaPistaSentido', 0, 'Pistas', NULL, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', NULL, NULL, NULL, NULL);
--insert into relatorioparametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal, query) values(1156, 5, 'placa','Placa', null, dbo.trunc_date(getDate()),2,null,null,1,'exibeOpcional1',null, null,NULL);
--insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional, query) values(1157, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, null, null, null,null);
--insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional, query) values(1157, 2, 'listaArrecadadores', 0, ' Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', null, null, null,null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1157, 3, 'listaPracas', 0, 'Praças', NULL, dbo.trunc_date(getDate()), 1, 7, 'pracasString', NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1157, 4, 'listaPracaPistaSentido', 0, 'Pistas', NULL, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', NULL, NULL, NULL, NULL);
--insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional, query) values(1158, 1, null, 0, 'Período', null, dbo.trunc_date(getDate()), 7, null, null, null, null, null,null);
--insert into RelatorioParametro(IdRelatorio, IdParametro, Nome, Opcional, Titulo, Coluna, DataInsercao, Tipo, IdLista, NomeExibicao, ValorOpcionalInicial, ValorOpcionalfinal, NomeParametroOpcional, query) values(1158, 2, 'listaArrecadadores', 0, ' Operador', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', null, null, null,null);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1158, 3, 'listaPracas', 0, 'Praças', NULL, dbo.trunc_date(getDate()), 3, 7, 'pracasString', NULL, NULL, NULL, NULL);
--insert into Relatorioparametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values(1158, 4, 'listaPracaPistaSentido', 0, 'Pistas', NULL, dbo.trunc_date(getDate()), 1, 38, 'pracaPistaSentidoString', NULL, NULL, NULL, NULL);
insert into RelatorioParametro(idrelatorio, idparametro, nome, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, opcional, nomeparametroopcional, valoropcionalinicial, valoropcionalfinal) values(1159, 1, null, 'Período', null, dbo.trunc_date(getDate()), 5, null, null, 0, null, null, null);
insert into RelatorioParametro(idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional) values(1159, 2, 'listaPracas', 0, 'Praça', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null);
--1161a1164 --nao implementado
--insert into relatorioparametro (idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1165, 1, null, 0, 'Período de Pagamento', null, dbo.trunc_date(getDate()), 7, null, null, null, null, null, null);
--insert into relatorioparametro (idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1165, 2, 'listaPracas', 0, 'Praças', null, dbo.trunc_date(getDate()), 1, 7, 'pracasString', null, null, null, null);
--insert into relatorioparametro (idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1165, 3, 'listaPracaPistaSentido', 0, 'Pistas', null, dbo.trunc_date(getDate()), 1, 8, 'pracaPistaSentidoString', null, null, null, null);
--insert into relatorioparametro (idrelatorio, idparametro, nome, opcional, titulo, coluna, datainsercao, tipo, idlista, nomeexibicao, valoropcionalinicial, valoropcionalfinal, nomeparametroopcional, query) values (1165, 4, 'listaOperadores', 0, 'Operadores', null, dbo.trunc_date(getDate()), 1, 2, 'operadoresString', null, null, null, null);

---------------------------------------------------------------------------
-- Fechamento Diario = Relatório Demonstrativo Financeiro da Arrecadação -- 
---------------------------------------------------------------------------
--delete from FechamentoDiario;
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, null, null, null, null, 'Valores Arrecadados e a Receber', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 1, null, null, null, 'Valores Coletados no Período', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 1, 1, null, null, 'Valores Declarados', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 1, 1, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 1, 2, null, null, 'Diferenças', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 1, 2, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 1, 3, null, null, 'Reembolsos', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 1, 3, 1, null, 'Reembolsos Via operador do PDV', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 1, 3, 2, null, 'Reembolsos Via Tesouraria', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 1, 4, null, null, 'Troco', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 1, 4, 1, null, '', dbo.trunc_date(getDate()));

insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 2, null, null, null, 'Valores a Receber', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 2, 1, null, null, 'Transações a Receber - Arrecadação Eletrônica', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 2, 1, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 2, 2, null, null, 'Transações a Receber - Arrecadação Manual', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 2, 2, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 2, 3, null, null, 'Pagamentos Eletrônicos', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 2, 3, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 2, 4, null, null, 'Valores Antecipados', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 2, 4, 1, null, '', dbo.trunc_date(getDate()));

insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, null, null, null, 'Diferenças a Receber', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, 1, null, null, 'Arrecadador', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, 1, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, 2, null, null, 'Vendedor de Cupom', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, 2, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, 3, null, null, 'Responsável por Pista', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, 3, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, 4, null, null, 'Supervisor', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, 4, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, 5, null, null, 'Tesoureiro', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, 5, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, 6, null, null, 'Coletor de Sangria', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, 6, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, 7, null, null, 'operador do PDV', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 3, 7, 1, null, '', dbo.trunc_date(getDate()));

insert into FechamentoDiario(nivel1, nivel2, nivel3, nivel4, nivel5, descricao, datainsercao) values(1, 4, null, null, null, '  ', dbo.trunc_date(getDate()));
insert into FechamentoDiario(nivel1, nivel2, nivel3, nivel4, nivel5, descricao, datainsercao) values(1, 4, 1, null, null, 'TROCO', dbo.trunc_date(getDate()));
insert into FechamentoDiario(nivel1, nivel2, nivel3, nivel4, nivel5, descricao, datainsercao) values(1, 4, 1, 1, null, null, dbo.trunc_date(getDate()));

insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 5, null, null, null, 'Valores Antecipados', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 5, 1, null, null, 'Valores Antecipados', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(1, 5, 1, 1, null, '', dbo.trunc_date(getDate()));

insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(2, null, null, null, null, 'Receita Pagante', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(2, 1, null, null, null, 'Receita', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(2, 1, 1, null, null, 'Transações Pagantes', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(2, 1, 1, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(2, 1, 2, null, null, 'Receitas Diversas', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(2, 1, 2, 1, null, '', dbo.trunc_date(getDate()));

insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(2, 1, 3, null, null, 'Sobrantes', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(2, 1, 3, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(2, 1, 4, null, null, 'Troco a Devolver', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(2, 1, 4, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(2, 1, 5, null, null, 'Pagamentos', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(2, 1, 5, 1, null, '', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(2, 1, 6, null, null, 'Reembolsos Via Tesouraria', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(2, 1, 6, 1, null, '', dbo.trunc_date(getDate()));

insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(3, null, null,  null,null, 'Violações e Isentos', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(3, 1, null, null, null, 'Violações no Período', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(3, 1, 1, null, null, 'Violações', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(3, 1, 1, 1, null, '', dbo.trunc_date(getDate()));

insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(3, 2, null, null, null, 'Receita Isenta', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(3, 2, 1, null, null, 'Isentos Identificados Manualmente', dbo.trunc_date(getDate()));
insert into FechamentoDiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(3, 2, 1, 1, null, '', dbo.trunc_date(getDate()));
insert into Fechamentodiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(3, 2, 2, null, null, 'Isentos Identificados Eletronicamente', dbo.trunc_date(getDate()));
insert into Fechamentodiario(Nivel1, Nivel2, Nivel3, Nivel4, Nivel5, Descricao, DataInsercao) values(3, 2, 2, 1, null, '', dbo.trunc_date(getDate()));

----------------------------------------------
-- StatusRecálculo (recálculo dos sumários) -- 
----------------------------------------------
insert into StatusRecalculo(IdStatus, Descricao) values(0, 'Em Processamento');
insert into StatusRecalculo(IdStatus, Descricao) values(1, 'Aplicação Reiniciada');
insert into StatusRecalculo(IdStatus, Descricao) values(2, 'Finalizado Sucesso');
insert into StatusRecalculo(IdStatus, Descricao) values(3, 'Finalizado Erro');

------------------
-- StatusDivida -- 
------------------
insert into StatusDivida(StatusDivida, Descricao, DataInsercao) values (1, 'A Receber', dbo.trunc_date(getDate()));
insert into StatusDivida(StatusDivida, Descricao, DataInsercao) values (2, 'Liquidada', dbo.trunc_date(getDate()));
insert into StatusDivida(StatusDivida, Descricao, DataInsercao) values (3, 'Paga em Excesso', dbo.trunc_date(getDate()));

---------------------------
-- OperacaoContaCorrente -- 
---------------------------
insert into OperacaoContaCorrente(idOperacao, descricao, dataInsercao) values(1, 'Valor devido(VDA)', dbo.trunc_date(getDate()));
insert into OperacaoContaCorrente(idOperacao, descricao, dataInsercao) values(2, 'Recebimento de VDA', dbo.trunc_date(getDate()));
insert into OperacaoContaCorrente(idOperacao, descricao, dataInsercao) values(3, 'Desconto em folha(recebimento)', dbo.trunc_date(getDate()));
insert into OperacaoContaCorrente(idOperacao, descricao, dataInsercao) values(4, 'Abono', dbo.trunc_date(getDate()));
insert into OperacaoContaCorrente(idOperacao, descricao, dataInsercao) values(5, 'Consolidação de Prejuízo', dbo.trunc_date(getDate()));
insert into OperacaoContaCorrente(idOperacao, descricao, dataInsercao) values(6, 'Estorno de recebimento', dbo.trunc_date(getDate()));
insert into OperacaoContaCorrente(idOperacao, descricao, dataInsercao) values(7, 'Estorno de desconto em folha', dbo.trunc_date(getDate()));
insert into OperacaoContaCorrente(idOperacao, descricao, dataInsercao) values(8, 'Estorno de abono', dbo.trunc_date(getDate()));
insert into OperacaoContaCorrente(idOperacao, descricao, dataInsercao) values(9, 'Estorno de Consolidação de Prejuízo', dbo.trunc_date(getDate()));
insert into OperacaoContaCorrente(idOperacao, descricao, dataInsercao) values(10, 'Nota de débito e crédito', dbo.trunc_date(getDate()));
insert into OperacaoContaCorrente(idOperacao, descricao, dataInsercao) values(11, 'Estorno de Valor Devido', dbo.trunc_date(getDate()));
insert into OperacaoContaCorrente(idOperacao, descricao, dataInsercao) values(12, 'Transferência de Pagamento em Excesso', dbo.trunc_date(getDate()));

---------------------------
-- Isento ARTESP -- 
---------------------------
insert into statusprocessamentoartesp(idstatus,descricaostatus,datainsercao) values(0,'A Processar',dbo.trunc_date(getDate()));
insert into statusprocessamentoartesp(idstatus,descricaostatus,datainsercao) values(1,'Finalizado com Sucesso',dbo.trunc_date(getDate()));
insert into statusprocessamentoartesp(idstatus,descricaostatus,datainsercao) values(2,'Arquivo Inválido',dbo.trunc_date(getDate()));
insert into statusprocessamentoartesp(idstatus,descricaostatus,datainsercao) values(3,'Codigo Repetido',dbo.trunc_date(getDate()));

--------------------
--  INTEROPERAÇÃO --
--------------------

--Tipo Lancamento Lote 
insert into tipolancamentolote(idtipolancamento, descricao, datainsercao) values(0, 'Pagamento', dbo.trunc_date(getDate()));
insert into tipolancamentolote(idtipolancamento, descricao, datainsercao) values(1, 'Estorno', dbo.trunc_date(getDate()));
insert into tipolancamentolote(idtipolancamento, descricao, datainsercao) values(2, 'Valor Serviço', dbo.trunc_date(getDate()));

-- Emissor Meio Pagamento 
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(0, 14, 'Não Aplicável', 0, dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(1, 14, 'CGMP','290', dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(2, 14, 'ALESP','256', dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(3, 14, 'Dersa','258', dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(4, 14, 'AutoBan','259', dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(5, 14, 'Tebe','260', dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(6, 14, 'Via Norte','261', dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(7, 14, 'Intervias','262', dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(8, 14, 'Centrovias','263', dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(9, 14, 'Triangulo do Sol','264', dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(10, 14, 'Autovias','265', dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(11, 14, 'Renovias','266', dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(12, 14, 'Via Oeste','267', dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(13, 14, 'Ecovias','270', dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(14, 14, 'Onda Livre (PRN)','1', dbo.trunc_date(getDate()));
--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(15, 14, 'STA CRUZ','262', dbo.trunc_date(getDate()));

--insert into emissormeiopagamento(idemissor, idmeiopagamentointeroperacao, descricao, idreal, datainsercao) values(1, 15, 'Visa', 'Visa', dbo.trunc_date(getDate()));


-- Conversão da Categoria 

--CGMP
--insert into conversaocategoria(idmeiopagamentointeroperacao,  codigocategoriameiopagamento, datainsercao, idcategoria) values(14, 1, dbo.trunc_date(getDate()), 1);
--insert into conversaocategoria(idmeiopagamentointeroperacao,  codigocategoriameiopagamento, datainsercao, idcategoria) values(14, 2, dbo.trunc_date(getDate()), 2);
--insert into conversaocategoria(idmeiopagamentointeroperacao,  codigocategoriameiopagamento, datainsercao, idcategoria) values(14, 3, dbo.trunc_date(getDate()), 3);
--insert into conversaocategoria(idmeiopagamentointeroperacao,  codigocategoriameiopagamento, datainsercao, idcategoria) values(14, 4, dbo.trunc_date(getDate()), 4);
--insert into conversaocategoria(idmeiopagamentointeroperacao,  codigocategoriameiopagamento, datainsercao, idcategoria) values(14, 5, dbo.trunc_date(getDate()), 5);
--insert into conversaocategoria(idmeiopagamentointeroperacao,  codigocategoriameiopagamento, datainsercao, idcategoria) values(14, 6, dbo.trunc_date(getDate()), 6);
--insert into conversaocategoria(idmeiopagamentointeroperacao,  codigocategoriameiopagamento, datainsercao, idcategoria) values(14, 7, dbo.trunc_date(getDate()), 7);
--insert into conversaocategoria(idmeiopagamentointeroperacao,  codigocategoriameiopagamento, datainsercao, idcategoria) values(14, 8, dbo.trunc_date(getDate()), 8);
--insert into conversaocategoria(idmeiopagamentointeroperacao,  codigocategoriameiopagamento, datainsercao, idcategoria) values(14, 9, dbo.trunc_date(getDate()), 9);

--cupom vale pedagio dbtrans (e-pedagio)
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16, 1,1,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16, 2,2,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16,17,2,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16,19,2,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16, 4,3,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16,18,3,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16, 6,4,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16, 7,5,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16, 8,6,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16, 4,7,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16,18,7,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16, 5,8,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16, 9,9,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16,10,10,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16,11,11,dbo.trunc_date(getdate()));
--insert into conversaocategoria (idmeiopagamentointeroperacao,codigocategoriameiopagamento,idcategoria,datainsercao) values (16,12,12,dbo.trunc_date(getdate()));

--conversão de categoria para categorias ambíguas do CGMP
--insert into conversaocategoriatipoveiculo (idcategoria, infoveiculo, categoriaveiculo, idmeiopagamentointeroperacao) values (2, 4, 2, 14);
--insert into conversaocategoriatipoveiculo (idcategoria, infoveiculo, categoriaveiculo, idmeiopagamentointeroperacao) values (3, 4, 3, 14);
--insert into conversaocategoriatipoveiculo (idcategoria, infoveiculo, categoriaveiculo, idmeiopagamentointeroperacao) values (4, 4, 4, 14);
--insert into conversaocategoriatipoveiculo (idcategoria, infoveiculo, categoriaveiculo, idmeiopagamentointeroperacao) values (2, 3, 12, 14);
--insert into conversaocategoriatipoveiculo (idcategoria, infoveiculo, categoriaveiculo, idmeiopagamentointeroperacao) values (3, 3, 13, 14);
--insert into conversaocategoriatipoveiculo (idcategoria, infoveiculo, categoriaveiculo, idmeiopagamentointeroperacao) values (4, 3, 14, 14);

----------------------------------- 
-- Mensagem Problema - --CGMP  
--OBS.: No campo mensagemit as mensagens tem que estar cadastradas em Maiusculo.
----------------------------------- 
--insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 0, 'TAG OK', 'BOA VIAGEM', dbo.trunc_date(getDate()), 1);
--insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 1, 'Veículo Roubado', 'COD1 CGMP', dbo.trunc_date(getDate()), 0);
--insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 2, 'Inadimplente', 'COD2 CGMP', dbo.trunc_date(getDate()), 1);
--insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 3, 'Sem Contrato', 'COD3 CGMP', dbo.trunc_date(getDate()), 0);
--insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 4, 'TAG Extraviado', 'COD4 CGMP', dbo.trunc_date(getDate()), 0);
--insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 5, 'Bloqueado', 'COD5 CGMP', dbo.trunc_date(getDate()), 0);
--insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 6, 'Verificação', 'COD6 CGMP', dbo.trunc_date(getDate()), 1);
--insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 7, 'TAG na Mão', 'COD7 CGMP', dbo.trunc_date(getDate()), 1);
--insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 8, 'CAT DAC Diferente CAT TAG', 'COD8 CGMP', dbo.trunc_date(getDate()), 1);
--insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 9, 'TAG não Devolvido', 'COD9 CGMP', dbo.trunc_date(getDate()), 1);
--insert into mensagemproblema(idmeiopagamentointeroperacao, codigoproblema, descricao, mensagemit, datainsercao, permiteisencao) values(14, 10, 'TAG de Outro Veículo', 'COD10 CGMP', dbo.trunc_date(getDate()), 1);

----------------------------------- 
--Tipo de Processamentos Meio Pagamento --  
----------------------------------- 
Insert into TipoProcessamentoMeioPagamento(CodigoTipoProcessamento, DescricaoTipoProcessamento)Values(0, 'Recebimento de Cadastros');
Insert into TipoProcessamentoMeioPagamento(CodigoTipoProcessamento, DescricaoTipoProcessamento)Values(1, 'Geração de Lotes');
Insert into TipoProcessamentoMeioPagamento(CodigoTipoProcessamento, DescricaoTipoProcessamento)Values(2, 'Envio de Lotes');
Insert into TipoProcessamentoMeioPagamento(CodigoTipoProcessamento, DescricaoTipoProcessamento)Values(3, 'Recebimento de Protocolo Ténico');
Insert into TipoProcessamentoMeioPagamento(CodigoTipoProcessamento, DescricaoTipoProcessamento)Values(4, 'Recebimento de Protocolo Financeiro');
insert into TipoProcessamentoMeioPagamento(codigotipoprocessamento, descricaotipoprocessamento)values(5, 'Recebimento Vale Pedágio Comprado');
insert into TipoProcessamentoMeioPagamento(codigotipoprocessamento, descricaotipoprocessamento)values(6, 'Recebimento Vale Pedágio Realizado');
insert into TipoProcessamentoMeioPagamento(CodigoTipoProcessamento, DescricaoTipoProcessamento)values(7, 'Processamento de Cadastro Total');
insert into TipoProcessamentoMeioPagamento(CodigoTipoProcessamento, DescricaoTipoProcessamento)values(8, 'Processamento de Cadastro');
insert into TipoProcessamentoMeioPagamento(codigotipoprocessamento, descricaotipoprocessamento)values(9, 'Recebimento Desc. Manut. Geral');
insert into TipoProcessamentoMeioPagamento(codigotipoprocessamento, descricaotipoprocessamento)values(10, 'Recebimento Desc. Manut. Substituição');
insert into TipoProcessamentoMeioPagamento(codigotipoprocessamento, descricaotipoprocessamento)values(11, 'Recebimento Desc. Manut. Manutenção');
insert into TipoProcessamentoMeioPagamento(codigotipoprocessamento, descricaotipoprocessamento)values(12, 'Recebimento Desc. Manut. Concessionárias');

----------------------------------- 
-- Processamentos Meio Pagamento -- 
-----------------------------------
--Insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)Values(14, 0, 0, dbo.trunc_date(getDate()),1);
--Insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)Values(14, 0, 1, dbo.trunc_date(getDate()),1);
--Insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)Values(14, 0, 2, dbo.trunc_date(getDate()),1);
--Insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)Values(14, 0, 3, dbo.trunc_date(getDate()),1);
--Insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)Values(14, 0, 4, dbo.trunc_date(getDate()),1);
--insert into ProcessamentosMeioPagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)values(14, 0, 5, dbo.trunc_date(getDate()),1);
--insert into ProcessamentosMeioPagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)values(14, 0, 6, dbo.trunc_date(getDate()),1);
--insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)values(14, 0, 7, dbo.trunc_date(getDate()),0);
--insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)values(14, 0, 8, dbo.trunc_date(getDate()),0);
--insert into ProcessamentosMeioPagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)values(14, 0, 9, dbo.trunc_date(getDate()),1);
--insert into ProcessamentosMeioPagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)values(14, 0, 10, dbo.trunc_date(getDate()),1);
--insert into ProcessamentosMeioPagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)values(14, 0, 11, dbo.trunc_date(getDate()),1);
--insert into ProcessamentosMeioPagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)values(14, 0, 12, dbo.trunc_date(getDate()),1);

--insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)values(16 , 0 , 1, dbo.trunc_date(getdate()),1);
--insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)values(16 , 0 , 2, dbo.trunc_date(getdate()),1);
--insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)values(16 , 0 , 3, dbo.trunc_date(getdate()),1);

--Insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)Values(7, 0, 0, dbo.trunc_date(getDate()),1);
--Insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)Values(7, 0, 1, dbo.trunc_date(getDate()),1);
--Insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)Values(7, 0, 2, dbo.trunc_date(getDate()),1);
--Insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)Values(7, 0, 3, dbo.trunc_date(getDate()),1);
--Insert into processamentosmeiopagamento(idmeiopagamentointeroperacao, situacao, codigotipoprocessamento, datainsercao, sistema)Values(7, 0, 4, dbo.trunc_date(getDate()),1);

---------------------------
-- Status Meio Pagamento -- 
---------------------------
--insert into statusmeiopagamentointer(idmeiopagamentointeroperacao, codigostatus, descricao, datainserca) values(14, 0, 'Aprovada', dbo.trunc_date(getDate()));
--insert into statusmeiopagamentointer(idmeiopagamentointeroperacao, codigostatus, descricao, datainserca) values(14, 1, 'Em espera', dbo.trunc_date(getDate()));
--insert into statusmeiopagamentointer(idmeiopagamentointeroperacao, codigostatus, descricao, datainserca) values(14, 2, 'Aguardando Envio', dbo.trunc_date(getDate()));

-------------------
-- Status do TAG -- 
-------------------
--insert into statusmeiopagamentointer(idmeiopagamentointeroperacao, codigostatus, descricao, datainserca) values(14, 3, 'Aguardando Retorno', dbo.trunc_date(getDate()));
--insert into statusmeiopagamentointer(idmeiopagamentointeroperacao, codigostatus, descricao, datainserca) values(14, 4, 'Aprovada', dbo.trunc_date(getDate()));
--insert into statusmeiopagamentointer(idmeiopagamentointeroperacao, codigostatus, descricao, datainserca) values(14, 5, 'Rejeitada', dbo.trunc_date(getDate()));
--insert into statusmeiopagamentointer(idmeiopagamentointeroperacao, codigostatus, descricao, datainserca) values(14, 6, 'Não Cobrar', dbo.trunc_date(getDate()));
--insert into statusmeiopagamentointer(idmeiopagamentointeroperacao, codigostatus, descricao, datainserca) values(14, 7, 'Prejuizo', dbo.trunc_date(getDate()));
--insert into statusmeiopagamentointer(idmeiopagamentointeroperacao, codigostatus, descricao, datainserca) values(14, 8, 'Substituída', dbo.trunc_date(getDate()));
--insert into statusmeiopagamentointer(idmeiopagamentointeroperacao, codigostatus, descricao, datainserca) values(14, 9, 'Estornada', dbo.trunc_date(getDate()));


----------------------------------
-- Operação e Tipo Lacamento CC -- 
----------------------------------
insert into operacaofinanceiracc(idoperacaofinanceira, descricao, tipodevedor, tipocredor, datainsercao, tipotransacaofinanceira) values(1, 'PAGAMENTO GESTOR', 0, 2, dbo.trunc_date(getDate()), 1);
insert into operacaofinanceiracc(idoperacaofinanceira, descricao, tipodevedor, tipocredor, datainsercao, tipotransacaofinanceira) values(2, 'PAGAMENTO PROVEDOR', 0, 1, dbo.trunc_date(getDate()), 1);
insert into operacaofinanceiracc(idoperacaofinanceira, descricao, tipodevedor, tipocredor, datainsercao, tipotransacaofinanceira) values(3, 'COBRANCA GESTOR', 2, 0, dbo.trunc_date(getDate()), 2);
insert into operacaofinanceiracc(idoperacaofinanceira, descricao, tipodevedor, tipocredor, datainsercao, tipotransacaofinanceira) values(4, 'COBRANCA PROVEDOR', 1, 0, dbo.trunc_date(getDate()), 2);

insert into tipolancamentofinanceirocc(idtipolancamentofinanceiro, descricao, tipooperacao, datainsercao) values(0, 'Estorno', 0, dbo.trunc_date(getDate()));
insert into tipolancamentofinanceirocc(idtipolancamentofinanceiro, descricao, tipooperacao, datainsercao) values(0, 'Estorno', 1, dbo.trunc_date(getDate()));
insert into tipolancamentofinanceirocc(idtipolancamentofinanceiro, descricao, tipooperacao, datainsercao) values(1, 'Pagamento', 0, dbo.trunc_date(getDate()));
insert into tipolancamentofinanceirocc(idtipolancamentofinanceiro, descricao, tipooperacao, datainsercao) values(1, 'Pagamento', 1, dbo.trunc_date(getDate()));
insert into tipolancamentofinanceirocc(idtipolancamentofinanceiro, descricao, tipooperacao, datainsercao) values(2, 'Ajuste', 0, dbo.trunc_date(getDate()));
insert into tipolancamentofinanceirocc(idtipolancamentofinanceiro, descricao, tipooperacao, datainsercao) values(2, 'Ajuste', 1, dbo.trunc_date(getDate()));

----------------------------------
-- Etapa Processo Interoperação -- 
----------------------------------
insert into EtapaProcessoInteroperacao(idEtapaProcesso, descricao) values(1, 'Recebimento de Cadastros');
insert into EtapaProcessoInteroperacao(idEtapaProcesso, descricao) values(2, 'Geração de Lotes');
insert into EtapaProcessoInteroperacao(idEtapaProcesso, descricao) values(3, 'Envio de Lotes');
insert into EtapaProcessoInteroperacao(idEtapaProcesso, descricao) values(4, 'Recebimento de Protocolo Técnico');
insert into EtapaProcessoInteroperacao(idEtapaProcesso, descricao) values(5, 'Recebimento de Protocolo Financeiro');
insert into EtapaProcessoInteroperacao(idEtapaProcesso, descricao) values(6, 'Interface Provisória SGMP para Lotes');
insert into EtapaProcessoInteroperacao(idetapaprocesso, descricao) values(7, 'Recebimento Passagem Comprada');
insert into EtapaProcessoInteroperacao(idetapaprocesso, descricao) values(8, 'Recebimento Passagem Realizada');
insert into etapaprocessointeroperacao(idetapaprocesso, descricao) values(9, 'Recebimento Desc. Manut. Geral');
insert into etapaprocessointeroperacao(idetapaprocesso, descricao) values(10, 'Recebimento Desc. Manut. Substituição');
insert into etapaprocessointeroperacao(idetapaprocesso, descricao) values(11, 'Recebimento Desc. Manut. Manutenção');
insert into etapaprocessointeroperacao(idetapaprocesso, descricao) values(12, 'Recebimento Desc. Manut. Concessionárias');

-----------------------------------
-- Configuracao Apagamento Grupo -- 
-----------------------------------
insert into configuracaoapagamentogrupo(idgrupotabela,descgrupotabela,prazoapagamento,apagamento, datainsercao) values ('1' ,'Transações Sem Correção','100','1', dbo.trunc_date(getDate()));
insert into configuracaoapagamentogrupo(idgrupotabela,descgrupotabela,prazoapagamento,apagamento, datainsercao) values ('2' ,'Transações Corrigidas','100','1', dbo.trunc_date(getDate()));
insert into configuracaoapagamentogrupo(idgrupotabela,descgrupotabela,prazoapagamento,apagamento, datainsercao) values ('3' ,'Dados Operacionais','100','1', dbo.trunc_date(getDate()));
insert into configuracaoapagamentogrupo(idgrupotabela,descgrupotabela,prazoapagamento,apagamento, datainsercao) values ('4' ,'Sumário Operacional','100','1', dbo.trunc_date(getDate()));
insert into configuracaoapagamentogrupo(idgrupotabela,descgrupotabela,prazoapagamento,apagamento, datainsercao) values ('5' ,'Contratos','100','0', dbo.trunc_date(getDate()));
insert into configuracaoapagamentogrupo(idgrupotabela,descgrupotabela,prazoapagamento,apagamento, datainsercao) values ('6' ,'Estoque','100','0', dbo.trunc_date(getDate()));
insert into configuracaoapagamentogrupo(idgrupotabela,descgrupotabela,prazoapagamento,apagamento, datainsercao) values ('7' ,'Logística','100','0', dbo.trunc_date(getDate()));
insert into configuracaoapagamentogrupo(idgrupotabela,descgrupotabela,prazoapagamento,apagamento, datainsercao) values ('8' ,'Provedores','100','0', dbo.trunc_date(getDate()));

-------------------
-- Motivo Recusa -- 
------------------- 
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (0,'Aprovada', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (1,'Transação Repetida', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (2,'Passagem Manual sem TAG', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (3,'Passagem Manual TAG não  existente', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (4,'Passagem Manual de Placa Incompatível', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (5,'Reserva', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (6,'Passagem Válida de Lista Nela', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (7,'Praça Inválida', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (8,'Valor Passagem não correspondente à CAT', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (9,'Código da Tarifa cobrada não compatível', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (10,'Passagem fora do período de aceitação', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (11,'Substituição de passagem consolidada', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (12,'Registro vazio', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (13,'Passagem de Isento com Valor', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (14,'Registro sem imagem', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (15,'Horário da passagem incompatível (4)', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (33,'Emissor de TAG inválido', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (53,'Passagem sem valor isento', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (83,'Passagem de lista nela para verificação', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (84,'Passagens isentas', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (98,'Evasão aceita como passagem válida', 14, dbo.trunc_date(getDate()));
--insert into motivorecusa (idmotivorecusa,descricaomotivorecusa,idmeiopagamentointeroperacao,datainsercao)values (99,'Evasão para Autuação', 14, dbo.trunc_date(getDate()));

-----------------------------------
-- Tipo Status Arquivo Transação -- 
-----------------------------------
Insert Into TipoStatusArquivoTransacao (StatusArquivo, Descricao, DataInsercao) values (0, 'Gerando',dbo.trunc_date(getDate()));
Insert Into TipoStatusArquivoTransacao (StatusArquivo, Descricao, DataInsercao) values (1, 'Aplicação Reiniciada',dbo.trunc_date(getDate()));
Insert Into TipoStatusArquivoTransacao (StatusArquivo, Descricao, DataInsercao) values (2, 'Finalizado com Sucesso',dbo.trunc_date(getDate()));
Insert Into TipoStatusArquivoTransacao (StatusArquivo, Descricao, DataInsercao) values (3, 'Finalizado com Erro',dbo.trunc_date(getDate()));
Insert Into TipoStatusArquivoTransacao (StatusArquivo, Descricao, DataInsercao) values (4, 'Removido',dbo.trunc_date(getDate()));

insert into textoadicionalimpressao (idtextoadicional, idtipo, texto) values ('1', '1', 'O usuário da concessionária reconhece a passagem acima e compromete-se a realizar o pagamento no prazo máximo de 15 dias a contar da data e hora da passagem, sob pena da autuação, realizada por agente de trânsito competente, pela infração de "evasão de pedágio" prevista no artigo 209 do Código de Trânsito Brasileiro. O Usuário reconhece a finalidade desse documento de caráter emergencial, e declara estar ciente que não será autorizado caso de reincidência.');
insert into motivoimpressao (idmotivoimpressao, descricao, dataalteracao, datainsercao) values (1, 'Via do Usuário', dbo.trunc_date(getDate()), dbo.trunc_date(getDate()));

--------------------------
-- Visualizaçao Manuais -- 
--------------------------
insert into visualizacaomanuais(idvisualizacao,idpapel,caminhoarquivo) values (0,0,'D:\sicat\app\server\sgap\deploy\manuais.war\M23-101-1007.pdf');
insert into visualizacaomanuais(idvisualizacao,idpapel,caminhoarquivo) values (1,1,'D:\sicat\app\server\sgap\deploy\manuais.war\M23-101-1001.pdf');
insert into visualizacaomanuais(idvisualizacao,idpapel,caminhoarquivo) values (3,3,'D:\sicat\app\server\sgap\deploy\manuais.war\M23-101-1003.pdf');
insert into visualizacaomanuais(idvisualizacao,idpapel,caminhoarquivo) values (4,4,'D:\sicat\app\server\sgap\deploy\manuais.war\M23-101-1002.pdf');
insert into visualizacaomanuais(idvisualizacao,idpapel,caminhoarquivo) values (5,5,'D:\sicat\app\server\sgap\deploy\manuais.war\M23-101-1005.pdf');
--insert into visualizacaomanuais(idvisualizacao,idpapel,caminhoarquivo) values (10,10,'D:\sicat\app\server\sgap\deploy\manuais.war\M23-101-1001.pdf');

-------------------------------------
-- Codigo Retornos Arquivos Malote -- 
-------------------------------------
insert into CodigoRetornoArquivoMalote (idCodigoRetorno, descricao, dataInsercao)values(0, 'Arquivo Importado com Sucesso.', dbo.trunc_date(getDate()));
insert into CodigoRetornoArquivoMalote (idCodigoRetorno, descricao, dataInsercao)values(1, 'Layout de arquivo inválido.', dbo.trunc_date(getDate()));
insert into CodigoRetornoArquivoMalote (idCodigoRetorno, descricao, dataInsercao)values(2, 'Há malote(s) com status inválido no arquivo.', dbo.trunc_date(getDate()));
insert into CodigoRetornoArquivoMalote (idCodigoRetorno, descricao, dataInsercao)values(3, 'Há malote(s) com identificação repetida no arquivo.', dbo.trunc_date(getDate()));
insert into CodigoRetornoArquivoMalote (idCodigoRetorno, descricao, dataInsercao)values(4, 'Há malote não cadastrado no sistema.', dbo.trunc_date(getDate()));
insert into CodigoRetornoArquivoMalote (idCodigoRetorno, descricao, dataInsercao)values(5, 'Valor total inconsistente no malote.', dbo.trunc_date(getDate()));
insert into CodigoRetornoArquivoMalote (idCodigoRetorno, descricao, dataInsercao)values(6, 'Há malote(s) pertencente(s) a uma praça diferente da local.', dbo.trunc_date(getDate()));
insert into CodigoRetornoArquivoMalote (idCodigoRetorno, descricao, dataInsercao)values(7, 'Há malote(s) com data de depósito inválida.', dbo.trunc_date(getDate()));
insert into CodigoRetornoArquivoMalote (idCodigoRetorno, descricao, dataInsercao)values(8, 'Sistema configurado incorretamente. Contate o Suporte Técnico.', dbo.trunc_date(getDate()));

-----------------
-- Caminho AVC -- 
-----------------
--insert into caminhoacv(idorigem, caminhoarquivo, datainsercao) values(7601700530001, '\\192.168.200.201\sicat$\ACV\DADOS\CV01', dbo.trunc_date(getDate()));

-----------------------------
-- Motivo Fechamento Pista -- 
-----------------------------													--ALTERADO
insert into motivofechamentopista(codigocv, descricao) values (3,'Fim de Turno');
insert into motivofechamentopista(codigocv, descricao) values (10,'Refeição');
insert into motivofechamentopista(codigocv, descricao) values (11,'Troca de Turno');
insert into motivofechamentopista(codigocv, descricao) values (12,'Troca de Pista');
insert into motivofechamentopista(codigocv, descricao) values (13,'QTO (banheiro)');
insert into motivofechamentopista(codigocv, descricao) values (14,'Fechamento Antecipado');
insert into motivofechamentopista(codigocv, descricao) values (15,'Manutenção da Pista');


----------------------------
-- Check List Operacional -- 
----------------------------
-- Condição 1: Existência de lacuna.
insert into CondicaoConsolidacao(IDCondicao, Condicao, Descricao, Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, Periodo, DataInsercao)values (1,'Lacunas Abertas ou em Recuperação','Não deve haver lacunas de dados, ou essa condição deve ser explicitamente ignorada.','Para verificar acesse o menu Receita > Completude > Lacunas com o perfil Administrativo.',1,1,0,0,0,1,1,0,1,dbo.trunc_date(getdate()));
-- Condição 2: Atualização da praça.
insert into CondicaoConsolidacao(IDCondicao, Condicao, Descricao, Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, Periodo, DataInsercao)values (2,'Praça Atualizada','A praça deve estar atualizada num instante posterior à data declaração ou à data fim do período a ser bloqueado.','Para verificar acesse o menu Receita > Completude > Atualização com o perfil Administrativo.',1,1,0,0,0,1,1,0,1, dbo.trunc_date(getdate()));
-- Condição 3: Declaração de mesma praça.
insert into CondicaoConsolidacao(IDCondicao, Condicao, Descricao, Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, Periodo, DataInsercao)values (3,'Declaração Local','A declaração deve ser da mesma praça local.','Verifique os dados do login na barra superior da interface com o perfil Administrativo ou Supervisor.',1,1,1,1,1,1,1,1,0, dbo.trunc_date(getdate()));
-- Condição 4: Estado da declaração
insert into CondicaoConsolidacao(IDCondicao, Condicao, Descricao, Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, Periodo, DataInsercao)values (4,'Estado da Declaração','A declaração deve estar em um dos seguintes estados: Encerrada; Pré-consolidada; ou Desconsolidada.','Para verificar acesse o menu Declaração > Apuração de Resultados com o perfil Administrativo ou Supervisor, filtre pela declaração a ser consolidada e verifique a coluna estado.',1,1,1,1,1,1,1,1,0, dbo.trunc_date(getdate()));
-- Condição 5: Todas as transações definitivamente corrigidas.
insert into CondicaoConsolidacao(IDCondicao, Condicao, Descricao, Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, Periodo, DataInsercao)values (5,'Transações Corrigidas','Todas as transações correspondentes ao período de trabalho devem ter sido corrigidas de forma definitiva.','Para verificar acesse o menu Receita > Transações > Correção Definitiva com o perfil Supervisor.',1,0,0,0,0,1,1,0,1, dbo.trunc_date(getdate()));
-- Condição 6: Declaração de Coletores de Sangria consolidadas.
insert into CondicaoConsolidacao(IDCondicao, Condicao, Descricao, Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, Periodo, DataInsercao)values (6,'Declaração de Coletores de Sangria','As declarações dos coletores de sangria que receberam valores do arrecadador já devem ter sido consolidadas, pré-consolidadas ou bloqueadas.','Para verificar acesse o menu Declaração > Apuração de Resultados com o perfil Administrativo ou Supervisor, filtre pelas declarações de coletores de sangria e verifique a coluna estado.',1,0,0,0,0,0,0,0,0, dbo.trunc_date(getdate()));
-- Condição 7: Malotes depositados.
insert into CondicaoConsolidacao(IDCondicao, Condicao, Descricao, Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, Periodo, DataInsercao)values (7,'Depósito de Malotes','Todos os malotes associados à declaração, caso existam malotes associados à declaração, deve ter sido depositado.','Para verificar acesse o menu Tesouraria > Malotes > Registro de Depósito com o perfil Tesoureiro.',1,1,1,1,1,1,1,1,1, dbo.trunc_date(getdate()));
-- Condição 8: Outra declaração para o período coberto.
insert into CondicaoConsolidacao(IDCondicao, Condicao, Descricao, Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, Periodo, DataInsercao)values (8,'Período da Declaração','Não deve haver outra declaração (consolidada ou pré-consolidada) para o mesmo operador, mesmo papel, mesma origem, no período coberto pela declaração em questão.','Para verificar acesse o menu Declaração > Apuração de Resultados com o perfil Administrativo ou Supervisor.',1,1,1,1,1,1,1,1,0, dbo.trunc_date(getdate()));
-- Condição 9: Operadores entregaram dinheiro no caixa.
insert into CondicaoConsolidacao(IDCondicao, Condicao, Descricao, Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, Periodo, DataInsercao)values (9,'Operadores que Entregaram Arrecadação no Caixa','As declarações dos operador que entregaram dinheiro no caixa já devem ter sido consolidadas.','Para verificar acesse o menu Declaração > Apuração de Resultados com o perfil Administrativo ou Supervisor, filtre pelas declarações de operadores que entregaram dinheiro no caixa e verifique a coluna estado.',0,0,0,1,0,0,0,0,0, dbo.trunc_date(getdate()));
-- Condição 10: Verifica se possui sangrias associadas à declação com o estado "a conferir"
insert into CondicaoConsolidacao(IDCondicao, Condicao, Descricao, Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, Periodo, DataInsercao)values (10,'Estado das Sangrias da Declaração','As sangrias associadas à declaração devem estar encerradas.','Para verificar acesse o menu Declaração > Apuracao de Resultados com o perfil Administrativo ou Supervisor, filtre pelas sangrias realizadas que não estejam encerradas.',1,1,1,1,1,1,1,1,0, dbo.trunc_date(getdate()));
-- Condição 11: Verifica se existe troco pendente, estado "a conferir"
insert into CondicaoConsolidacao(IDCondicao, Condicao, Descricao, Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, Periodo, DataInsercao)values (11,'Estado do Troco','Os trocos associados à declaração devem estar com o estado encerrado (Para forma de devolução de troco configurada como explícita).','Para verificar acesse o menu Tesouraria > Caixa > Recebimento de Valores, com o perfil Tesoureiro, e filtre pelos trocos a receber.',1,1,1,1,1,1,1,1,0, dbo.trunc_date(getdate()));
-- Condição 12: Verifica se a declaração de pista está incompleta.
insert into CondicaoConsolidacao(IDCondicao, Condicao, Descricao, Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, Periodo, DataInsercao)values (12,'Declaração de Pista','As declarações realizadas em pista devem estar completas.','Para verificar acesse o menu Ferramentas > Relatórios e emita o relatório 1025 - Trilha de Auditoria, selecionar a operação: Mensagens de Declaração ou Sangria feitas na Pista.',1,0,0,0,0,0,0,0,0, dbo.trunc_date(getdate()));
-- Condição 13: Verifica se as sangrias estão incompletas.
insert into CondicaoConsolidacao(IDCondicao, Condicao, Descricao, Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, Periodo, DataInsercao)values (13,'Sangrias de Pista','As sangrias devem estar completas.','Para verificar acesse o menu Ferramentas > Relatórios e emita o relatório 1025 - Trilha de Auditoria, selecionar a operação: Mensagens de Declaração ou Sangria feitas na Pista.',1,0,0,0,0,0,0,0,0, dbo.trunc_date(getdate()));

--------------------------------------
-- Check List Operacional - Período -- 
--------------------------------------
--Condição 14 - Lacunas Ignoradas
insert into CondicaoConsolidacao(IDCondicao,Condicao,Descricao,Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, PERIODO, DataInsercao) Values (14, 'Lacunas Ignoradas', 'Há lacunas ignoradas, se o período for bloqueado, não será possível atualizá-las.', 'Para verificar acesse o menu Receita > Completude > Lacunas com o perfil Administrativo.', 0, 0, 0, 0, 0, 0, 0, 0, 1,dbo.trunc_date(getDate()));
--Condição 15 - Declarações Consolidadas
insert into CondicaoConsolidacao(IDCondicao,Condicao,Descricao,Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, PERIODO, DataInsercao) values (15, 'Declarações Consolidadas', 'As declarações feitas no período devem estar consolidadas.', 'Para verificar acesse o menu Declaração > Apuração de Resultados com o perfil de Supervisor ou Administrativo, e filtre as declarações do período que não estejam consolidadas.', 0, 0, 0, 0, 0, 0, 0, 0, 1,dbo.trunc_date(getdate()));
--Condição 16 - Declarações Bloqueadas
insert into CondicaoConsolidacao(IDCondicao,Condicao,Descricao,Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, PERIODO, DataInsercao)values (16, 'Declarações Bloqueadas', 'As declarações feitas no período devem estar bloqueadas.', 'Para verificar acesse o menu Declaração > Apuração de Resultados com o perfil de Supervisor ou Administrativo, e filtre as declarações do período que não estejam bloqueadas.', 0, 0, 0, 0, 0, 0, 0, 0, 1,dbo.trunc_date(getdate()));
--Condição 17 - Miniturnos Declarados
insert into CondicaoConsolidacao(IDCondicao,Condicao,Descricao,Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, PERIODO, DataInsercao)values (17, 'Miniturnos Declarados', 'Todos os miniturnos do período devem estar declarados.', 'Para verificar acesse o menu Declaração > Apuração de Resultados com o perfil de Supervisor ou Administrativo, e filtre por miniturnos do período com estado pendente.', 0, 0, 0, 0, 0, 0, 0, 0, 1,dbo.trunc_date(getdate()));
--Condição 18 - Sangrias Associadas às Declarações
insert into CondicaoConsolidacao(IDCondicao,Condicao,Descricao,Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, PERIODO, DataInsercao)values (18, 'Sangrias Associadas às Declarações', 'Todos os sangrias do período devem associadas à uma declaração.', 'Para verificar acesse o menu Declaração > Apuração de Resultados com o perfil de Supervisor ou Administrativo, e filtre pelas sangrias do período.', 0, 0, 0, 0, 0, 0, 0, 0, 1,dbo.trunc_date(getdate()));
--Condição 19 - Malotes Associados às Declarações
insert into CondicaoConsolidacao(IDCondicao,Condicao,Descricao,Verificacao, Arrecadador, ColetorSangria, Supervisor, Tesoureiro, VendedorCupom, PistaFechada, PistaAutomatica, ResponsavelPista, PERIODO, DataInsercao) values (19, 'Malotes Associados às Declarações', 'Todos os malotes do período devem associadas à uma declaração.', 'Verifique em Declaração > Apuração de Resultados com o perfil de Supervisor ou Administrativo, se há declarações do período que não foram consolidadas.', 0, 0, 0, 0, 0, 0, 0, 0, 1,dbo.trunc_date(getdate()));

--------------
-- Exceções ISPM/ISPP-- 
--------------
--insert into Excecao(IdExcecao, Descricao, DataInsercao) values (1, 'Passagem no mesmo sentido', getDate());
--insert into Excecao(IdExcecao, Descricao, DataInsercao) values (2, 'Passagem com tipo de veículo diferente', getDate());
--insert into Excecao(IdExcecao, Descricao, DataInsercao) values (3, 'Passagem em Intervalo inferior ao Configurado', getDate());
--insert into Excecao(IdExcecao, Descricao, DataInsercao) values (4, 'Passagem ISPM/ISPP sem Passagem Pagante Registrada', getDate());

---------------------------
--configuração de pista -- 
---------------------------

--TipoConfiguracaoCV
--insert into TipoConfiguracaoCV (IdTipoConfCV, DESCRICAO, DATAINSERCAO) values (1, 'Número', dbo.trunc_date(getDate()));
--insert into TipoConfiguracaoCV (IdTipoConfCV, DESCRICAO, DATAINSERCAO) values (2, 'String', dbo.trunc_date(getDate()));
--insert into TipoConfiguracaoCV (IdTipoConfCV, DESCRICAO, DATAINSERCAO) values (3, 'Boolean', dbo.trunc_date(getDate()));

--Sessão
--insert into Sessao(IdSessao, Nome, DataInsercao, Habilitado) values(1, 'Fotos por categoria', dbo.trunc_date(getDate()), 1);
--insert into Sessao(IdSessao, Nome, DataInsercao, Habilitado) values(2, 'Log', dbo.trunc_date(getDate()), 1);
--insert into Sessao(IdSessao, Nome, DataInsercao, Habilitado) values(3, 'Velocidade', dbo.trunc_date(getDate()), 1);
--insert into Sessao(IdSessao, Nome, DataInsercao, Habilitado) values(4, 'Declaração', dbo.trunc_date(getDate()), 1);
--insert into Sessao(IdSessao, Nome, DataInsercao, Habilitado) values(5, 'Mensagem', dbo.trunc_date(getDate()), 1);
--insert into Sessao(IdSessao, Nome, DataInsercao, Habilitado) values(6, 'Caixa', dbo.trunc_date(getDate()), 1);
--insert into Sessao(IdSessao, Nome, DataInsercao, Habilitado) values(7, 'VAS', dbo.trunc_date(getDate()), 1);
--insert into Sessao(IdSessao, Nome, DataInsercao, Habilitado) values(8, 'VES', dbo.trunc_date(getDate()), 1);
--insert into Sessao(IdSessao, Nome, DataInsercao, Habilitado) values(9, 'Códigos DBTRANS', dbo.trunc_date(getDate()), 1);
--insert into Sessao(IdSessao, Nome, DataInsercao, Habilitado) values(10,'Configuração de recibo', dbo.trunc_date(getDate()), 1);
--insert into Sessao(IdSessao, Nome, DataInsercao, Habilitado) values(11,'Linhas de recibo', dbo.trunc_date(getDate()), 1);

--Configuração CV
--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(101, 1, null, 2, 'Dias armazenamento log', 'Indica por quantos dias o log AVI de pista será armazenado.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(102, 1, null, 2, 'Dias armazenamento log AVI', 'Indica por quantos dias o log AVI de pista será armazenado.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(103, 1, null, 2, 'Nível de registro de log', 'Indica o quão detalhado será o registro de log: 0 - Nenhum; 1 - Básico; 2 - Moderado; 3 - Completo;', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(104, 1, null, 5, 'Dias armazenamento mensagens', 'Indica por quantos dias o arquivo de mensagens será armazenado na pista.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(105, 1, null, 3, 'Velocidade máxima em pista', 'Velocidade, em Km/h, acima da qual será adquirida a imagem e registrado o excesso de velocidade.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(106, 1, null, 3, 'Modo de cálculo', 'Indica o modo usado no cálculo da velocidade do veículo: 0 - Desabilitado; 1 - calculado pelo AVC; 2 - calculo pelo SIV;', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(107, 1, null, 6, 'Valor em caixa', 'Indica o valor em caixa da pista, em centavos, acima do qual será exibido um aviso ao arrecadador.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(108, 1, null, 7, 'Tipo de pulso manual', 'VAS Manual - Indica o tipo de pulso utilizado pelo VAES: 0 - Edge; 1 - Level;', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(109, 1, null, 7, 'Intervalo fotos manual', 'VAS Manual - Indica o intervalo de tempo, em milissegundos, entre a aquisição das fotos (100 a 800 ms).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(110, 1, null, 7, 'Qtd. máxima fotos manual', 'VAS Manual - Indica a quantidade máxima de fotos que será armazenada por transação (1 a 250 fotos).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(111, 1, null, 7, 'Gatilho início manual', 'VAS Manual - Indica o código do gatilho de início de aquisição de imagem: 63001 - Loop On; 63002 - Loop Off; 63003 - Barr On; 63004 - Barr Off; 63005 - Loop + Barr On;', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(112, 1, null, 7, 'Gatilho fim manual', 'VAS Manual - Indica o código do gatilho de fim de aquisição de imagem: 63001 - Loop On; 63002 - Loop Off; 63003 - Barr On; 63004 - Barr Off; 63005 - Loop + Barr On;', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(113, 1, null, 8, 'Tipo pulso manual', 'VES Manual - Indica o tipo de pulso utilizado pelo VAES: 0 - Edge; 1 - Level;', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(114, 1, null, 8, 'Intervalo fotos manual', 'VES Manual - Indica o intervalo de tempo, em milissegundos, entre a aquisição das fotos (100 a 800 ms).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(115, 1, null, 8, 'Qtd. máxima de fotos manual', 'VES Manual - Indica a quantidade máxima de fotos que será armazenada por transação (1 a 250 fotos).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(116, 1, null, 8, 'Gatilho início manual', 'VES Manual - Indica o código do gatilho de início de aquisição de imagem: 63001 - Loop On; 63002 - Loop Off; 63003 - Barr On; 63004 - Barr Off; 63005 - Loop + Barr On;', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(117, 1, null, 8, 'Gatilho fim manual', 'VES Manual - Indica o código do gatilho de fim de aquisição de imagem: 63001 - Loop On; 63002 - Loop Off; 63003 - Barr On; 63004 - Barr Off; 63005 - Loop + Barr On;', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(118, 1, null, 7, 'Tipo de pulso AVI', 'VAS AVI - Indica o tipo de pulso utilizado pelo VAES: 0 - Edge; 1 - Level;', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(119, 1, null, 7, 'Intervalo fotos AVI', 'VAS AVI - Indica o intervalo de tempo, em milissegundos, entre a aquisição das fotos (100 a 800 ms).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(120, 1, null, 7, 'Qtd. máxima de fotos AVI', 'VAS AVI - Indica a quantidade máxima de fotos que será armazenada por transação (1 a 250 fotos).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(121, 1, null, 7, 'Gatilho início AVI', 'VAS AVI - Indica o código do gatilho de início de aquisição de imagem: 63001 - Loop On; 63002 - Loop Off; 63003 - Barr On; 63004 - Barr Off; 63005 - Loop + Barr On;', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(122, 1, null, 7, 'Gatilho fim AVI', 'VAS AVI - Indica o código do gatilho de fim de aquisição de imagem: 63001 - Loop On; 63002 - Loop Off; 63003 - Barr On; 63004 - Barr Off; 63005 - Loop + Barr On;', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(123, 1, null, 8, 'Tipo de pulso AVI', 'VES AVI - Indica o tipo de pulso utilizado pelo VAES: 0 - Edge; 1 - Level;', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(124, 1, null, 8, 'Intervalo fotos AVI', 'VES AVI - Indica o intervalo de tempo, em milissegundos, entre a aquisição das fotos (100 a 800 ms).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(125, 1, null, 8, 'Qtd. máxima de fotos AVI', 'VES AVI - Indica a quantidade máxima de fotos que será armazenada por transação (1 a 250 todos).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(126, 1, null, 8, 'Gatilho início AVI', 'VES AVI - Indica o código do gatilho de início de aquisição de imagem: 63001 - Loop On; 63002 - Loop Off; 63003 - Barr On; 63004 - Barr Off; 63005 - Loop + Barr On;', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(127, 1, null, 8, 'Gatilho fim AVI', 'VES AVI - Indica o código do gatilho de fim de aquisição de imagem: 63001 - Loop On; 63002 - Loop Off; 63003 - Barr On; 63004 - Barr Off; 63005 - Loop + Barr On;', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(150, 1, null, 9, 'Id operadora', 'Código de identificação da operadora de Cupom Vale Pedágio DBTRANS (0 a 99).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(151, 2, null, 9, 'Nome concessionária', 'Nome da Concessionária para a operação com Cupom Vale Pedágio DBTRANS.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(152, 1, null, 9, 'Id praça', 'Código de identificação da praça para a operação com Cupom Vale Pedágio DBTRANS.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(153, 2, null, 9, 'Nome praça', 'Nome da praça para a operação com Cupom Vale Pedágio DBTRANS.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(154, 2, null, 4, 'Declaração e Sangria com Malotes', 'Indica se estará habilitada a função para declaração e sangria em pista com criação de malotes. (0 - desabilitado; 1 - habilitado).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(155, 2, null, 4, 'Tipo malote', 'Indica o tipo do malote a ser criado na declaração: 0 - não usa; 1 - malote único; 2 - malote de dinheiro e cheques, separado de cupons (2 malotes); 3 - malote de dinheiro separado de cheques e separado de cupons (3 malotes)', 1, 0, dbo.trunc_date(getDate()));

--configuração de recibo
--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(500, 1, null, 10, 'Quantidade linhas recibo', 'Quantidade de linhas que serão impressas no recibo. Deve ser um valor igual ou superior à quantidade de linhas configuradas na seção Linhas de Recibo, pois se o valor configurado for inferior, as linhas seguintes não serão impressas. O valor máximo é 100.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(501, 1, null, 10, 'Quantidade linhas cabeçalho recibo', 'Quantidade de linhas de cabeçalho que serão impressas no recibo. Deve ser um valor igual ou superior à quantidade de linhas de cabeçalho configuradas na seção Linhas de Recibo, pois se o valor configurado for inferior, as linhas seguintes não serão consideradas parte do cabeçalho. O valor deve estar entre 1 e 10 e não deve ser maior que a quantidade total de linhas de recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(502, 2, null, 10, 'Id sentido 1', 'Identificação do sentido 1 a ser impresso no recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(503, 2, null, 10, 'Id sentido 2', 'Identificação do sentido 2 a ser impresso no recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(504, 1, null, 10, 'Quantidade linhas antes', 'Indica a quantidade de linhas que ficarão em branco antes da impressão do cabeçalho dos recibos.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(505, 1, null, 10, 'Quantidade linhas após', 'Indica a quantidade de linhas que ficarão em branco após a impressão dos recibos.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(506, 1, null, 10, 'Máximo recibos', 'Indica o número máximo de reimpressões de recibos permitido por transação.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(507, 3, null, 10, 'Imprime classificação', 'Indica se haverá impressão automática de recibo após a classificação ou se o mesmo deverá ser solicitado manualmente (NÃO - manual; SIM - automática).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(508, 3, null, 10, 'Imprime não pagos', 'Indica se haverá impressão automática de recibo para veículos não pagos ou se o mesmo deverá ser solicitado manualmente (NÃO - manual; SIM - automática).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(509, 3, null, 10, 'Imprime isentos', 'Indica se haverá impressão automática de recibo para veículos isentos ou se o mesmo deverá ser solicitado manualmente (NÃO - manual; SIM - automática).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(510, 3, null, 10, 'Imprime violações', 'Indica se haverá impressão automática de recibo para veículos violadores ou se o mesmo deverá ser solicitado manualmente (NÃO - manual; SIM - automática).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(511, 3, null, 10, 'Imprime subclassificações', ' Indica se haverá impressão automática de recibo para veículos com subclassificação ou se o mesmo deverá ser solicitado manualmente (NÃO - manual; SIM - automática).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(512, 3, null, 10, 'Imprime Visa Vale Pedágio', ' Indica se haverá impressão automática de recibo para veículos pagos com Visa Vale Pedágio ou se o mesmo deverá ser solicitado manualmente (NÃO - manual; SIM - automática).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(513, 3, null, 10, 'Imprimi Smart Card', ' Indica se haverá impressão automática de recibo para veículos pagos com Smartcard ou se o mesmo deverá ser solicitado manualmente (NÃO - manual; SIM - automática).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(514, 3, null, 10, 'Usa pré impressão', 'Indica se haverá a pré-impressão do cabeçalho do recibo (NÃO / SIM).', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(515, 3, null, 10, 'Usa auto-cutter', 'Indica se usará o recurso auto-cutter da impressora. (NÃO / SIM).', 1, 0, dbo.trunc_date(getDate()));

--linhas de configuração do recibo
--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(521, 2, null, 11, 'Linha 1', 'Indica o texto que será impresso na linha 1 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(522, 2, null, 11, 'Linha 2', 'Indica o texto que será impresso na linha 2 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(523, 2, null, 11, 'Linha 3', 'Indica o texto que será impresso na linha 3 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(524, 2, null, 11, 'Linha 4', 'Indica o texto que será impresso na linha 4 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(525, 2, null, 11, 'Linha 5', 'Indica o texto que será impresso na linha 5 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(526, 2, null, 11, 'Linha 6', 'Indica o texto que será impresso na linha 6 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(527, 2, null, 11, 'Linha 7', 'Indica o texto que será impresso na linha 7 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(528, 2, null, 11, 'Linha 8', 'Indica o texto que será impresso na linha 8 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(529, 2, null, 11, 'Linha 9', 'Indica o texto que será impresso na linha 9 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(530, 2, null, 11, 'Linha 10', 'Indica o texto que será impresso na linha 10 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(531, 2, null, 11, 'Linha 11', 'Indica o texto que será impresso na linha 11 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(532, 2, null, 11, 'Linha 12', 'Indica o texto que será impresso na linha 12 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(533, 2, null, 11, 'Linha 13', 'Indica o texto que será impresso na linha 13 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(534, 2, null, 11, 'Linha 14', 'Indica o texto que será impresso na linha 14 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(535, 2, null, 11, 'Linha 15', 'Indica o texto que será impresso na linha 15 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(536, 2, null, 11, 'Linha 16', 'Indica o texto que será impresso na linha 16 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(537, 2, null, 11, 'Linha 17', 'Indica o texto que será impresso na linha 17 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(538, 2, null, 11, 'Linha 18', 'Indica o texto que será impresso na linha 18 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(539, 2, null, 11, 'Linha 19', 'Indica o texto que será impresso na linha 19 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(540, 2, null, 11, 'Linha 20', 'Indica o texto que será impresso na linha 20 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(553, 2, null, 11, 'Linha 21', 'Indica o texto que será impresso na linha 21 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(542, 2, null, 11, 'Linha 22', 'Indica o texto que será impresso na linha 22 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(543, 2, null, 11, 'Linha 23', 'Indica o texto que será impresso na linha 23 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(544, 2, null, 11, 'Linha 24', 'Indica o texto que será impresso na linha 24 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(545, 2, null, 11, 'Linha 25', 'Indica o texto que será impresso na linha 25 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(546, 2, null, 11, 'Linha 26', 'Indica o texto que será impresso na linha 26 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(547, 2, null, 11, 'Linha 27', 'Indica o texto que será impresso na linha 27 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(548, 2, null, 11, 'Linha 28', 'Indica o texto que será impresso na linha 28 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(549, 2, null, 11, 'Linha 29', 'Indica o texto que será impresso na linha 29 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(550, 2, null, 11, 'Linha 30', 'Indica o texto que será impresso na linha 30 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(551, 2, null, 11, 'Linha 31', 'Indica o texto que será impresso na linha 31 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(552, 2, null, 11, 'Linha 32', 'Indica o texto que será impresso na linha 32 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(553, 2, null, 11, 'Linha 33', 'Indica o texto que será impresso na linha 33 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(554, 2, null, 11, 'Linha 34', 'Indica o texto que será impresso na linha 34 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(555, 2, null, 11, 'Linha 35', 'Indica o texto que será impresso na linha 35 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(556, 2, null, 11, 'Linha 36', 'Indica o texto que será impresso na linha 36 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(557, 2, null, 11, 'Linha 37', 'Indica o texto que será impresso na linha 37 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(558, 2, null, 11, 'Linha 38', 'Indica o texto que será impresso na linha 38 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(559, 2, null, 11, 'Linha 39', 'Indica o texto que será impresso na linha 39 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(560, 2, null, 11, 'Linha 40', 'Indica o texto que será impresso na linha 40 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(561, 2, null, 11, 'Linha 41', 'Indica o texto que será impresso na linha 41 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(562, 2, null, 11, 'Linha 42', 'Indica o texto que será impresso na linha 42 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(563, 2, null, 11, 'Linha 43', 'Indica o texto que será impresso na linha 43 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(564, 2, null, 11, 'Linha 44', 'Indica o texto que será impresso na linha 44 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(565, 2, null, 11, 'Linha 45', 'Indica o texto que será impresso na linha 45 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(566, 2, null, 11, 'Linha 46', 'Indica o texto que será impresso na linha 46 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(567, 2, null, 11, 'Linha 47', 'Indica o texto que será impresso na linha 47 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(568, 2, null, 11, 'Linha 48', 'Indica o texto que será impresso na linha 48 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(569, 2, null, 11, 'Linha 49', 'Indica o texto que será impresso na linha 49 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(570, 2, null, 11, 'Linha 50', 'Indica o texto que será impresso na linha 50 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(571, 2, null, 11, 'Linha 51', 'Indica o texto que será impresso na linha 51 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(572, 2, null, 11, 'Linha 52', 'Indica o texto que será impresso na linha 52 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(573, 2, null, 11, 'Linha 53', 'Indica o texto que será impresso na linha 53 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(574, 2, null, 11, 'Linha 54', 'Indica o texto que será impresso na linha 54 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(575, 2, null, 11, 'Linha 55', 'Indica o texto que será impresso na linha 55 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(576, 2, null, 11, 'Linha 56', 'Indica o texto que será impresso na linha 56 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(577, 2, null, 11, 'Linha 57', 'Indica o texto que será impresso na linha 57 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(578, 2, null, 11, 'Linha 58', 'Indica o texto que será impresso na linha 58 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(579, 2, null, 11, 'Linha 59', 'Indica o texto que será impresso na linha 59 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(580, 2, null, 11, 'Linha 60', 'Indica o texto que será impresso na linha 60 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(581, 2, null, 11, 'Linha 61', 'Indica o texto que será impresso na linha 61 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(582, 2, null, 11, 'Linha 62', 'Indica o texto que será impresso na linha 62 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(583, 2, null, 11, 'Linha 63', 'Indica o texto que será impresso na linha 63 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(584, 2, null, 11, 'Linha 64', 'Indica o texto que será impresso na linha 64 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(585, 2, null, 11, 'Linha 65', 'Indica o texto que será impresso na linha 65 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(586, 2, null, 11, 'Linha 66', 'Indica o texto que será impresso na linha 66 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(587, 2, null, 11, 'Linha 67', 'Indica o texto que será impresso na linha 67 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(588, 2, null, 11, 'Linha 68', 'Indica o texto que será impresso na linha 68 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(589, 2, null, 11, 'Linha 69', 'Indica o texto que será impresso na linha 69 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(590, 2, null, 11, 'Linha 70', 'Indica o texto que será impresso na linha 70 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(591, 2, null, 11, 'Linha 71', 'Indica o texto que será impresso na linha 71 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(592, 2, null, 11, 'Linha 72', 'Indica o texto que será impresso na linha 72 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(593, 2, null, 11, 'Linha 73', 'Indica o texto que será impresso na linha 73 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(594, 2, null, 11, 'Linha 74', 'Indica o texto que será impresso na linha 74 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(595, 2, null, 11, 'Linha 75', 'Indica o texto que será impresso na linha 75 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(596, 2, null, 11, 'Linha 76', 'Indica o texto que será impresso na linha 76 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(597, 2, null, 11, 'Linha 77', 'Indica o texto que será impresso na linha 77 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(598, 2, null, 11, 'Linha 78', 'Indica o texto que será impresso na linha 78 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(599, 2, null, 11, 'Linha 79', 'Indica o texto que será impresso na linha 79 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(600, 2, null, 11, 'Linha 80', 'Indica o texto que será impresso na linha 80 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(601, 2, null, 11, 'Linha 81', 'Indica o texto que será impresso na linha 81 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(602, 2, null, 11, 'Linha 82', 'Indica o texto que será impresso na linha 82 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(603, 2, null, 11, 'Linha 83', 'Indica o texto que será impresso na linha 83 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(604, 2, null, 11, 'Linha 84', 'Indica o texto que será impresso na linha 84 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(605, 2, null, 11, 'Linha 85', 'Indica o texto que será impresso na linha 85 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(606, 2, null, 11, 'Linha 86', 'Indica o texto que será impresso na linha 86 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(607, 2, null, 11, 'Linha 87', 'Indica o texto que será impresso na linha 87 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(608, 2, null, 11, 'Linha 88', 'Indica o texto que será impresso na linha 88 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(609, 2, null, 11, 'Linha 89', 'Indica o texto que será impresso na linha 89 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(610, 2, null, 11, 'Linha 90', 'Indica o texto que será impresso na linha 90 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(611, 2, null, 11, 'Linha 91', 'Indica o texto que será impresso na linha 91 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(612, 2, null, 11, 'Linha 92', 'Indica o texto que será impresso na linha 92 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(613, 2, null, 11, 'Linha 93', 'Indica o texto que será impresso na linha 93 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(614, 2, null, 11, 'Linha 94', 'Indica o texto que será impresso na linha 94 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(615, 2, null, 11, 'Linha 95', 'Indica o texto que será impresso na linha 95 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(627, 2, null, 11, 'Linha 96', 'Indica o texto que será impresso na linha 96 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(628, 2, null, 11, 'Linha 97', 'Indica o texto que será impresso na linha 97 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(630, 2, null, 11, 'Linha 98', 'Indica o texto que será impresso na linha 98 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(619, 2, null, 11, 'Linha 99', 'Indica o texto que será impresso na linha 99 do recibo.', 1, 0, dbo.trunc_date(getDate()));

--insert into ConfiguracaoCV (IdConfCV, IdTipoConfPista, IdCategoria, IdSessao, Nome, Descricao, Habilitado, FlagReabrePista, DataInsercao) values(620, 2, null, 11, 'Linha 100', 'Indica o texto que será impresso na linha 100 do recibo.', 1, 0, dbo.trunc_date(getDate()));

------------------------------------------------------------
--arquivos de desconto de manutençaõ do cgmp-- 
------------------------------------------------------------
--Insert into cgmpconcessionarias (codigo, descricao, status) values ('00000', 'Não Aplicável', 0);
--Insert into cgmpconcessionarias (codigo, descricao, status) values ('00290', 'CGMP', 0);
--Insert into cgmpconcessionarias (codigo, descricao, status) values ('00256', 'ALESP', 0);
--Insert into cgmpconcessionarias (codigo, descricao, status) values ('00258', 'Dersa', 0);
--Insert into cgmpconcessionarias (codigo, descricao, status) values ('00259', 'AutoBan', 0);
--Insert into cgmpconcessionarias (codigo, descricao, status) values ('00260', 'Tebe', 0);
--Insert into cgmpconcessionarias (codigo, descricao, status) values ('00261', 'Via Norte', 0);
--Insert into cgmpconcessionarias (codigo, descricao, status) values ('00262', 'Intervias', 0);
--Insert into cgmpconcessionarias (codigo, descricao, status) values ('00263', 'Centrovias', 0);
--Insert into cgmpconcessionarias (codigo, descricao, status) values ('00264', 'Triangulo do Sol', 0);
--Insert into cgmpconcessionarias (codigo, descricao, status) values ('00265', 'Autovias', 0);
--Insert into cgmpconcessionarias (codigo, descricao, status) values ('00266', 'Renovias', 0);
--Insert into cgmpconcessionarias (codigo, descricao, status) values ('00267', 'Via Oeste', 0);
--Insert into cgmpconcessionarias (codigo, descricao, status) values ('00270', 'Ecovias', 0);

commit

