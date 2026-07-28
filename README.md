# GP Admin

![Ruby](https://img.shields.io/badge/Ruby-4.0.6-CC342D?logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/Rails-8.1.3-D30001?logo=rubyonrails&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-blue?logo=postgresql&logoColor=white)

Base de projeto Rails para painéis administrativos. Serve como ponto de
partida para novos projetos: já vem com autenticação, layout de admin,
componentes de UI e i18n em pt-BR configurados.

## Stack

- Ruby 4.0.6 / Rails 8.1.3
- PostgreSQL
- Hotwire (Turbo + Stimulus) via importmap
- Tailwind CSS v4
- [RubyUI](https://github.com/ruby-ui/ruby_ui) (componentes Phlex + Tailwind)
- [lucide-rails](https://github.com/kolterdyx/lucide-rails) para ícones
- Minitest

## O que já vem pronto

- Autenticação (login, cadastro, recuperação de senha) usando o gerador
  nativo do Rails 8
- Layout de admin: header, sidebar retrátil com menu pai/filho, footer
- Tarja de ambiente (dev/staging) no topo da tela
- CRUD de usuários com paginação, edição em modal e upload de avatar
- Controle de acesso simples via enum de `role` (`member`/`admin`)
- Máscaras de input (telefone) via Stimulus + imask

## Rodando localmente

```bash
bin/setup
bin/dev
```

O `bin/dev` inicia o servidor Rails e o watcher do Tailwind juntos.
