# Go Workspace Documentation

Este repositório contém vários módulos e exemplos Go agrupados em um workspace `go.work`.

## Estrutura principal

- `go.work` - arquivo de workspace Go que inclui os módulos:
  - `data-access`
  - `example/hello`
  - `hello`
  - `web-service-gin`
- `greetings/` - pacote auxiliar usado por `hello`
- `example/` - diretório com outros exemplos e demos Go, incluindo apps App Engine, geração de tipos e servidores de RAG.

## Módulos principais

### data-access

Um programa simples que estabelece conexão com um banco de dados SQL Server.

Funcionalidade:
- Cria uma conexão SQL usando o driver `github.com/microsoft/go-mssqldb`.
- Usa a string de conexão:
  `sqlserver://localhost?database=recordings&trusted_connection=true&encrypt=disable&user id=NT AUTHORITY\\NETWORK SERVICE`
- Executa `db.Ping()` para verificar a conectividade.
- Imprime `Connected!` ao conectar com sucesso.

Observação:
- É necessário ter um SQL Server acessível com o banco `recordings` configurado.
- Se a conexão falhar, o programa encerra com erro.

### hello

Um executável que consome o pacote local `example.com/greetings` para gerar mensagens de saudação.

Funcionalidade:
- Define um slice de nomes.
- Pede ao pacote `greetings` para gerar mensagens para cada nome.
- Exibe o mapa de mensagens no console.

### web-service-gin

Um serviço HTTP construído com o framework Gin.

Funcionalidade:
- Define um tipo `album` com campos JSON.
- Expõe endpoints REST:
  - `GET /albums` - lista todos os álbuns.
  - `GET /albums/:id` - retorna um álbum por ID.
  - `POST /albums` - adiciona um novo álbum a partir do JSON do corpo da requisição.
- Executa o servidor em `localhost:8080`.

### greetings

Pacote de biblioteca que implementa geração de saudações.

Funcionalidade:
- `Hello(name string) (string, error)` - retorna uma mensagem de saudação para um nome.
- `Hellos(names []string) (map[string]string, error)` - retorna mensagens para vários nomes.
- Usa formatos de saudação aleatórios.

Também inclui testes unitários para validar comportamento de `Hello`.

## Como executar

No diretório raiz do workspace:

1. Usar o workspace Go padrão:

```sh
cd c:\Projects\Go
```

2. Executar cada módulo:

- `data-access`:
```sh
go run ./data-access
```

- `hello`:
```sh
go run ./hello
```

- `web-service-gin`:
```sh
go run ./web-service-gin
```

- `greetings` (testes):
```sh
go test ./greetings
```

## Notas adicionais

- O módulo `example/hello` é um exemplo de módulo com import path `golang.org/x/example/hello`, mas não possui código principal neste workspace além do `go.mod`.
- O workspace inclui outros exemplos em `example/`, que não fazem parte diretamente do `go.work` atual.
- Os módulos usam Go 1.26.2 conforme definido em `go.work` e nos `go.mod`.
