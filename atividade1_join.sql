create database db_educação;
use db_educação;


-- Criação da tabela de cursos
CREATE TABLE tb_cursos (
    cur_id INT AUTO_INCREMENT PRIMARY KEY,
    cur_nome VARCHAR(100) NOT NULL
);

-- Criação da tabela de professores
CREATE TABLE tb_professores (
    pro_id INT AUTO_INCREMENT PRIMARY KEY,
    pro_nome VARCHAR(100) NOT NULL,
    pro_cur_id INT,
    FOREIGN KEY (pro_cur_id) REFERENCES tb_cursos(cur_id)
);

-- Criação da tabela de disciplinas
CREATE TABLE tb_disciplinas (
    dis_id INT AUTO_INCREMENT PRIMARY KEY,
    dis_nome VARCHAR(100) NOT NULL,
    dis_cur_id INT,
    dis_pro_id INT,
    FOREIGN KEY (dis_cur_id) REFERENCES tb_cursos(cur_id),
    FOREIGN KEY (dis_pro_id) REFERENCES tb_professores(pro_id)
);

-- Criação da tabela de alunos
CREATE TABLE tb_alunos (
    alu_id INT AUTO_INCREMENT PRIMARY KEY,
    alu_nome VARCHAR(100) NOT NULL,
    alu_cur_id INT,
    FOREIGN KEY (alu_cur_id) REFERENCES tb_cursos(cur_id)
);

-- Criação da tabela de matrículas
CREATE TABLE tb_matriculas (
    mat_id INT AUTO_INCREMENT PRIMARY KEY,
    mat_alu_id INT,
    mat_dis_id INT,
    FOREIGN KEY (mat_alu_id) REFERENCES tb_alunos(alu_id),
    FOREIGN KEY (mat_dis_id) REFERENCES tb_disciplinas(dis_id)
);

-- Criação da tabela de notas
CREATE TABLE tb_notas (
    not_id INT AUTO_INCREMENT PRIMARY KEY,
    not_mat_id INT,
    not_valor DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (not_mat_id) REFERENCES tb_matriculas(mat_id)
);

-- 1 - Liste o nome de todas as disciplinas do curso Informática para Internet.
select dis_id as id_disciplina, dis_nome as disciplina_nome, cur_nome as nome_curso from tb_disciplinas join tb_cursos on dis_cur_id=cur_id where cur_id ='5';

-- 2 - Liste o nome de todos os alunos matriculados na disciplina Desenvolvimento de APIs.
select * from tb_alunos join tb_matriculas on mat_alu_id=alu_id join tb_disciplinas where dis_nome='Banco de Dados';

-- 3 - Liste o nome dos professores das disciplinas do curso Redes de Computadores.
select pro_id, pro_nome, cur_nome from tb_professores join tb_cursos on pro_cur_id=cur_id where cur_nome='Redes de Computadores';

select cur_nome,dis_nome,alu_nome from tb_cursos join tb_disciplinas on dis_cur_id=cur_id join tb_matriculas on mat_dis_id=dis_id join tb_alunos on mat_alu_id=alu_id;
select * from tb_disciplinas;
select * from tb_alunos;
select * from tb_matriculas;
select * from tb_cursos;


INSERT INTO tb_cursos (cur_nome)
VALUES 
('Ciência da Computação'),
('Engenharia de Software'),
('Análise e Desenvolvimento de Sistemas'),
('Redes de Computadores'),
('Informática para Internet');


INSERT INTO tb_professores (pro_nome, pro_cur_id)
VALUES
-- Professores para Ciência da Computação (cur_id = 1)
('Ana Silva', 1),
('Carlos Oliveira', 1),
('Marcos Santos', 1),
('Patrícia Souza', 1),
('Rafael Lima', 1),
('Fernanda Costa', 1),
('João Pereira', 1),
('Isabela Rodrigues', 1),
('Pedro Almeida', 1),
('Roberta Ferreira', 1),
('Gabriel Martins', 1),
('Larissa Gonçalves', 1),
('Bruno Barbosa', 1),
('Juliana Ribeiro', 1),
('Lucas Moreira', 1),
('Tatiana Melo', 1),
('Felipe Cardoso', 1),
('Renata Lima', 1),
('Eduardo Faria', 1),
('Mariana Teixeira', 1),

-- Professores para Engenharia de Software (cur_id = 2)
('Luiz Costa', 2),
('Bianca Nogueira', 2),
('Vinícius Alves', 2),
('Thais Ferreira', 2),
('Rodrigo Araújo', 2),
('Mônica Rocha', 2),
('César Oliveira', 2),
('Daniela Souza', 2),
('Fábio Gomes', 2),
('Amanda Barros', 2),
('Gustavo Ribeiro', 2),
('Vanessa Cunha', 2),
('Ricardo Dias', 2),
('Camila Borges', 2),
('Thiago Pires', 2),
('Marcelo Franco', 2),
('Priscila Vasconcelos', 2),
('Leandro Mendes', 2),
('Carla Xavier', 2),
('André Campos', 2),

-- Professores para Análise e Desenvolvimento de Sistemas (cur_id = 3)
('Alexandre Nascimento', 3),
('Mariana Guimarães', 3),
('Júlio Fernandes', 3),
('Fernanda Souza', 3),
('Sérgio Lima', 3),
('Adriana Gomes', 3),
('Mateus Santos', 3),
('Aline Rocha', 3),
('Cristiano Ferreira', 3),
('Janaína Ribeiro', 3),
('Márcio Almeida', 3),
('Clarice Lopes', 3),
('Fernando Monteiro', 3),
('Raquel Farias', 3),
('Roberto Neves', 3),
('Paula Mendes', 3),
('Igor Barbosa', 3),
('Gisele Moura', 3),
('Leonardo Castro', 3),
('Letícia Azevedo', 3),

-- Professores para Redes de Computadores (cur_id = 4)
('Guilherme Barbosa', 4),
('Paula Santana', 4),
('Rogério Pereira', 4),
('Vanessa Martins', 4),
('Bruno Silva', 4),
('Larissa Costa', 4),
('Marcelo Fernandes', 4),
('Fabiana Oliveira', 4),
('Edson Nunes', 4),
('Carolina Dias', 4),
('Wagner Almeida', 4),
('Juliana Cunha', 4),
('Otávio Ribeiro', 4),
('Simone Lopes', 4),
('Robson Araújo', 4),
('Viviane Farias', 4),
('Daniel Macedo', 4),
('Renata Gomes', 4),
('André Teixeira', 4),
('Sandra Melo', 4),

