unit eTasks.Shared.Consts;

interface

{$REGION 'Dados da Aplicação'}
const AppName = 'eTasks';
const AppVersionName = '2.0.0';
const AppVersion = 1;
{$ENDREGION}

{$Region 'Constantes de Nomes de Arquivos associados'}
const TranslationFile  = 'translate.json';
const LocalStorageFile = 'eTasks.json';
{$Endregion}

const Firebase_API_Key = '';

{$REGION 'Constantes de Tamanho'}
const MobileSizeWidth = 768;
const MinimumHeight = 640;
const MinimumWidth = 360;
{$ENDREGION}

{$region 'Constantes Chaves do LocalStorage'}
const LSK_Language = 'UILanguage';
const LSK_ThemeIsDark = 'ThemeIsDark';
{$endregion}

{$region 'Constantes Valores default de Chaves do LocalStorage'}
const LSK_LanguageDefaultValue = 'pt-BR';
const LSK_ThemeIsDarkDefaultValue = false;
{$endregion}

{$region 'Dados da API'}
const BaseURL          = 'https://etasks-d6988.firebaseio.com/v2';
const endpoint_version = '/version.json';
{$endregion}

implementation

end.
