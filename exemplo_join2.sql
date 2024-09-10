create database db_educacao2v;
use db_educacao2v;


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


-- 1 - Liste o nome do aluno, o nome da disciplina e a nota, de todos os alunos matriculados.
select alu_nome, dis_nome, not_valor from tb_matriculas join tb_alunos on mat_alu_id=alu_id
join tb_disciplinas on mat_dis_id=dis_id
join tb_notas on not_mat_id=mat_id;


-- 2 - Mostre a quantidade de alunos com nota superior a 5;
select count(*) from tb_matriculas join tb_alunos on mat_alu_id=alu_id
join tb_notas on not_mat_id=mat_id where not_valor > 5;
    


-- 3 - Liste o nome do aluno, o nome da disciplina e a nota, de todos os alunos com nota superior a 7 
-- e matriculados em alguma das disciplinas  (Algoritmos e Estruturas de Dados, Computação em Nuvem e Banco de Dados);
select alu_nome, dis_nome, not_valor from tb_matriculas join tb_alunos on mat_alu_id=alu_id
join tb_disciplina on mat_dis_id=dis_id join tb_notas on not_mat_id=mat_id
where not_valor > 7 and dis_nome in ('algoritmos e estruturas de dados','computação em nuvem','banco de dados');


-- 4 - Liste o nome do curso, nome do aluno, o nome da disciplina e a nota  de todos os alunos do curso Ciência da Computação 
-- ou Engenharia de Software, que estão com notas entre 4 e 8;
select cur_nome, alu_nome, dis_nome, not_valor 
from tb_matriculas join tb_alunos on mat_alu_id=alu_id
join tb_disciplina on mat_dis_id=dis_id
join tb_curso on alu_cur_id=cur_id
join tb_notas on not_mat_id=mat_id
where cur_nome in ('ciencia...','engenharia...') and not_valor between 4 and 8;

-- 5 - Liste  o nome do professor, nome do curso, nome do aluno, o nome da disciplina e a nota de todos os alunos
-- do curso Redes de Computadores ou Análise e Desenvolvimento de Sistemas, 
-- que começam com a letra (E ou C ou D ou G), e que estão com notas entre 3 e 9;
select pro_nome, cur_nome, alu_nome, dis_nome, not_valor 
from tb_matriculas join tb_alunos on mat_alu_id=alu_id
join tb_disciplina on mat_dis_id=dis_id
join tb_curso on alu_cur_id=cur_id
join tb_professores on dis_pro_id=pro_id
join tb_notas on not_mat_id=mat_id
where cur_nome in ('redes...','analise...') and 
(alu_nome like 'E%' or alu_nome like 'C%' or alu_nome like 'D%' or alu_nome like 'G%') and not_valor between 3 and 9;



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

-- Disciplina 34 (dis_id = 79)
(46, 79), (47, 79), (48, 79), (49, 79), (50, 79),
(36, 78), (37, 78), (38, 78), (39, 78), (40, 78),
(41, 78), (42, 78), (43, 78), (44, 78), (45, 78),
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