-- Professores para Informática para Internet (cur_id = 5)
('Renato Rodrigues', 5),
('Elaine Souza', 5),
('Rafael Almeida', 5),
('Viviane Santos', 5),
('Anderson Gomes', 5),
('Cristina Ferreira', 5),
('Fábio Nogueira', 5),
('Luciana Costa', 5),
('Ricardo Silva', 5),
('Juliana Oliveira', 5),
('Henrique Rocha', 5),
('Camila Santos', 5),
('Mário Alves', 5),
('Patrícia Mendes', 5),
('Eduardo Lima', 5),
('Bianca Barros', 5),
('Thiago Costa', 5),
('Vanessa Ribeiro', 5),
('Flávio Moreira', 5),
('Letícia Silva', 5);



INSERT INTO tb_disciplinas (dis_nome, dis_cur_id, dis_pro_id)
VALUES
-- Disciplinas para Ciência da Computação (cur_id = 1)
('Algoritmos e Estruturas de Dados', 1, 1),
('Programação Orientada a Objetos', 1, 2),
('Banco de Dados', 1, 3),
('Sistemas Operacionais', 1, 4),
('Redes de Computadores', 1, 5),
('Engenharia de Software', 1, 6),
('Inteligência Artificial', 1, 7),
('Computação Gráfica', 1, 8),
('Compiladores', 1, 9),
('Segurança da Informação', 1, 10),
('Teoria da Computação', 1, 11),
('Arquitetura de Computadores', 1, 12),
('Análise de Algoritmos', 1, 13),
('Computação em Nuvem', 1, 14),
('Desenvolvimento de Software', 1, 15),
('Internet das Coisas', 1, 16),
('Linguagens de Programação', 1, 17),
('Processamento de Imagens', 1, 18),
('Projeto de Sistemas', 1, 19),
('Sistemas Distribuídos', 1, 20),
('Mineração de Dados', 1, 1),
('Aprendizado de Máquina', 1, 2),
('Teoria dos Grafos', 1, 3),
('Computação Móvel', 1, 4),
('Algoritmos Avançados', 1, 5),
('Computação Paralela', 1, 6),
('Desenvolvimento Web', 1, 7),
('Interface Homem-Máquina', 1, 8),
('Realidade Virtual', 1, 9),
('Visão Computacional', 1, 10),
('Métodos Numéricos', 1, 11),
('Lógica Computacional', 1, 12),
('Robótica', 1, 13),
('Sistemas Embarcados', 1, 14),
('Redes de Sensores', 1, 15),
('Big Data', 1, 16),
('Segurança Cibernética', 1, 17),
('Criptografia', 1, 18),
('Computação Quântica', 1, 19),
('Inovação Tecnológica', 1, 20),

-- Disciplinas para Engenharia de Software (cur_id = 2)
('Fundamentos de Engenharia de Software', 2, 21),
('Gestão de Projetos', 2, 22),
('Arquitetura de Software', 2, 23),
('Qualidade de Software', 2, 24),
('Modelagem de Sistemas', 2, 25),
('Requisitos de Software', 2, 26),
('Teste de Software', 2, 27),
('Gerência de Configuração', 2, 28),
('Engenharia de Usabilidade', 2, 29),
('Processos de Software', 2, 30),
('Engenharia de Requisitos', 2, 31),
('Padrões de Projeto', 2, 32),
('Desenvolvimento Ágil', 2, 33),
('Manutenção de Software', 2, 34),
('Métricas de Software', 2, 35),
('Sistemas de Informação', 2, 36),
('Análise de Sistemas', 2, 37),
('Metodologias de Desenvolvimento', 2, 38),
('Engenharia de Sistemas', 2, 39),
('Gestão de Qualidade', 2, 40),
('Processos de Negócio', 2, 21),
('Engenharia de Processos', 2, 22),
('Modelagem Ágil', 2, 23),
('Integração de Sistemas', 2, 24),
('Análise de Negócios', 2, 25),
('Engenharia de Desempenho', 2, 26),
('DevOps', 2, 27),
('Sistemas de Tempo Real', 2, 28),
('Gerenciamento de Riscos', 2, 29),
('Desenvolvimento de Aplicações', 2, 30),
('Software Livre', 2, 31),
('Ambientes de Desenvolvimento', 2, 32),
('Ciclos de Vida de Software', 2, 33),
('Sistemas de Apoio à Decisão', 2, 34),
('Modelagem e Simulação', 2, 35),
('Projeto de Interface', 2, 36),
('Desenvolvimento Mobile', 2, 37),
('Softwares Corporativos', 2, 38),
('Governança de TI', 2, 39),
('Inovação em Software', 2, 40),

-- Disciplinas para Análise e Desenvolvimento de Sistemas (cur_id = 3)
('Análise de Requisitos', 3, 41),
('Desenvolvimento de Sistemas', 3, 42),
('Banco de Dados Avançado', 3, 43),
('Programação Web', 3, 44),
('Engenharia de Sistemas', 3, 45),
('Desenvolvimento Ágil', 3, 46),
('Metodologias de Desenvolvimento', 3, 47),
('Testes de Software', 3, 48),
('Sistemas de Informação', 3, 49),
('Análise Orientada a Objetos', 3, 50),
('Programação Mobile', 3, 41),
('Desenvolvimento de Aplicativos', 3, 42),
('Integração de Sistemas', 3, 43),
('Sistemas Distribuídos', 3, 44),
('Gestão de Projetos de Software', 3, 45),
('Sistemas Embarcados', 3, 46),
('Desenvolvimento de Jogos', 3, 47),
('Análise de Dados', 3, 48),
('Programação Funcional', 3, 49),
('Desenvolvimento Backend', 3, 50),
('Desenvolvimento Frontend', 3, 41),
('Engenharia de Software', 3, 42),
('Desenvolvimento de Interfaces', 3, 43),
('Computação em Nuvem', 3, 44),
('Desenvolvimento DevOps', 3, 45),
('Banco de Dados Não-Relacional', 3, 46),
('Sistemas Operacionais', 3, 47),
('Desenvolvimento Web Avançado', 3, 48),
('Segurança de Sistemas', 3, 49),
('Internet das Coisas', 3, 50),
('Inteligência Artificial', 3, 41),
('Machine Learning', 3, 42),
('Análise de Algoritmos', 3, 43),
('Desenvolvimento Mobile Avançado', 3, 44),
('Data Science', 3, 45),
('Modelagem de Sistemas', 3, 46),
('Desenvolvimento Full Stack', 3, 47),
('Desenvolvimento de Software Livre', 3, 48),
('Cloud Computing', 3, 49),
('Desenvolvimento de APIs', 3, 50),

