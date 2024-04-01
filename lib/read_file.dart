import 'dart:io';

void main() {
  //exibir valor da chave DATABASE_URL=
  ShowLine().showLine('DATABASE_URL');
  //exibir valor da chave S_ADMIN=
  ShowLine().showLine('IS_ADMIN');
  //exibir valor da chave REFRESH_TIME=
  ShowLine().showLine('REFRESH_TIME');
}

///classe para ler conteudo do arquivo .env
class ReadFile {
  //propriedade
  String filePath;

  //construtor
  ReadFile(this.filePath);

  ///metodo para ler o arquivo .env e criar uma lista
  List<String> readFile() {
    File file = File(filePath);
    List<String> lines = file.readAsLinesSync();

    return lines;
  }
}

class ShowLine {
  ///Exibir valor pela chave passada por parametro
  showLine(String key) {
    //variavel lines recebe a classe para ler o arquivo .env
    final lines = ReadFile('.env').readFile();
    //laco for percorre a lista em cada linha procurando o paramentro passado key
    for (var line in lines) {
      if (line.contains('#')) {
        line = line.substring(0, line.indexOf('#'));
      }
      if (line.startsWith('$key=')) {
        String value = line.substring(key.length + 1);
        print(value);
      }
    }
  }
}
