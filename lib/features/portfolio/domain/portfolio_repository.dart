import 'entities.dart';

/// Abstraction over where portfolio content comes from.
///
/// Today it is local, compile-time data. Swapping in a Firestore or REST
/// implementation later requires no changes in the presentation layer.
abstract interface class PortfolioRepository {
  Profile getProfile();
}