-- Disciplinas para Redes de Computadores (cur_id = 4)
('Fundamentos de Redes', 4, 61),
('Redes de Computadores', 4, 62),
('Segurança de Redes', 4, 63),
('Protocolos de Redes', 4, 64),
('Administração de Redes', 4, 65),
('Redes Sem Fio', 4, 66),
('Redes de Alta Velocidade', 4, 67),
('Computação em Nuvem', 4, 68),
('Redes Convergentes', 4, 69),
('Telecomunicações', 4, 70),
('Segurança da Informação', 4, 61),
('Infraestrutura de Redes', 4, 62),
('Roteamento e Switching', 4, 63),
('Redes de Sensores', 4, 64),
('Redes de Provedores', 4, 65),
('Tecnologias de Virtualização', 4, 66),
('Gerenciamento de Redes', 4, 67),
('Monitoramento de Redes', 4, 68),
('Redes Corporativas', 4, 69),
('Protocolos de Internet', 4, 70),
('Redes Metropolitanas', 4, 61),
('Gerenciamento de Projetos de Redes', 4, 62),
('Redes Definidas por Software', 4, 63),
('Segurança em Redes Móveis', 4, 64),
('Configuração de Firewalls', 4, 65),
('Vulnerabilidades em Redes', 4, 66),
('Qualidade de Serviço em Redes', 4, 67),
('Topologias de Redes', 4, 68),
('Redes Virtuais', 4, 69),
('Protocolos de Segurança', 4, 70),
('Sistemas de Telefonia IP', 4, 61),
('Redes Multimídia', 4, 62),
('Gestão de Segurança em Redes', 4, 63),
('Protocolos de Roteamento', 4, 64),
('Projeto de Redes', 4, 65),
('Engenharia de Redes', 4, 66),
('Gerência de Serviços de Redes', 4, 67),
('Segurança Cibernética', 4, 68),
('Redes para IoT', 4, 69),
('Infraestrutura de Data Centers', 4, 70),

-- Disciplinas para Informática para Internet (cur_id = 5)
('Desenvolvimento Web', 5, 81),
('Programação para Internet', 5, 82),
('Design de Interfaces Web', 5, 83),
('Desenvolvimento Frontend', 5, 84),
('Desenvolvimento Backend', 5, 85),
('Arquitetura de Sistemas Web', 5, 86),
('Banco de Dados para Web', 5, 87),
('Web Services', 5, 88),
('Segurança em Aplicações Web', 5, 89),
('Desenvolvimento Mobile para Web', 5, 90),
('Desenvolvimento de Aplicações Web', 5, 81),
('Programação JavaScript', 5, 82),
('Frameworks para Web', 5, 83),
('UX/UI Design', 5, 84),
('SEO e Marketing Digital', 5, 85),
('Desenvolvimento Full Stack', 5, 86),
('Desenvolvimento de APIs', 5, 87),
('Web Standards', 5, 88),
('E-commerce', 5, 89),
('Desenvolvimento de Sistemas Web', 5, 90),
('Gerenciamento de Projetos Web', 5, 81),
('Web Design Responsivo', 5, 82),
('Acessibilidade Web', 5, 83),
('Performance Web', 5, 84),
('Web Analytics', 5, 85),
('Desenvolvimento de Plugins', 5, 86),
('Segurança em Web Services', 5, 87),
('Desenvolvimento Web em PHP', 5, 88),
('Web Security', 5, 89),
('Desenvolvimento em HTML5', 5, 90),
('Programação CSS3', 5, 81),
('DevOps para Web', 5, 82),
('Desenvolvimento Web em Python', 5, 83),
('Aplicações Web Escaláveis', 5, 84),
('Desenvolvimento Web Avançado', 5, 85),
('Desenvolvimento Web com Node.js', 5, 86),
('Desenvolvimento Web com React', 5, 87),
('Web Testing', 5, 88),
('Desenvolvimento Web com Angular', 5, 89),
('Web Frameworks Modernos', 5, 90);


INSERT INTO tb_alunos (alu_nome, alu_cur_id)
VALUES
-- Alunos para Ciência da Computação (cur_id = 1)
('Pelé', 1),
('Ayrton Senna', 1),
('Carmen Miranda', 1),
('Chico Buarque', 1),
('Rita Lee', 1),
('Gilberto Gil', 1),
('Fernanda Montenegro', 1),
('Caetano Veloso', 1),
('Gisele Bündchen', 1),
('Jorge Amado', 1),
('Tom Jobim', 1),
('Oscar Niemeyer', 1),
('Ziraldo', 1),
('Adriana Lima', 1),
('Milton Nascimento', 1),
('Roberto Carlos', 1),
('Xuxa Meneghel', 1),
('Ivete Sangalo', 1),
('Cazuza', 1),
('Gal Costa', 1),
('Elis Regina', 1),
('Paulo Coelho', 1),
('Zeca Pagodinho', 1),
('Lázaro Ramos', 1),
('Ana Maria Braga', 1),
('Marcelo Tas', 1),
('Fátima Bernardes', 1),
('Luciano Huck', 1),
('Angélica Ksyvickis', 1),
('Didi Mocó', 1),
('Luiz Gonzaga', 1),
('Ronaldo Nazário', 1),
('Marta Silva', 1),
('Thiago Silva', 1),
('Gabriel Medina', 1),
('Daniel Alves', 1),
('Paulo Autran', 1),
('Regina Duarte', 1),
('Lima Duarte', 1),
('Adoniran Barbosa', 1),

