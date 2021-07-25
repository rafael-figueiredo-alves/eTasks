unit eTasks.View.Dialogs.Messages.Consts;

interface

Type

 tTipoMensagem = (tpmErro_login_Senha, tpmErro_login_Email, tpmBranco_login_email, tpmBranco_login_senha, tpmInvalido_login_email, tpmInvalido_login_senha, tpmUsuario_desativado_login,
                  tpmErro_resetar_email, tpmInvalido_resetar_email, tpmBranco_resetar_email, tpmSucesso_resetar,
                  tpmPermissao_solicitar_camera, tpmPermissao_negada_camera, tpmPermissao_solicitar_galeria, tpmPermissao_negada_galeria,
                  tpmErro_criar_conta, tpmBranco_criar_nome, tpmBranco_criar_email, tpmBranco_criar_senha, tpmInvalido_criar_email, tpmInvalido_criar_senha, tpmSucesso_criar_conta,
                  tpmCategoria_Editada, tpmCategoria_Inserida, tpmCategoria_Apagada,
                  tpmTasks_Editada, tpmTasks_Inserida, tpmTasks_Apagada,
                  tpmGoals_Editada, tpmGoals_Inserida, tpmGoals_Apagada,
                  tpmLists_Editada, tpmLists_Inserida, tpmLists_Apagada,
                  tpmNo_Updates);

 ResourceString

  //Mensagens referente a login
  Erro_Senha_Login     = 'A senha informada está incorreta. Por favor tente novamente.';
  Erro_Email_Login     = 'Usuário não está cadastrado. Tente criar uma nova conta ou verifique o email e senha.';
  Branco_Email_Login   = 'Para efetuar login é necessário informar e-mail. Por favor tente novamente.';
  Branco_Senha_Login   = 'Para efetuar login é necessário informar senha. Por favor tente novamente.';
  Invalido_email_login = 'O email fornecido não é válido. Verifique se digitou corretamente e tente novamente.';
  Invalido_senha_login = 'A senha informada parece não ser válida por conter menos de 6 caracteres. Verifique e tente novamente.';
  Usuario_desativado   = 'Sentimos em informar que o usuário informado foi desativado do sistema. Contate nosso suporte para mais informações.';

  //Mensagens referentes a solicitação de Permissões
  Permissao_solicitar_camera  = 'Para tirar uma foto para o perfil de usuário, o eTasks precisa da sua permissão para habilitar a câmera.';
  Permissao_solicitar_galeria = 'Para que você possa selecionar uma foto da sua galeria, o eTasks precisa de sua permissão.';
  Permissao_negada_camera     = 'Não foi possível tirar uma foto para o perfil por falta de permissão de uso da câmera. Tente novamente!';
  Permissao_negada_galeria    = 'Não foi possível selecionar uma foto de perfil da sua galeria por falta de permissão. Tente novamente!';

  //Mensagens referentes a criação de conta
  Invalido_senha_criar_conta  = 'Senha precisa ter pelo menos 6 caracteres. Por favor tente novamente.';
  Invalido_email_criar_conta  = 'Email informado não parece válido. Por favor verifique e tente novamente.';
  Branco_nome_criar_conta     = 'Você parece ter esquecido de informar o nome de usuário para sua nova conta. Informe e tente novamente.';
  Branco_email_criar_conta    = 'Você parece ter esquecido de informar o email para sua nova conta. Informe e tente novamente.';
  Branco_senha_criar_conta    = 'Você parece ter esquecido de informar a senha para sua nova conta. Informe e tente novamente.';
  Erro_criar_conta            = 'Conta de usuário já existe. Tente fazer login ou tente criar conta com outro email.';
  Sucesso_criar_conta         = 'Parabéns! Sua conta foi criada com sucesso. Clique em COMEÇAR para usufruir do eTasks.';

  //Mensagens referentes a resetamento da senha
  Invalido_email_resetar = 'O email informado não parece ser válido. Por favor verifique e tente novamente.';
  Branco_email_resetar   = 'Para poder resetar a senha, é necessário informar um email válido. Por favor informe e tente novamente.';
  Erro_resetar_senha     = 'Não encontramos nenhuma conta com este email. Verifique o email informado e tente novamente, ou crie uma nova conta.';
  Sucesso_resetar_senha  = 'Parabéns, seu pedido de resetamento de senha foi enviado e em instantes você receberá um email com instruções para definir uma nova senha. Aguarde!';

  //Mensagens referentes a Categorias
  Categoria_Editada  = 'Categoria editada com sucesso!';
  Categoria_Inserida = 'Categoria criada com sucesso!';
  Categoria_Apagada  = 'Categoria foi apagada com sucesso!';

  //Mensagens referentes a Tarefas
  Tasks_Editada  = 'Tarefa editada com sucesso!';
  Tasks_Inserida = 'Tarefa criada com sucesso!';
  Tasks_Apagada  = 'Tarefa foi apagada com sucesso!';

  //Mensagens referentes a Metas
  Goals_Editada  = 'Meta foi editada com sucesso!';
  Goals_Inserida = 'Meta foi criada com sucesso!';
  Goals_Apagada  = 'Meta foi apagada com sucesso!';

  //Mensagens referentes a Listas
  Lists_Editada  = 'Item da lista foi editado com sucesso!';
  Lists_Inserida = 'Item foi adicionado a lista de compras com sucesso!';
  Lists_Apagada  = 'Item foi removido da lista de compras com sucesso!';

  //Mensagem de nenhuma atualização disponível
  No_updates = 'Você já está utilizando a versão mais atualizada do eTasks. Parabéns!!!';

implementation

end.
