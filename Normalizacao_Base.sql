-- Normalização e tradução da tabela ID, idetificada como a tabela de ligação entre tods os dados
-- Tradução das colunas da tabela id 
-- alteração do tipo de dados de text para varchar(16) para igualar com o tipo da ligação nas outras tabelas 
-- permitindo a geração de chaves extrangeiras

 ALTER TABLE id 
 CHANGE COLUMN person_id pessoa_id VARCHAR(16) NOT NULL 
    ,CHANGE COLUMN loan_id emprestimo_id VARCHAR(16) NOT NULL
    ,CHANGE COLUMN cb_id historico_id VARCHAR(16) NOT NULL 