-- Alunos para Engenharia de Software (cur_id = 2)
('Marília Mendonça', 2),
('Jorge Ben Jor', 2),
('Anitta', 2),
('Zeca Baleiro', 2),
('Wesley Safadão', 2),
('Emicida', 2),
('Caio Castro', 2),
('Juliana Paes', 2),
('Tatá Werneck', 2),
('Bruna Marquezine', 2),
('Rodrigo Santoro', 2),
('Wagner Moura', 2),
('Ivana Chubbuck', 2),
('Neymar Jr.', 2),
('Anderson Silva', 2),
('Gusttavo Lima', 2),
('Mano Brown', 2),
('Alok', 2),
('Ludmilla', 2),
('Silvio Santos', 2),
('Hebe Camargo', 2),
('Fernanda Torres', 2),
('Glória Pires', 2),
('Tony Ramos', 2),
('José Wilker', 2),
('Sandy Leah', 2),
('Junior Lima', 2),
('Michel Teló', 2),
('João Gilberto', 2),
('Tarcísio Meira', 2),
('Glória Maria', 2),
('Taís Araújo', 2),
('Camila Pitanga', 2),
('Sérgio Reis', 2),
('Chitãozinho', 2),
('Xororó', 2),
('Zé Ramalho', 2),
('Fagner', 2),
('Djavan', 2),
('Alcione', 2),
('Maria Bethânia', 2),

-- Alunos para Análise e Desenvolvimento de Sistemas (cur_id = 3)
('Roberto Justus', 3),
('Galvão Bueno', 3),
('Tite', 3),
('Vera Fischer', 3),
('Camila Queiroz', 3),
('Juliana Alves', 3),
('Giovanna Antonelli', 3),
('Cléo Pires', 3),
('Renata Vasconcellos', 3),
('Tatá Werneck', 3),
('Patrícia Poeta', 3),
('Grazi Massafera', 3),
('Isis Valverde', 3),
('Giovanna Ewbank', 3),
('Rodrigo Faro', 3),
('Marcos Mion', 3),
('Ivete Sangalo', 3),
('Zeca Camargo', 3),
('Leandro Hassum', 3),
('Fábio Porchat', 3),
('Débora Falabella', 3),
('Luana Piovani', 3),
('Bruna Lombardi', 3),
('Letícia Sabatella', 3),
('Rafael Cardoso', 3),
('José Mayer', 3),
('Cauã Reymond', 3),
('Reynaldo Gianecchini', 3),
('Caio Blat', 3),
('Murilo Benício', 3),
('Selton Mello', 3),
('Lázaro Ramos', 3),
('Thiago Lacerda', 3),
('Alexandre Borges', 3),
('Cláudia Raia', 3),
('Edson Celulari', 3),
('Paolla Oliveira', 3),
('Sophie Charlotte', 3),
('Grazi Massafera', 3),
('Marcelo Serrado', 3),

-- Alunos para Redes de Computadores (cur_id = 4)
('Lucas Lucco', 4),
('Luan Santana', 4),
('Fernando Torres', 4),
('Eduardo Costa', 4),
('Marcos Palmeira', 4),
('Adriana Esteves', 4),
('Camila Morgado', 4),
('Paulo Gustavo', 4),
('Marcelo Adnet', 4),
('Daniel Boaventura', 4),
('Rogério Ceni', 4),
('Zico', 4),
('Rafinha Bastos', 4),
('Danilo Gentili', 4),
('Beto Barbosa', 4),
('Tiririca', 4),
('Carlos Alberto de Nóbrega', 4),
('Daniel', 4),
('Victor Chaves', 4),
('Leo Chaves', 4),
('Péricles', 4),
('Thiaguinho', 4),
('Diogo Nogueira', 4),
('Jorge Aragão', 4),
('Martinho da Vila', 4),
('Arlindo Cruz', 4),
('Beth Carvalho', 4),
('Zeca Pagodinho', 4),
('Paulinho da Viola', 4),
('Chico Buarque', 4),
('Djavan', 4),
('Gilberto Gil', 4),
('Caetano Veloso', 4),
('Milton Nascimento', 4),
('Maria Rita', 4),
('Marisa Monte', 4),
('Carlinhos Brown', 4),
('Ivete Sangalo', 4),
('Daniela Mercury', 4),
('Claudia Leitte', 4),

-- Alunos para Informática para Internet (cur_id = 5)
('Marcos Frota', 5),
('Carolina Dieckmann', 5),
('Vladimir Brichta', 5),
('Deborah Secco', 5),
('José Loreto', 5),
('Nívea Stelmann', 5),
('Gustavo Lima', 5),
('Henrique Fogaça', 5),
('Paola Carosella', 5),
('Erick Jacquin', 5),
('Ana Paula Padrão', 5),
('Daniela Albuquerque', 5),
('Sabrina Sato', 5),
('Rodrigo Hilbert', 5),
('Felipe Neto', 5),
('Whindersson Nunes', 5),
('Kéfera Buchmann', 5),
('Christian Figueiredo', 5),
('Lucas Rangel', 5),
('Igor Cavalari', 5),
('Gabriela Pugliesi', 5),
('Thaynara OG', 5),
('Anitta', 5),
('Pabllo Vittar', 5),
('Ludmilla', 5),
('Lexa', 5),
('MC Kevinho', 5),
('MC Guimê', 5),
('Karol Conká', 5),
('Emicida', 5),
('Projota', 5),
('Manu Gavassi', 5),
('Luisa Sonza', 5),
('Carlinhos Maia', 5),
('GKay', 5),
('Juliette Freire', 5),
('Karol Conká', 5),
('Lucas Penteado', 5),
('Sarah Andrade', 5),
('Rodolffo Matthaus', 5);

