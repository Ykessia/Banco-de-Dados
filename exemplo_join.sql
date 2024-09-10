use db_escola;

select * from tb_jogadores;
select jog_id, jog_nome, jog_nacionalidade, tim_nome from tb_jogadores join tb_times on jog_time_id=tim_id;

select jog_id , jog_nome, jog_nacionalidade, jog_data_nascimento, tim_nome
from tb_jogadores join tb_times on jog_time_id=tim_id where year( jog_data_nascimento )  > 1990 ;
