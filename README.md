<div align="center">

<img src="https://github.com/rafael-figueiredo-alves/eTasks/blob/main/assets/eTasks2.webp" alt="eTasks Logo" width="180" height="180" />

# eTasks

### Gerencie tarefas, metas e listas com produtividade e bom humor! 😄✅

<br/>

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/rafael-figueiredo-alves/eTasks?include_prereleases&color=%230d6efd&label=versão&style=for-the-badge)](https://github.com/rafael-figueiredo-alves/eTasks/releases)
[![GitHub Stars](https://img.shields.io/github/stars/rafael-figueiredo-alves/eTasks?color=yellow&style=for-the-badge)](https://github.com/rafael-figueiredo-alves/eTasks/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/rafael-figueiredo-alves/eTasks?color=%230d6efd&style=for-the-badge)](https://github.com/rafael-figueiredo-alves/eTasks/network/members)
[![GitHub Issues](https://img.shields.io/github/issues/rafael-figueiredo-alves/eTasks?color=red&style=for-the-badge)](https://github.com/rafael-figueiredo-alves/eTasks/issues)
[![GitHub License](https://img.shields.io/github/license/rafael-figueiredo-alves/eTasks?style=for-the-badge)](https://github.com/rafael-figueiredo-alves/eTasks/blob/main/LICENSE)
[![GitHub last commit](https://img.shields.io/github/last-commit/rafael-figueiredo-alves/eTasks?style=for-the-badge)](https://github.com/rafael-figueiredo-alves/eTasks/commits)

<br/>

![Delphi](https://img.shields.io/badge/Delphi-EE1F35?style=for-the-badge&logo=delphi&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![Android](https://img.shields.io/badge/Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)

</div>

---

## 📋 Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Funcionalidades](#-funcionalidades)
- [Tecnologias Utilizadas](#-tecnologias-utilizadas)
- [Ecossistema eTasks](#-ecossistema-etasks)
- [Plataformas Suportadas](#-plataformas-suportadas)
- [Capturas de Tela](#-capturas-de-tela)
- [Como Começar](#-como-começar)
- [Pré-requisitos](#-pré-requisitos)
- [Instalação](#-instalação)
- [Arquitetura](#-arquitetura)
- [Roadmap](#-roadmap)
- [Contribuindo](#-contribuindo)
- [Autor](#-autor)
- [Licença](#-licença)

---

## 🚀 Sobre o Projeto

O **eTasks** é um aplicativo de gerenciamento de tarefas, metas e listas de compras, desenvolvido com foco na **produtividade** e no **bom humor**. A ideia é simples: tornar a organização do dia a dia algo leve, intuitivo e até divertido.

O projeto nasceu como um exercício de aprendizado e treinamento em programação **Delphi**, explorando conceitos avançados como o padrão **MVC**, uso de **interfaces**, integração com o **Firebase** como backend, e boas práticas de desenvolvimento mobile e desktop. Com o tempo, evoluiu para um ecossistema completo com projetos irmãos para **servidor** e **web**.

> 💡 *"Organizar suas tarefas nunca foi tão divertido!"*

---

## ✨ Funcionalidades

- ✅ **Gestão de Tarefas** — Crie, edite, conclua e exclua tarefas de forma simples e rápida
- 🎯 **Gestão de Metas** — Registre seus objetivos e acompanhe seu progresso
- 🛒 **Listas de Mercado** — Nunca mais esqueça nada no supermercado
- 🔐 **Autenticação de Usuário** — Login seguro via Firebase Authentication
- ☁️ **Sincronização na Nuvem** — Dados armazenados e sincronizados via Firebase
- 🌙 **Interface Amigável** — Design pensado para ser agradável e fácil de usar
- 📱 **Multi-plataforma** — Disponível para Windows e Android (com web em desenvolvimento)

---

## 🛠️ Tecnologias Utilizadas

### App Principal (Mobile & Desktop)

| Tecnologia | Descrição |
|---|---|
| ![Delphi](https://img.shields.io/badge/Delphi-EE1F35?style=flat&logo=delphi&logoColor=white) **Delphi / RAD Studio** | Linguagem e IDE principal do projeto |
| 🎨 **Skia4Delphi** | Renderização gráfica avançada e moderna |
| 🏛️ **MVC Pattern** | Arquitetura Model-View-Controller para organização do código |
| 🔌 **Interfaces Delphi** | Uso extensivo de interfaces para desacoplamento e testabilidade |
| 🎨 **Lunacy (Icons8)** | Ferramenta de design e prototipagem utilizada no projeto |

### Conceitos e Padrões Aplicados

- Padrão de projeto **MVC** (Model-View-Controller)
- **Interfaces** para abstração e desacoplamento
- Integração com APIs REST
- Desenvolvimento **Multi-plataforma** (FMX - FireMonkey)
- Versionamento com **Git & GitHub**

---

## 🌐 Ecossistema eTasks

O eTasks é mais do que um único repositório — é um **ecossistema de projetos interligados** que juntos formam uma solução completa de gerenciamento de tarefas.

<div align="center">

```
┌─────────────────────────────────────────────────────┐
│                  ECOSSISTEMA eTasks                 │
├──────────────────┬──────────────┬───────────────────┤
│   📱 eTasks      │ ⚙️ eTasks    │   🌐 eTasks       │
│  (Este Repo)     │   Server     │      Web           │
│                  │              │                    │
│  Delphi          │  C# /        │  C# / Blazor       │
│  Windows &       │  ASP.NET /   │  WebAssembly       │
│  Android         │  Minimal API │          │
└──────────────────┴──────────────┴───────────────────┘

```

</div>

### 📱 eTasks — App Mobile & Desktop *(este repositório)*

O app principal desenvolvido em **Delphi**, disponível para **Windows** (32 e 64 bits) e **Android**. É o coração do ecossistema, onde toda a experiência do usuário foi originalmente concebida.

🔗 **Repositório:** [rafael-figueiredo-alves/eTasks](https://github.com/rafael-figueiredo-alves/eTasks)

---

### ⚙️ eTasks Server

> *"A server for eTasks made with C#, ASP.NET and the power of Minimal APIs"*

O **eTasks Server** é o projeto de backend dedicado ao ecossistema, desenvolvido em **C#** com **ASP.NET** e o padrão moderno de **Minimal APIs**. Ele fornece os serviços e endpoints necessários para integração entre os diferentes clientes do ecossistema.

![C#](https://img.shields.io/badge/C%23-239120?style=flat&logo=csharp&logoColor=white)
![ASP.NET](https://img.shields.io/badge/ASP.NET-512BD4?style=flat&logo=dotnet&logoColor=white)
![.NET](https://img.shields.io/badge/.NET-512BD4?style=flat&logo=dotnet&logoColor=white)

🔗 **Repositório:** [rafael-figueiredo-alves/eTasks-server](https://github.com/rafael-figueiredo-alves/eTasks-server)

---

### 🌐 eTasks Web

> *"Com intuito de trazer a experiência do eTasks desktop e mobile para a web, este projeto visa explorar conhecimentos em C# e Blazor para montar um aplicativo de tarefas com integração com o Firebase."*

O **eTasks Web** traz toda a experiência do eTasks para o navegador, utilizando **Blazor WebAssembly** — o framework da Microsoft para desenvolvimento web com **C#** — integrado ao **Firebase** como backend. Uma excelente vitrine das possibilidades do ecossistema .NET na web.

![C#](https://img.shields.io/badge/C%23-239120?style=flat&logo=csharp&logoColor=white)
![Blazor](https://img.shields.io/badge/Blazor-512BD4?style=flat&logo=blazor&logoColor=white)
![WebAssembly](https://img.shields.io/badge/WebAssembly-654FF0?style=flat&logo=webassembly&logoColor=white)

🔗 **Repositório:** [rafael-figueiredo-alves/eTasks-Web](https://github.com/rafael-figueiredo-alves/eTasks-Web)
🌍 **Demo ao vivo:** [rafael-figueiredo-alves.github.io/eTasks-Web](https://rafael-figueiredo-alves.github.io/eTasks-Web)

---

## 💻 Plataformas Suportadas

| Plataforma | Arquitetura | Status |
|---|---|---|
| ![Windows](https://img.shields.io/badge/Windows-0078D6?style=flat&logo=windows&logoColor=white) Windows | 32 bits | ✅ Disponível |
| ![Windows](https://img.shields.io/badge/Windows-0078D6?style=flat&logo=windows&logoColor=white) Windows | 64 bits | ✅ Disponível |
| ![Android](https://img.shields.io/badge/Android-3DDC84?style=flat&logo=android&logoColor=white) Android | 32 bits | ✅ Disponível |
| ![Web](https://img.shields.io/badge/Web-4285F4?style=flat&logo=googlechrome&logoColor=white) Web (Blazor) | — | 🔗 Projeto eTasks-Web |

> 📦 Há planos de disponibilizar o aplicativo para download nas **lojas de aplicativos oficiais** (Google Play Store e Microsoft Store).

---

## 📸 Capturas de Tela

<div align="center">

<!-- Adicione aqui suas capturas de tela -->
> *📷 Capturas de tela serão adicionadas em breve.*

</div>

---

## 🏁 Como Começar

### 📋 Pré-requisitos

Para compilar e executar o projeto, você precisará de:

- **RAD Studio** (Delphi) — Versão recomendada: Alexandria (11) ou superior
- **Skia4Delphi** — Para renderização gráfica avançada ([Instalação](https://github.com/skia4delphi/skia4delphi))
- **Android SDK** — Necessário apenas para compilar para Android (incluído no RAD Studio)

### 🔧 Instalação

1. **Clone o repositório:**

```bash
git clone https://github.com/rafael-figueiredo-alves/eTasks.git
cd eTasks
```

2. **Instale as dependências:**
   - Instale o **Skia4Delphi** conforme a documentação oficial


3. **Abra o projeto no RAD Studio:**
   - Abra o arquivo `.dproj` principal
   - Selecione a plataforma desejada (Win32, Win64 ou Android)
   - Compile e execute!

---

## 🏛️ Arquitetura

O projeto segue o padrão **MVC (Model-View-Controller)**, com uso extensivo de **interfaces** para garantir desacoplamento entre as camadas:

```
eTasks/
├── Model/          # Regras de negócio e entidades de dados
├── View/           # Formulários e componentes visuais (FMX)
├── Controller/     # Lógica de controle e comunicação entre Model e View
├── Interfaces/     # Definições de interfaces para abstração
├── Services/       # Serviços (Firebase, autenticação, etc.)
└── Utils/          # Utilitários e helpers
```

---

## 🗺️ Roadmap

- [x] Gerenciamento de Tarefas (CRUD completo)
- [x] Gerenciamento de Metas
- [x] Listas de Mercado
- [x] Autenticação via Firebase
- [x] Suporte a Windows 32/64 bits
- [x] Suporte a Android
- [ ] Melhorias gráficas com Skia4Delphi
- [ ] Notificações e lembretes
- [ ] Publicação na Google Play Store
- [ ] Publicação na Microsoft Store
- [ ] Integração com eTasks Server (Minimal APIs)
- [ ] Sincronização em tempo real aprimorada

---

## 🤝 Contribuindo

Contribuições são muito bem-vindas! Se você tem alguma sugestão, encontrou um bug ou quer colaborar com o projeto, fique à vontade para:

1. Faça um **Fork** do projeto
2. Crie uma **Branch** para sua feature (`git checkout -b feature/MinhaFeature`)
3. Faça o **Commit** das suas alterações (`git commit -m 'feat: Adiciona MinhaFeature'`)
4. Faça o **Push** para a Branch (`git push origin feature/MinhaFeature`)
5. Abra um **Pull Request**

Você também pode participar abrindo uma [Issue](https://github.com/rafael-figueiredo-alves/eTasks/issues) ou deixando uma ⭐ no repositório!

---

## 👨‍💻 Autor

<div align="center">

<img src="https://github.com/rafael-figueiredo-alves.png" width="100" style="border-radius: 50%"/>

**Rafael de Figueiredo Alves**

Desenvolvedor de Software apaixonado por Delphi, C#, .NET, Blazor, React e muito mais. Pai de dois filhos e eterno aprendiz da arte da programação.

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/rafael-figueiredo-alves)

</div>

---

## 📄 Licença

Este projeto está sob licença. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

<div align="center">

Feito com ❤️ e muito ☕ por **Rafael de Figueiredo Alves**

⭐ Se este projeto te ajudou ou te inspirou, deixe uma estrela!

[![eTasks](https://img.shields.io/badge/eTasks-Produtividade%20com%20Bom%20Humor-blue?style=for-the-badge)](https://github.com/rafael-figueiredo-alves/eTasks)

</div>