INSERT INTO tb_matriculas (mat_alu_id, mat_dis_id)
VALUES
-- Matriculando alunos na primeira disciplina de cada curso
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1),
(16, 2), (17, 2), (18, 2), (19, 2), (20, 2), (21, 2), (22, 2), (23, 2), (24, 2), (25, 2), (26, 2), (27, 2), (28, 2), (29, 2), (30, 2),
(31, 3), (32, 3), (33, 3), (34, 3), (35, 3), (36, 3), (37, 3), (38, 3), (39, 3), (40, 3), (41, 3), (42, 3), (43, 3), (44, 3), (45, 3),
(46, 4), (47, 4), (48, 4), (49, 4), (50, 4), (51, 4), (52, 4), (53, 4), (54, 4), (55, 4), (56, 4), (57, 4), (58, 4), (59, 4), (60, 4),
(61, 5), (62, 5), (63, 5), (64, 5), (65, 5), (66, 5), (67, 5), (68, 5), (69, 5), (70, 5), (71, 5), (72, 5), (73, 5), (74, 5), (75, 5),

-- Matriculando alunos na segunda disciplina de cada curso
(11, 6), (12, 6), (13, 6), (14, 6), (15, 6), (16, 6), (17, 6), (18, 6), (19, 6), (20, 6), (21, 6), (22, 6), (23, 6), (24, 6), (25, 6),
(26, 7), (27, 7), (28, 7), (29, 7), (30, 7), (31, 7), (32, 7), (33, 7), (34, 7), (35, 7), (36, 7), (37, 7), (38, 7), (39, 7), (40, 7),
(41, 8), (42, 8), (43, 8), (44, 8), (45, 8), (46, 8), (47, 8), (48, 8), (49, 8), (50, 8), (51, 8), (52, 8), (53, 8), (54, 8), (55, 8),
(56, 9), (57, 9), (58, 9), (59, 9), (60, 9), (61, 9), (62, 9), (63, 9), (64, 9), (65, 9), (66, 9), (67, 9), (68, 9), (69, 9), (70, 9),
(71, 10), (72, 10), (73, 10), (74, 10), (75, 10), (1, 10), (2, 10), (3, 10), (4, 10), (5, 10), (6, 10), (7, 10), (8, 10), (9, 10), (10, 10);


INSERT INTO tb_matriculas (mat_alu_id, mat_dis_id)
VALUES
-- Disciplina 1 (dis_id = 46)
(1, 46), (2, 46), (3, 46), (4, 46), (5, 46),
(6, 46), (7, 46), (8, 46), (9, 46), (10, 46),
(11, 46), (12, 46), (13, 46), (14, 46), (15, 46),

-- Disciplina 2 (dis_id = 47)
(16, 47), (17, 47), (18, 47), (19, 47), (20, 47),
(21, 47), (22, 47), (23, 47), (24, 47), (25, 47),
(26, 47), (27, 47), (28, 47), (29, 47), (30, 47),

-- Disciplina 3 (dis_id = 48)
(31, 48), (32, 48), (33, 48), (34, 48), (35, 48),
(36, 48), (37, 48), (38, 48), (39, 48), (40, 48),
(41, 48), (42, 48), (43, 48), (44, 48), (45, 48),

-- Disciplina 4 (dis_id = 49)
(46, 49), (47, 49), (48, 49), (49, 49), (50, 49),
(51, 49), (52, 49), (53, 49), (54, 49), (55, 49),
(56, 49), (57, 49), (58, 49), (59, 49), (60, 49),

-- Disciplina 5 (dis_id = 50)
(61, 50), (62, 50), (63, 50), (64, 50), (65, 50),
(66, 50), (67, 50), (68, 50), (69, 50), (70, 50),
(71, 50), (72, 50), (73, 50), (74, 50), (75, 50),

-- Disciplina 6 (dis_id = 51)
(1, 51), (2, 51), (3, 51), (4, 51), (5, 51),
(6, 51), (7, 51), (8, 51), (9, 51), (10, 51),
(11, 51), (12, 51), (13, 51), (14, 51), (15, 51),

-- Disciplina 7 (dis_id = 52)
(16, 52), (17, 52), (18, 52), (19, 52), (20, 52),
(21, 52), (22, 52), (23, 52), (24, 52), (25, 52),
(26, 52), (27, 52), (28, 52), (29, 52), (30, 52),

-- Disciplina 8 (dis_id = 53)
(31, 53), (32, 53), (33, 53), (34, 53), (35, 53),
(36, 53), (37, 53), (38, 53), (39, 53), (40, 53),
(41, 53), (42, 53), (43, 53), (44, 53), (45, 53),

-- Disciplina 9 (dis_id = 54)
(46, 54), (47, 54), (48, 54), (49, 54), (50, 54),
(51, 54), (52, 54), (53, 54), (54, 54), (55, 54),
(56, 54), (57, 54), (58, 54), (59, 54), (60, 54),

-- Disciplina 10 (dis_id = 55)
(61, 55), (62, 55), (63, 55), (64, 55), (65, 55),
(66, 55), (67, 55), (68, 55), (69, 55), (70, 55),
(71, 55), (72, 55), (73, 55), (74, 55), (75, 55),

-- Disciplina 11 (dis_id = 56)
(1, 56), (2, 56), (3, 56), (4, 56), (5, 56),
(6, 56), (7, 56), (8, 56), (9, 56), (10, 56),
(11, 56), (12, 56), (13, 56), (14, 56), (15, 56),

-- Disciplina 12 (dis_id = 57)
(16, 57), (17, 57), (18, 57), (19, 57), (20, 57),
(21, 57), (22, 57), (23, 57), (24, 57), (25, 57),
(26, 57), (27, 57), (28, 57), (29, 57), (30, 57),

-- Disciplina 13 (dis_id = 58)
(31, 58), (32, 58), (33, 58), (34, 58), (35, 58),
(36, 58), (37, 58), (38, 58), (39, 58), (40, 58),
(41, 58), (42, 58), (43, 58), (44, 58), (45, 58),

-- Disciplina 14 (dis_id = 59)
(46, 59), (47, 59), (48, 59), (49, 59), (50, 59),
(51, 59), (52, 59), (53, 59), (54, 59), (55, 59),
(56, 59), (57, 59), (58, 59), (59, 59), (60, 59),

-- Disciplina 15 (dis_id = 60)
(61, 60), (62, 60), (63, 60), (64, 60), (65, 60),
(66, 60), (67, 60), (68, 60), (69, 60), (70, 60),
(71, 60), (72, 60), (73, 60), (74, 60), (75, 60),

