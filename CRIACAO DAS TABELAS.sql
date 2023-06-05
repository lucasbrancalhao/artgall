-- LUCAS DE OLIVEIRA BRANCALHÃO	04/06/2023

--Criando as tabelas
create table artista (
codart int not null,
nome char(40) not null,
qtd_obras_vendidas int not null,
primary key (codart)
)

create table loja (
codloja int not null,
nome char(40) not null,
endereco char(60) not null,
primary key (codloja)
)

create table obras_arte (
codobra int not null,
nome char(40) not null,
preco money not null,
tipo int not null,
codart int not null,
primary key (codobra),
foreign key (codart) references artista
)

create index ixobras_artista on obras_arte(codart)

create table escultura (
codobra int not null,
tecnica char(20) not null,
material char(20) null,
primary key (codobra),
foreign key (codobra) references obras_arte
)

create table pintura (
codobra int not null,
estilo char(20) not null,
recurso char(20) null,
primary key (codobra),
foreign key (codobra) references obras_arte
)

create table venda (
idvenda int not null,
data date not null,
comissao money null,
codloja int not null,
codobra int not null,
primary key (idvenda),
foreign key (codloja) references loja,
foreign key (codobra) references obras_arte
)

create unique index ix_venda_obra on venda(codobra)

create index ixvenda_loja on venda(codloja)