INSERT INTO tb_notas VALUES (1,1,7.50),(2,2,8.25),(3,3,9.00),(4,4,6.75),(5,5,7.00),(6,6,8.50),(7,7,9.75),(8,8,7.25),(9,9,6.50),(10,10,8.00),(11,11,7.90),(12,12,9.20),(13,13,8.60),(14,14,7.80),(15,15,6.90),(16,16,8.70),(17,17,9.10),(18,18,7.50),(19,19,6.80),(20,20,8.30),(21,21,7.60),(22,22,9.40),(23,23,8.20),(24,24,7.90),(25,25,6.70),(26,26,8.50),(27,27,7.80),(28,28,9.20),(29,29,6.90),(30,30,8.00),(31,31,7.40),(32,32,9.30),(33,33,8.60),(34,34,7.70),(35,35,6.80),(36,36,8.75),(37,37,7.65),(38,38,9.10),(39,39,6.85),(40,40,8.20),(41,41,7.55),(42,42,9.45),(43,43,8.40),(44,44,7.85),(45,45,6.95),(46,46,7.20),(47,47,8.55),(48,48,9.00),(49,49,6.75),(50,50,8.35),(51,51,7.80),(52,52,9.25),(53,53,8.10),(54,54,7.40),(55,55,6.85),(56,56,8.60),(57,57,7.95),(58,58,9.10),(59,59,6.70),(60,60,8.45),(61,61,7.55),(62,62,9.30),(63,63,8.20),(64,64,7.85),(65,65,6.90),(66,68,9.00),(67,69,6.80),(68,70,8.55),(69,71,7.70),(70,72,9.20),(71,73,8.10),(72,74,7.60),(73,75,7.95),(74,76,8.40),(75,77,7.25),(76,78,9.15),(77,79,8.65),(78,80,7.90),(79,81,9.05),(80,82,6.95),(81,83,8.80),(82,84,7.85),(83,85,9.25),(84,86,4.50),(85,87,5.25),(86,88,6.00),(87,89,4.75),(88,90,5.50),(89,91,6.25),(90,92,4.85),(91,93,5.75),(92,94,6.50),(93,95,4.60),(94,96,5.90),(95,97,6.10),(96,98,4.95),(97,99,5.30),(98,100,6.40),(99,101,6.70),(100,102,1.20),(101,103,2.50),(102,104,3.00),(103,105,0.75),(104,106,3.40),(105,107,2.90),(106,108,1.50),(107,109,3.20),(108,110,0.85),(109,111,2.60),(110,112,3.50),(111,113,1.70),(112,114,0.95),(113,115,2.20),(114,116,4.00),(115,117,1.80),(116,118,2.10),(117,119,0.90),(118,120,3.00),(119,121,8.40),(120,122,3.90),(121,123,3.00),(122,124,0.60),(123,125,4.10),(124,126,5.50),(125,127,2.70),(126,128,0.40),(127,129,6.20),(128,130,4.70),(129,131,4.90),(130,132,2.00),(131,133,0.40),(132,134,8.70),(133,135,2.90),(134,136,0.20),(135,137,8.00),(136,138,9.70),(137,139,5.10),(138,140,4.70),(139,141,4.60),(140,142,4.90),(141,143,5.10),(142,144,10.00),(143,145,1.30),(144,146,6.50),(145,147,1.20),(146,148,5.90),(147,149,4.00),(148,150,1.70),(149,151,7.00),(150,152,7.20),(151,153,3.60),(152,154,2.60),(153,155,0.70),(154,156,3.30),(155,157,6.10),(156,158,6.60),(157,159,5.90),(158,160,9.30),(159,161,2.30),(160,162,5.60),(161,163,1.00),(162,164,4.50),(163,165,8.40),(164,166,7.00),(165,167,9.50),(166,168,3.70),(167,169,5.10),(168,170,2.80),(169,171,9.70),(170,172,6.80),(171,173,8.50),(172,174,0.30),(173,175,5.10),(174,176,8.20),(175,177,9.40),(176,178,1.80),(177,179,4.20),(178,180,7.70),(179,181,3.80),(180,182,4.40),(181,183,0.40),(182,184,0.00),(183,185,2.60),(184,186,0.10),(185,187,2.10),(186,188,4.80),(187,189,1.80),(188,190,6.40),(189,191,2.80),(190,192,6.80),(191,193,2.30),(192,194,5.30),(193,195,0.80),(194,196,5.60),(195,197,0.00),(196,198,4.00),(197,199,9.90),(198,200,6.00),(199,201,6.00),(200,202,4.70),(201,203,8.00),(202,204,7.60),(203,205,6.10),(204,206,4.60),(205,207,9.00),(206,208,5.10),(207,209,1.20),(208,210,5.90),(209,211,0.90),(210,212,8.30),(211,213,7.30),(212,214,5.80),(213,215,7.70),(214,216,1.60),(215,217,5.40),(216,218,6.40),(217,219,7.30),(218,220,5.10),(219,221,1.20),(220,222,5.00),(221,223,3.40),(222,224,3.10),(223,225,6.00),(224,226,3.70),(225,227,4.50),(226,228,5.60),(227,229,5.50),(228,230,9.80),(229,231,3.90),(230,232,7.00),(231,233,0.60),(232,234,5.30),(233,235,0.00),(234,236,7.20),(235,237,7.50),(236,238,7.60),(237,239,6.50),(238,240,0.80),(239,241,6.80),(240,242,8.70),(241,243,1.40),(242,244,7.60),(243,245,4.60),(244,246,5.90),(245,247,8.60),(246,248,2.00),(247,249,1.80),(248,250,1.30),(249,251,6.30),(250,252,4.00),(251,253,4.50),(252,254,2.30),(253,255,7.90),(254,256,8.20),(255,257,3.40),(256,258,0.80),(257,259,1.90),(258,260,4.20),(259,261,4.70),(260,262,4.30),(261,263,1.70),(262,264,6.80),(263,265,9.10),(264,266,4.70),(265,267,5.90),(266,268,5.60),(267,269,2.50),(268,270,9.30),(269,271,7.80),(270,272,5.30),(271,273,6.10),(272,274,0.20),(273,275,5.70),(274,276,5.60),(275,277,5.70),(276,278,4.80),(277,279,3.30),(278,280,1.10),(279,281,2.10),(280,282,5.10),(281,283,9.00),(282,284,1.70),(283,285,1.50),(284,286,8.40),(285,287,6.00),(286,288,2.00),(287,289,4.70),(288,290,6.80),(289,291,3.00),(290,292,1.60),(291,293,7.60),(292,294,7.60),(293,295,3.30),(294,296,5.30),(295,297,1.10),(296,298,2.70),(297,299,5.40),(298,300,2.60),(299,301,1.40),(300,302,9.80),(301,303,2.70),(302,304,8.50),(303,305,9.20),(304,306,0.50),(305,307,3.70),(306,308,2.30),(307,309,0.40),(308,310,2.40),(309,311,1.80),(310,312,9.10),(311,313,6.20),(312,314,7.60),(313,315,5.40),(314,316,8.30),(315,317,2.20),(316,318,3.20),(317,319,8.00),(318,320,4.60),(319,321,9.70),(320,322,1.40),(321,323,7.90),(322,324,7.80),(323,325,4.20),(324,326,9.60),(325,327,8.70),(326,328,2.50),(327,329,7.10),(328,330,9.70),(329,331,8.80),(330,332,8.50),(331,333,4.00),(332,334,9.00),(333,335,1.50),(334,336,0.30),(335,337,6.00),(336,338,9.60),(337,339,5.50),(338,340,7.90),(339,341,9.00),(340,342,8.90),(341,343,4.00),(342,344,5.70),(343,345,3.90),(344,346,8.90),(345,347,5.60),(346,348,3.40),(347,349,6.70),(348,350,6.80),(349,351,3.60),(350,352,5.90),(351,353,8.30),(352,354,4.90),(353,355,6.50),(354,356,2.70),(355,357,4.70),(356,358,0.30),(357,359,7.80),(358,360,8.60),(359,361,6.70),(360,362,5.30),(361,363,5.80),(362,364,3.10),(363,365,0.30),(364,366,6.90),(365,367,4.10),(366,368,1.00),(367,369,6.60),(368,370,7.40),(369,371,0.90),(370,372,2.20),(371,373,1.20),(372,374,4.00),(373,375,10.00),(374,376,1.00),(375,377,5.40),(376,378,8.90),(377,379,9.50),(378,380,7.50),(379,381,4.90),(380,382,9.20),(381,383,3.00),(382,384,6.00),(383,385,0.70),(384,386,7.10),(385,387,8.90),(386,388,6.40),(387,389,8.90),(388,390,9.90),(389,391,0.60),(390,392,3.30),(391,393,0.00),(392,394,9.70),(393,395,6.60),(394,396,6.50),(395,397,0.40),(396,398,3.60),(397,399,0.30),(398,400,0.50),(399,401,0.90),(400,402,3.90),(401,403,0.20),(402,404,5.20),(403,405,7.40),(404,406,7.90),(405,407,9.70),(406,408,5.20),(407,409,0.60),(408,410,7.60),(409,411,7.20),(410,412,0.10),(411,413,6.90),(412,414,0.20),(413,415,6.20),(414,416,4.80),(415,417,7.00),(416,418,8.00),(417,419,5.00),(418,420,8.80),(419,421,6.80),(420,422,8.10),(421,423,7.20),(422,424,6.80),(423,425,7.30),(424,426,2.70),(425,427,1.10),(426,428,8.60),(427,429,4.30),(428,430,9.10),(429,431,0.30),(430,432,8.80),(431,433,9.00),(432,434,9.30),(433,435,3.20),(434,436,7.00),(435,437,7.10),(436,438,0.50),(437,439,3.10),(438,440,8.10),(439,441,9.80),(440,442,5.10),(441,443,8.70),(442,444,1.60),(443,445,2.60),(444,446,0.00),(445,447,3.00),(446,448,2.30),(447,449,6.90),(448,450,7.70),(449,451,4.90),(450,452,10.00),(451,453,8.50),(452,454,5.10),(453,455,7.60),(454,456,9.10),(455,457,8.10),(456,458,4.60),(457,459,9.50),(458,460,9.40),(459,461,1.90),(460,462,3.20),(461,463,4.10),(462,464,5.70),(463,465,0.80),(464,466,3.30),(465,467,10.00),(466,468,7.60),(467,469,0.60),(468,470,1.90),(469,471,0.30),(470,472,9.80),(471,473,2.40),(472,474,1.30),(473,475,3.80),(474,476,1.80),(475,477,2.10),(476,478,8.70),(477,479,3.70),(478,480,8.70),(479,481,0.60),(480,482,6.10),(481,483,8.50),(482,484,9.90),(483,485,3.80),(484,486,0.90),(485,487,1.60),(486,488,0.00),(487,489,2.70),(488,490,5.20),(489,491,1.50),(490,492,9.00),(491,493,3.30),(492,494,6.20),(493,495,1.60),(494,496,1.30),(495,497,6.40),(496,498,6.10),(497,499,0.40),(498,500,6.80),(499,501,8.00),(500,502,2.00),(501,503,1.30),(502,504,0.00),(503,505,9.00),(504,506,6.30),(505,507,2.70),(506,508,0.80),(507,509,5.40),(508,510,6.00),(509,511,8.10),(510,512,3.70),(511,513,8.10),(512,514,3.30),(513,515,5.90),(514,516,8.50),(515,517,3.00),(516,518,5.40),(517,519,9.50),(518,520,9.90),(519,521,1.10),(520,522,4.60),(521,523,7.40),(522,524,7.40),(523,525,8.40),(524,526,8.00),(525,527,2.90),(526,528,5.80),(527,529,5.70),(528,530,7.70),(529,531,4.70),(530,532,4.90),(531,533,9.00),(532,534,0.90),(533,535,6.10),(534,536,9.30),(535,537,9.30),(536,538,0.00),(537,539,5.40),(538,540,8.60),(539,541,2.30),(540,542,2.00),(541,543,6.30),(542,544,7.60),(543,545,9.30),(544,546,9.30),(545,547,7.00),(546,548,5.90),(547,549,5.90),(548,550,8.70),(549,551,1.00),(550,552,8.40),(551,553,3.30),(552,554,2.70),(553,555,6.90),(554,556,4.40),(555,557,7.30),(556,558,8.40),(557,559,8.00),(558,560,9.00),(559,561,8.80),(560,562,8.00),(561,563,2.70),(562,564,1.60),(563,565,3.80),(564,566,8.70),(565,567,4.50),(566,568,7.10),(567,569,3.20),(568,570,2.50),(569,571,1.80),(570,572,5.00),(571,573,3.10),(572,574,6.90),(573,575,8.20),(574,576,0.10),(575,577,4.20),(576,578,3.90),(577,579,1.80),(578,580,2.00),(579,581,2.60),(580,582,0.70),(581,583,6.40),(582,584,5.60),(583,585,9.20),(584,586,9.60),(585,587,0.20),(586,588,0.30),(587,589,9.90),(588,590,7.60),(589,591,6.80),(590,592,0.90),(591,593,5.60),(592,594,7.00),(593,595,4.50),(594,596,7.20),(595,597,2.30),(596,598,5.00),(597,599,6.80),(598,600,3.70),(599,601,1.00),(600,602,3.80),(601,603,2.00),(602,604,0.20),(603,605,7.60),(604,606,0.40),(605,607,3.80),(606,608,1.40),(607,609,2.90),(608,610,7.30),(609,611,0.40),(610,612,7.00),(611,613,3.00),(612,614,1.50),(613,615,5.50),(614,616,1.50),(615,617,8.80),(616,618,5.20),(617,619,7.30),(618,620,4.90),(619,621,6.20),(620,622,5.60),(621,623,9.30),(622,624,1.60),(623,625,6.20),(624,626,4.80),(625,627,10.00),(626,628,1.40),(627,629,4.60),(628,630,0.10),(629,631,2.70),(630,632,9.20),(631,633,2.50),(632,634,3.80),(633,635,6.00),(634,636,4.20),(635,637,5.80),(636,638,2.80),(637,639,3.20),(638,640,1.50),(639,641,5.40),(640,642,9.50),(641,643,2.80),(642,644,0.60),(643,645,7.20),(644,646,1.00),(645,647,8.40),(646,648,6.30),(647,649,2.20),(648,650,9.60),(649,651,8.10),(650,652,8.30),(651,653,6.30),(652,654,2.20),(653,655,5.60),(654,656,1.00),(655,657,0.50),(656,658,1.30),(657,659,9.20),(658,660,4.50),(659,661,0.60),(660,662,4.00),(661,663,2.40),(662,664,3.20),(663,665,7.80),(664,666,2.50),(665,667,3.70),(666,668,7.00),(667,669,7.80),(668,670,3.90),(669,671,6.40),(670,672,0.30),(671,673,1.50),(672,674,0.40),(673,675,9.00),(674,676,3.00),(675,677,5.10),(676,678,9.30),(677,679,4.90),(678,680,9.90),(679,681,9.40),(680,682,2.60),(681,683,2.60),(682,684,0.30),(683,685,0.10),(684,686,7.70),(685,687,5.60),(686,688,9.30),(687,689,8.60),(688,690,6.70),(689,691,2.20),(690,692,6.30),(691,693,0.40),(692,694,6.70),(693,695,5.90),(694,696,6.10),(695,697,6.80),(696,698,10.00),(697,699,5.10),(698,700,8.50),(699,701,3.50),(700,702,3.70),(701,703,3.30),(702,704,7.90),(703,705,1.50),(704,706,0.10),(705,707,8.90),(706,708,4.20),(707,709,6.80),(708,710,6.30),(709,711,5.30),(710,712,2.10),(711,713,0.20),(712,714,4.50),(713,715,0.90),(714,716,1.20),(715,717,7.80),(716,718,1.90),(717,719,9.40),(718,720,6.20),(719,721,0.40),(720,722,0.70),(721,723,9.00),(722,724,6.90),(723,725,4.00),(724,726,8.10),(725,727,3.10),(726,728,7.80),(727,729,9.60),(728,730,6.20),(729,731,0.20),(730,732,8.70),(731,733,3.00),(732,734,2.30),(733,735,3.90),(734,736,4.20),(735,737,5.20),(736,738,8.60),(737,739,2.50),(738,740,4.10),(739,741,2.20),(740,742,2.10),(741,743,9.40),(742,744,3.10),(743,745,4.90),(744,746,5.10),(745,747,3.00),(746,748,0.80),(747,749,9.20),(748,750,4.90),(749,751,6.90),(750,752,1.90),(751,753,6.00),(752,754,3.50),(753,755,9.50),(754,756,6.10),(755,757,1.30),(756,758,8.30),(757,759,4.10),(758,760,8.20),(759,761,6.10),(760,762,1.20),(761,763,9.30),(762,764,7.70),(763,765,6.20),(764,766,9.70),(765,767,8.40),(766,768,9.30),(767,769,2.70),(768,770,5.70),(769,771,9.90),(770,772,2.80),(771,773,1.30),(772,774,6.60),(773,775,7.20),(774,776,2.80),(775,777,3.20),(776,778,4.50),(777,779,8.90),(778,780,9.20),(779,781,4.20),(780,782,6.60),(781,783,8.20),(782,784,6.40),(783,785,5.30),(784,786,5.10),(785,787,3.70),(786,788,4.20),(787,789,2.30),(788,790,7.20),(789,791,8.80),(790,792,7.30),(791,793,6.40),(792,794,5.00),(793,795,1.90),(794,796,5.40),(795,797,3.20),(796,798,5.70),(797,799,6.50),(798,800,3.10),(799,801,3.90),(800,802,1.60),(801,803,0.90),(802,804,0.20),(803,805,4.30),(804,806,9.90),(805,807,8.80),(806,808,1.30),(807,809,5.40),(808,810,2.60),(809,811,8.40),(810,812,6.30),(811,813,3.10),(812,814,7.10),(813,815,3.20),(814,816,9.60),(815,817,8.40),(816,818,5.40),(817,819,1.70),(818,820,0.90),(819,821,7.20),(820,822,4.80),(821,823,7.30),(822,824,5.10),(823,825,0.30),(824,826,7.50),(825,827,8.40),(826,828,1.80),(827,829,3.90),(828,830,0.50),(829,831,8.40),(830,832,5.70),(831,833,8.90),(832,834,6.30),(833,835,5.90),(834,836,6.40),(835,837,0.90),(836,838,1.90),(837,839,4.10),(838,840,8.70),(839,841,1.20),(840,842,9.50),(841,843,1.70),(842,844,2.10),(843,845,5.70),(844,846,6.30),(845,847,2.00),(846,848,1.50),(847,849,5.20),(848,850,4.40),(849,851,3.40),(850,852,6.50),(851,853,5.70),(852,854,1.10),(853,855,9.50),(854,856,1.70),(855,857,8.20),(856,858,8.70),(857,859,8.60),(858,860,7.10),(859,861,8.50),(860,862,4.10),(861,863,4.00),(862,864,7.00),(863,865,7.60),(864,866,9.80),(865,867,4.50),(866,868,1.20),(867,869,1.30),(868,870,2.60),(869,871,3.20),(870,872,4.60),(871,873,0.90),(872,874,5.10),(873,875,8.80),(874,876,6.70),(875,877,2.00),(876,878,4.20),(877,879,4.50),(878,880,2.20),(879,881,5.80),(880,882,2.20),(881,883,9.00),(882,884,0.70),(883,885,8.00),(884,886,6.30),(885,887,5.40),(886,888,7.20),(887,889,9.70),(888,890,8.70),(889,891,2.40),(890,892,1.00),(891,893,6.70),(892,894,6.50),(893,895,3.40),(894,896,7.10),(895,897,10.00),(896,898,1.90),(897,899,6.90),(898,900,4.90),(899,901,5.60),(900,902,2.20),(901,903,6.10),(902,904,9.40),(903,905,4.30),(904,906,9.50),(905,907,9.60),(906,908,0.00),(907,909,2.20),(908,910,0.90),(909,911,0.80),(910,912,1.60),(911,913,0.10),(912,914,8.80),(913,915,8.20),(914,916,3.80),(915,917,4.00),(916,918,0.20),(917,919,5.20),(918,920,1.30);


select * from tb_professores;
select * from tb_alunos;
select * from tb_disciplinas;
select * from tb_cursos;
select * from tb_matriculas;
select count(*) from tb_notas;