-- Disciplina 16 (dis_id = 61)
(1, 61), (2, 61), (3, 61), (4, 61), (5, 61),
(6, 61), (7, 61), (8, 61), (9, 61), (10, 61),
(11, 61), (12, 61), (13, 61), (14, 61), (15, 61),

-- Disciplina 17 (dis_id = 62)
(16, 62), (17, 62), (18, 62), (19, 62), (20, 62),
(21, 62), (22, 62), (23, 62), (24, 62), (25, 62),
(26, 62), (27, 62), (28, 62), (29, 62), (30, 62),

-- Disciplina 18 (dis_id = 63)
(31, 63), (32, 63), (33, 63), (34, 63), (35, 63),
(36, 63), (37, 63), (38, 63), (39, 63), (40, 63),
(41, 63), (42, 63), (43, 63), (44, 63), (45, 63),

-- Disciplina 19 (dis_id = 64)
(46, 64), (47, 64), (48, 64), (49, 64), (50, 64),
(51, 64), (52, 64), (53, 64), (54, 64), (55, 64),
(56, 64), (57, 64), (58, 64), (59, 64), (60, 64),

-- Disciplina 20 (dis_id = 65)
(61, 65), (62, 65), (63, 65), (64, 65), (65, 65),
(66, 65), (67, 65), (68, 65), (69, 65), (70, 65),
(71, 65), (72, 65), (73, 65), (74, 65), (75, 65),

-- Disciplina 21 (dis_id = 66)
(1, 66), (2, 66), (3, 66), (4, 66), (5, 66),
(6, 66), (7, 66), (8, 66), (9, 66), (10, 66),
(11, 66), (12, 66), (13, 66), (14, 66), (15, 66),

-- Disciplina 22 (dis_id = 67)
(16, 67), (17, 67), (18, 67), (19, 67), (20, 67),
(21, 67), (22, 67), (23, 67), (24, 67), (25, 67),
(26, 67), (27, 67), (28, 67), (29, 67), (30, 67),

-- Disciplina 23 (dis_id = 68)
(31, 68), (32, 68), (33, 68), (34, 68), (35, 68),
(36, 68), (37, 68), (38, 68), (39, 68), (40, 68),
(41, 68), (42, 68), (43, 68), (44, 68), (45, 68),

-- Disciplina 24 (dis_id = 69)
(46, 69), (47, 69), (48, 69), (49, 69), (50, 69),
(51, 69), (52, 69), (53, 69), (54, 69), (55, 69),
(56, 69), (57, 69), (58, 69), (59, 69), (60, 69),

-- Disciplina 25 (dis_id = 70)
(61, 70), (62, 70), (63, 70), (64, 70), (65, 70),
(66, 70), (67, 70), (68, 70), (69, 70), (70, 70),
(71, 70), (72, 70), (73, 70), (74, 70), (75, 70),

-- Disciplina 26 (dis_id = 71)
(1, 71), (2, 71), (3, 71), (4, 71), (5, 71),
(6, 71), (7, 71), (8, 71), (9, 71), (10, 71),
(11, 71), (12, 71), (13, 71), (14, 71), (15, 71),

-- Disciplina 27 (dis_id = 72)
(16, 72), (17, 72), (18, 72), (19, 72), (20, 72),
(21, 72), (22, 72), (23, 72), (24, 72), (25, 72),
(26, 72), (27, 72), (28, 72), (29, 72), (30, 72),

-- Disciplina 28 (dis_id = 73)
(31, 73), (32, 73), (33, 73), (34, 73), (35, 73),
(36, 73), (37, 73), (38, 73), (39, 73), (40, 73),
(41, 73), (42, 73), (43, 73), (44, 73), (45, 73),

-- Disciplina 29 (dis_id = 74)
(46, 74), (47, 74), (48, 74), (49, 74), (50, 74),
(51, 74), (52, 74), (53, 74), (54, 74), (55, 74),
(56, 74), (57, 74), (58, 74), (59, 74), (60, 74),

-- Disciplina 30 (dis_id = 75)
(61, 75), (62, 75), (63, 75), (64, 75), (65, 75),
(66, 75), (67, 75), (68, 75), (69, 75), (70, 75),
(71, 75), (72, 75), (73, 75), (74, 75), (75, 75),

-- Disciplina 31 (dis_id = 76)
(1, 76), (2, 76), (3, 76), (4, 76), (5, 76),
(6, 76), (7, 76), (8, 76), (9, 76), (10, 76),
(11, 76), (12, 76), (13, 76), (14, 76), (15, 76),

-- Disciplina 32 (dis_id = 77)
(16, 77), (17, 77), (18, 77), (19, 77), (20, 77),
(21, 77), (22, 77), (23, 77), (24, 77), (25, 77),
(26, 77), (27, 77), (28, 77), (29, 77), (30, 77),

-- Disciplina 33 (dis_id = 78)
(31, 78), (32, 78), (33, 78), (34, 78), (35, 78),
(36, 78), (37, 78), (38, 78), (39, 78), (40, 78),
(41, 78), (42, 78), (43, 78), (44, 78), (45, 78),

-- Disciplina 34 (dis_id = 79)
(46, 79), (47, 79), (48, 79), (49, 79), (50, 79),
(51, 79), (52, 79), (53, 79), (54, 79), (55, 79),
(56, 79), (57, 79), (58, 79), (59, 79), (60, 79),

-- Disciplina 35 (dis_id = 80)
(61, 80), (62, 80), (63, 80), (64, 80), (65, 80),
(66, 80), (67, 80), (68, 80), (69, 80), (70, 80),
(71, 80), (72, 80), (73, 80), (74, 80), (75, 80),

-- Disciplina 36 (dis_id = 81)
(1, 81), (2, 81), (3, 81), (4, 81), (5, 81),
(6, 81), (7, 81), (8, 81), (9, 81), (10, 81),
(11, 81), (12, 81), (13, 81), (14, 81), (15, 81),

-- Disciplina 37 (dis_id = 82)
(16, 82), (17, 82), (18, 82), (19, 82), (20, 82),
(21, 82), (22, 82), (23, 82), (24, 82), (25, 82),
(26, 82), (27, 82), (28, 82), (29, 82), (30, 82),

