# Teste Técnico – Gestão de Ordens de Serviço

Projeto desenvolvido em Delphi como parte de avaliação técnica, com foco em organização de código, boas práticas e entrega de valor além do CRUD.

---

## 📌 Tecnologias Utilizadas

- Delphi 12 Community Edition
- Firebird 3.0
- FireDAC
- Fortes Report Community Edition
- Git/GitHub

---

## 🏗️ Arquitetura

O projeto foi estruturado seguindo separação de responsabilidades:

- **UI (Forms)** → Interface com o usuário
- **DataModules** → Acesso a dados para IU (FireDAC)
- **Services** → Regras de negócio
- **Repositories** → Acesso a dados para manipulação
- **Filtros (DTOs)** → Encapsulamento de critérios de busca

O projeto também conta com Factories e Interfaces e Bootstrap, utilizados quando necessário.

### Princípios aplicados

- SOLID
- Clean Code
- Separação de camadas
- Baixo acoplamento
- Reutilização de código
- Queries parametrizadas (evitando SQL injection)
- Organização orientada a domínio

---

## 🗄️ Banco de Dados

O modelo foi baseado no enunciado, com ajustes para integridade e consistência.

📄 Script completo:
```
src/sql/db.sql
```

### Principais melhorias

- Padronização de nomenclatura (`DATA_CADASTRO`)
- Constraint `CHECK` para o campo `STATUS`
- `ON DELETE CASCADE` em `ITEM_ORDEM`
- Índices para otimização de consultas
- View `VW_OS_RESUMO` para apoio a relatórios e regras de SLA

### Observações

- `VALOR_TOTAL` é persistido por performance e recalculado na aplicação
- A View encapsula a regra de atraso (SLA)

---

## ⚙️ Como Executar

### 1. Banco de dados

- Rodar o sistema é o suficiente! 

O projeto conta com geração automática de banco de dados.

OU

- Executar script:

```
bin/sql/db.sql
```

### 2. Configuração de conexão

- O projeto também conta com tela de configuração!

Ao rodar o sistema pela primeira vez, o sistema trás a tela, e gera automaticamente o banco de dados configurado.

---

### 3. Executar

- Rodar executável:

```
bin/OrdensServico.exe
```

OU

- Abrir o projeto `src/OrdensServico.dproj`
- Compilar
- Executar

---

## 📋 Funcionalidades Implementadas

### ✔ CRUDs Completos

- Clientes
- Ordens de Serviço
- Itens da OS (vinculados)
- Configurações

### ✔ Filtros

- Id
- Cliente (nome parcial)
- Status
- Períodos (data de abertura, previsão, fechamento)
- Valor total (>= / <=)

### ✔ Paginação

- Implementada via `OFFSET / FETCH`
- Configurável (registros por página)
- Navegação por página

---

## 📊 Relatórios

- Relatório de Ordens de Serviço
- Filtros iguais à tela
- Agrupamento por Status
- Totalização:
  - Quantidade por status
  - Soma de valores

### Exportação

- Exportação disponível via componente de relatório

---

## ⭐ Funcionalidade NÃO-CRUD (Obrigatória)

### SLA / Atraso de Ordens

Regra implementada:

- OS é considerada **em atraso** quando:
  - `DATA_PREVISTA < DATA_ATUAL`
  - E status diferente de `Concluída` ou `Cancelada`

### Implementações:

- Campo calculado via View (`EM_ATRASO`)
- Destaque visual no grid (cor)
- Contadores no topo:
  - Total de OSs
  - Total Abertas
  - Total Em Andamento
  - Total Concluídas
  - Total Em Atraso

---

## 🎯 Funcionalidades Extras

- Paginação configurável
- Dashboard simples
- Atalhos de teclado (para botões, filtros e grades!)
- Destaque visual para registros em atraso
- StatusBar com informações do sistema
- Tela `Sobre`

---

## 🔒 Regras de Negócio

- `VALOR_TOTAL` recalculado automaticamente com base nos itens
- Transação ao salvar OS + itens 
- Validação de dados obrigatórios
- Controle de status com valores válidos

---

## ⚠️ Tratamento de Erros

- Mensagens amigáveis ao usuário
- Tratamento via `try/except`
- Prevenção de operações inválidas (ex: edição sem seleção)

---

## ⚖️ Decisões Arquiteturais

- Uso de DataModules centralizados (padrão VCL)
- Regras de negócio isoladas em Services
- Filtros desacoplados via classes específicas
- SQL organizado e reutilizável

---

## 🚧 Limitações Conhecidas

- DataModules com auto-create
- Prováveis bugs!
- Por algum motivo desconhecido, as DMs insistem em se transformar units visuais, por vezes quebrando a compilação!

---

## 🚀 Melhorias Futuras

- Testes automatizados
- Paginação reutilizável genérica
- Logs estruturados
- Gráficos visuais

---

## 🤖 Uso de Inteligência Artificial

Ferramentas de IA foram utilizadas como apoio para:

- Brainstorming de engenharia
- Sugestões de estrutura
- Revisão de código
- Aceleração de implementação
- Escrever esse README... (Eu adoro emojis, mas o GPT é demais!)

Todo o código foi revisado, adaptado e compreendido antes da entrega. Nada aqui veio da IA sem passar por mim!

---

## 🕑 O que eu faria se tivesse mais 20h?

- Testes!
- Refinamentos
- Barra de progresso para geração do Relatório
- Adição de logs

---

## ❌ Um gargalo potencial no design atual...

- A paginação utiliza duas consultas (dados + total de registros).
- Em cenários com grande volume de dados, isso pode gerar custo adicional.

---

## ⏳ Tempo de desenvolvimento

- Esse sistema foi desenvolvido utilizando um total de 36 horas!

---

## 📎 Considerações Finais

O projeto foi desenvolvido priorizando:

- Clareza
- Organização
- Manutenibilidade
- Performance básica adequada

Buscando entregar não apenas o mínimo solicitado, mas uma base sólida para evolução.
