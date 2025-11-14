import 'package:flutter_test/flutter_test.dart';

import 'mocks/test_channel_mocks.dart';

/// Setup global para todos os testes da aplicação
///
/// Configura mocks necessários para method channels e outras dependências
/// globais que são usadas em múltiplos testes.
///
/// Para usar este setup em seus testes, importe este arquivo e chame 
/// [setupGlobalTestEnvironment] no setUpAll e [tearDownGlobalTestEnvironment] 
/// no tearDownAll.
///
/// Exemplo:
/// ```dart
/// import '../../../test_setup.dart';
/// 
/// void main() {
///   setUpAll(() {
///     setupGlobalTestEnvironment();
///   });
///   
///   tearDownAll(() {
///     tearDownGlobalTestEnvironment();
///   });
///   
///   // seus testes...
/// }
/// ```
class TestSetup {
  /// Configura o ambiente global de testes
  static void setupGlobalTestEnvironment() {
    TestWidgetsFlutterBinding.ensureInitialized();
    
    // Setup mock para analytics channel
    TestChannelMocks.setupAnalyticsChannelMock();
  }

  /// Remove configurações globais de teste
  static void tearDownGlobalTestEnvironment() {
    // Remove analytics channel mock
    TestChannelMocks.tearDownChannelMocks();
  }
}