-- Disciplina 38 (dis_id = 83)
(31, 83), (32, 83), (33, 83), (34, 83), (35, 83),
(36, 83), (37, 83), (38, 83), (39, 83), (40, 83),
(41, 83), (42, 83), (43, 83), (44, 83), (45, 83),

-- Disciplina 39 (dis_id = 84)
(46, 84), (47, 84), (48, 84), (49, 84), (50, 84),
(51, 84), (52, 84), (53, 84), (54, 84), (55, 84),
(56, 84), (57, 84), (58, 84), (59, 84), (60, 84),

-- Disciplina 40 (dis_id = 85)
(61, 85), (62, 85), (63, 85), (64, 85), (65, 85),
(66, 85), (67, 85), (68, 85), (69, 85), (70, 85),
(71, 85), (72, 85), (73, 85), (74, 85), (75, 85);




INSERT INTO tb_matriculas (mat_alu_id, mat_dis_id)
VALUES
-- Disciplina 1 (dis_id = 126)
(1, 126), (2, 126), (3, 126), (4, 126), (5, 126),
(6, 126), (7, 126), (8, 126), (9, 126), (10, 126),
(11, 126), (12, 126), (13, 126), (14, 126), (15, 126),

-- Disciplina 2 (dis_id = 127)
(16, 127), (17, 127), (18, 127), (19, 127), (20, 127),
(21, 127), (22, 127), (23, 127), (24, 127), (25, 127),
(26, 127), (27, 127), (28, 127), (29, 127), (30, 127),

-- Disciplina 3 (dis_id = 128)
(31, 128), (32, 128), (33, 128), (34, 128), (35, 128),
(36, 128), (37, 128), (38, 128), (39, 128), (40, 128),
(41, 128), (42, 128), (43, 128), (44, 128), (45, 128),

-- Disciplina 4 (dis_id = 129)
(46, 129), (47, 129), (48, 129), (49, 129), (50, 129),
(51, 129), (52, 129), (53, 129), (54, 129), (55, 129),
(56, 129), (57, 129), (58, 129), (59, 129), (60, 129),

-- Disciplina 5 (dis_id = 130)
(61, 130), (62, 130), (63, 130), (64, 130), (65, 130),
(66, 130), (67, 130), (68, 130), (69, 130), (70, 130),
(71, 130), (72, 130), (73, 130), (74, 130), (75, 130),

-- Disciplina 6 (dis_id = 131)
(1, 131), (2, 131), (3, 131), (4, 131), (5, 131),
(6, 131), (7, 131), (8, 131), (9, 131), (10, 131),
(11, 131), (12, 131), (13, 131), (14, 131), (15, 131),

-- Disciplina 7 (dis_id = 132)
(16, 132), (17, 132), (18, 132), (19, 132), (20, 132),
(21, 132), (22, 132), (23, 132), (24, 132), (25, 132),
(26, 132), (27, 132), (28, 132), (29, 132), (30, 132),

-- Disciplina 8 (dis_id = 133)
(31, 133), (32, 133), (33, 133), (34, 133), (35, 133),
(36, 133), (37, 133), (38, 133), (39, 133), (40, 133),
(41, 133), (42, 133), (43, 133), (44, 133), (45, 133),

-- Disciplina 9 (dis_id = 134)
(46, 134), (47, 134), (48, 134), (49, 134), (50, 134),
(51, 134), (52, 134), (53, 134), (54, 134), (55, 134),
(56, 134), (57, 134), (58, 134), (59, 134), (60, 134),

-- Disciplina 10 (dis_id = 135)
(61, 135), (62, 135), (63, 135), (64, 135), (65, 135),
(66, 135), (67, 135), (68, 135), (69, 135), (70, 135),
(71, 135), (72, 135), (73, 135), (74, 135), (75, 135),

-- Disciplina 11 (dis_id = 136)
(1, 136), (2, 136), (3, 136), (4, 136), (5, 136),
(6, 136), (7, 136), (8, 136), (9, 136), (10, 136),
(11, 136), (12, 136), (13, 136), (14, 136), (15, 136),

-- Disciplina 12 (dis_id = 137)
(16, 137), (17, 137), (18, 137), (19, 137), (20, 137),
(21, 137), (22, 137), (23, 137), (24, 137), (25, 137),
(26, 137), (27, 137), (28, 137), (29, 137), (30, 137),

-- Disciplina 13 (dis_id = 138)
(31, 138), (32, 138), (33, 138), (34, 138), (35, 138),
(36, 138), (37, 138), (38, 138), (39, 138), (40, 138),
(41, 138), (42, 138), (43, 138), (44, 138), (45, 138),

-- Disciplina 14 (dis_id = 139)
(46, 139), (47, 139), (48, 139), (49, 139), (50, 139),
(51, 139), (52, 139), (53, 139), (54, 139), (55, 139),
(56, 139), (57, 139), (58, 139), (59, 139), (60, 139),

-- Disciplina 15 (dis_id = 140)
(61, 140), (62, 140), (63, 140), (64, 140), (65, 140),
(66, 140), (67, 140), (68, 140), (69, 140), (70, 140),
(71, 140), (72, 140), (73, 140), (74, 140), (75, 140),

-- Disciplina 16 (dis_id = 141)
(1, 141), (2, 141), (3, 141), (4, 141), (5, 141),
(6, 141), (7, 141), (8, 141), (9, 141), (10, 141),
(11, 141), (12, 141), (13, 141), (14, 141), (15, 141),

-- Disciplina 17 (dis_id = 142)
(16, 142), (17, 142), (18, 142), (19, 142), (20, 142),
(21, 142), (22, 142), (23, 142), (24, 142), (25, 142),
(26, 142), (27, 142), (28, 142), (29, 142), (30, 142),

-- Disciplina 18 (dis_id = 143)
(31, 143), (32, 143), (33, 143), (34, 143), (35, 143),
(36, 143), (37, 143), (38, 143), (39, 143), (40, 143),
(41, 143), (42, 143), (43, 143), (44, 143), (45, 143),

