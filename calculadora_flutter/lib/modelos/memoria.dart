import 'dart:math';

class Memoria {
  static const operacoes = ['%', '/', '*', '-', '+', '=', '^', '!'];
  final _buffer = [0.0, '', 0.0];
  bool _ehPrimeiroNumero = true;
  bool _limparVisor = false;
  String _valor = '0';
  String _ultimoComando = '';

  String get valorNoVisor {
    if (_buffer[1] == '') {
      return _buffer.first.toString();
    } else if (operacoes.contains(_ultimoComando)) {
      return _buffer.sublist(0, 2).join(" ");
    } else {
      return _buffer.join(" ");
    }
  }

  void tratarDigito(String comando) {
    if (_estaSubstituindoOperacao(comando)) {
      _buffer[1] = comando;
      return;
    }

    if (comando == 'C') {
      _limpar();
    } else if (operacoes.contains(comando)) {
      _setOperacao(comando);
    } else {
      _adicionarDigito(comando);
    }

    _ultimoComando = comando;
  }

  bool _estaSubstituindoOperacao(String comando) {
    return operacoes.contains(_ultimoComando) &&
        operacoes.contains(comando) &&
        _ultimoComando != '=' &&
        comando != '=';
  }

  void _limpar() {
    _valor = '0';
    _buffer.setAll(0, [0.0, '', 0.0]);
    _limparVisor = false;
    _ehPrimeiroNumero = true;
    _ultimoComando = '';
  }

  void _adicionarDigito(String digito) {
    final ehPonto = digito == '.';
    final deveLimparValor = (_valor == '0' && !ehPonto) || _limparVisor;

    if (ehPonto && _valor.contains('.') && !deveLimparValor) {
      return;
    }

    final valorVazio = ehPonto ? '0' : '';
    final valorAtual = deveLimparValor ? valorVazio : _valor;
    _valor = valorAtual + digito;
    _limparVisor = false;

    _buffer[_ehPrimeiroNumero ? 0 : 2] = double.tryParse(_valor) ?? 0;
  }

  void _setOperacao(String novaOperacao) {
    bool ehSinalDeIgual = novaOperacao == '=';

    if (_ehPrimeiroNumero) {
      if (!ehSinalDeIgual) {
        _ehPrimeiroNumero = false;
        _buffer[1] = novaOperacao;
      }
      _limparVisor = true;
    } else {
      _buffer[0] = _computa();
      _buffer[1] = ehSinalDeIgual ? '' : novaOperacao;
      _buffer[2] = 0.0;
      _valor = _buffer[0].toString();
      _valor = _valor.endsWith('.0') ? _valor.split('.')[0] : _valor;
      _ehPrimeiroNumero = ehSinalDeIgual;
      _limparVisor = !ehSinalDeIgual;
    }
  }

  double _computa() {
    final primeiroNumero = _buffer[0] as double;
    final segundoNumero = _buffer[2] as double;
    switch (_buffer[1]) {
      case '%':
        return primeiroNumero % segundoNumero;
      case '/':
        return primeiroNumero / segundoNumero;
      case '*':
        return primeiroNumero * segundoNumero;
      case '-':
        return primeiroNumero - segundoNumero;
      case '+':
        return primeiroNumero + segundoNumero;
      case '^':
        return pow(primeiroNumero, segundoNumero).toDouble();
      case '!':
        return _calcularFatorial(primeiroNumero.toInt()).toDouble();
      default:
        return primeiroNumero;
    }
  }

  int _calcularFatorial(int n) {
    if (n == 0 || n == 1) {
      return 1;
    }
    return n * _calcularFatorial(n - 1);
  }
}