-- Disciplina 19 (dis_id = 144)
(46, 144), (47, 144), (48, 144), (49, 144), (50, 144),
(51, 144), (52, 144), (53, 144), (54, 144), (55, 144),
(56, 144), (57, 144), (58, 144), (59, 144), (60, 144),

-- Disciplina 20 (dis_id = 145)
(61, 145), (62, 145), (63, 145), (64, 145), (65, 145),
(66, 145), (67, 145), (68, 145), (69, 145), (70, 145),
(71, 145), (72, 145), (73, 145), (74, 145), (75, 145),

-- Disciplina 21 (dis_id = 146)
(1, 146), (2, 146), (3, 146), (4, 146), (5, 146),
(6, 146), (7, 146), (8, 146), (9, 146), (10, 146),
(11, 146), (12, 146), (13, 146), (14, 146), (15, 146),

-- Disciplina 22 (dis_id = 147)
(16, 147), (17, 147), (18, 147), (19, 147), (20, 147),
(21, 147), (22, 147), (23, 147), (24, 147), (25, 147),
(26, 147), (27, 147), (28, 147), (29, 147), (30, 147),

-- Disciplina 23 (dis_id = 148)
(31, 148), (32, 148), (33, 148), (34, 148), (35, 148),
(36, 148), (37, 148), (38, 148), (39, 148), (40, 148),
(41, 148), (42, 148), (43, 148), (44, 148), (45, 148),

-- Disciplina 24 (dis_id = 149)
(46, 149), (47, 149), (48, 149), (49, 149), (50, 149),
(51, 149), (52, 149), (53, 149), (54, 149), (55, 149),
(56, 149), (57, 149), (58, 149), (59, 149), (60, 149),

-- Disciplina 25 (dis_id = 150)
(61, 150), (62, 150), (63, 150), (64, 150), (65, 150),
(66, 150), (67, 150), (68, 150), (69, 150), (70, 150),
(71, 150), (72, 150), (73, 150), (74, 150), (75, 150),

-- Disciplina 26 (dis_id = 151)
(1, 151), (2, 151), (3, 151), (4, 151), (5, 151),
(6, 151), (7, 151), (8, 151), (9, 151), (10, 151),
(11, 151), (12, 151), (13, 151), (14, 151), (15, 151),

-- Disciplina 27 (dis_id = 152)
(16, 152), (17, 152), (18, 152), (19, 152), (20, 152),
(21, 152), (22, 152), (23, 152), (24, 152), (25, 152),
(26, 152), (27, 152), (28, 152), (29, 152), (30, 152),

-- Disciplina 28 (dis_id = 153)
(31, 153), (32, 153), (33, 153), (34, 153), (35, 153),
(36, 153), (37, 153), (38, 153), (39, 153), (40, 153),
(41, 153), (42, 153), (43, 153), (44, 153), (45, 153),

-- Disciplina 29 (dis_id = 154)
(46, 154), (47, 154), (48, 154), (49, 154), (50, 154),
(51, 154), (52, 154), (53, 154), (54, 154), (55, 154),
(56, 154), (57, 154), (58, 154), (59, 154), (60, 154),

-- Disciplina 30 (dis_id = 155)
(61, 155), (62, 155), (63, 155), (64, 155), (65, 155),
(66, 155), (67, 155), (68, 155), (69, 155), (70, 155),
(71, 155), (72, 155), (73, 155), (74, 155), (75, 155),

-- Disciplina 31 (dis_id = 156)
(1, 156), (2, 156), (3, 156), (4, 156), (5, 156),
(6, 156), (7, 156), (8, 156), (9, 156), (10, 156),
(11, 156), (12, 156), (13, 156), (14, 156), (15, 156),

-- Disciplina 32 (dis_id = 157)
(16, 157), (17, 157), (18, 157), (19, 157), (20, 157),
(21, 157), (22, 157), (23, 157), (24, 157), (25, 157),
(26, 157), (27, 157), (28, 157), (29, 157), (30, 157),

-- Disciplina 33 (dis_id = 158)
(31, 158), (32, 158), (33, 158), (34, 158), (35, 158),
(36, 158), (37, 158), (38, 158), (39, 158), (40, 158),
(41, 158), (42, 158), (43, 158), (44, 158), (45, 158),

-- Disciplina 34 (dis_id = 159)
(46, 159), (47, 159), (48, 159), (49, 159), (50, 159),
(51, 159), (52, 159), (53, 159), (54, 159), (55, 159),
(56, 159), (57, 159), (58, 159), (59, 159), (60, 159),

-- Disciplina 35 (dis_id = 160)
(61, 160), (62, 160), (63, 160), (64, 160), (65, 160),
(66, 160), (67, 160), (68, 160), (69, 160), (70, 160),
(71, 160), (72, 160), (73, 160), (74, 160), (75, 160),

-- Disciplina 36 (dis_id = 161)
(1, 161), (2, 161), (3, 161), (4, 161), (5, 161),
(6, 161), (7, 161), (8, 161), (9, 161), (10, 161),
(11, 161), (12, 161), (13, 161), (14, 161), (15, 161),

-- Disciplina 37 (dis_id = 162)
(16, 162), (17, 162), (18, 162), (19, 162), (20, 162),
(21, 162), (22, 162), (23, 162), (24, 162), (25, 162),
(26, 162), (27, 162), (28, 162), (29, 162), (30, 162),

-- Disciplina 38 (dis_id = 163)
(31, 163), (32, 163), (33, 163), (34, 163), (35, 163),
(36, 163), (37, 163), (38, 163), (39, 163), (40, 163),
(41, 163), (42, 163), (43, 163), (44, 163), (45, 163),

-- Disciplina 39 (dis_id = 164)
(46, 164), (47, 164), (48, 164), (49, 164), (50, 164),
(51, 164), (52, 164), (53, 164), (54, 164), (55, 164),
(56, 164), (57, 164), (58, 164), (59, 164), (60, 164),

-- Disciplina 40 (dis_id = 165)
(61, 165), (62, 165), (63, 165), (64, 165), (65, 165),
(66, 165), (67, 165), (68, 165), (69, 165), (70, 165),
(71, 165), (72, 165), (73, 165), (74, 165), (75, 165);
