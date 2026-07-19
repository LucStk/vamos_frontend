class OwnerIndex<V, E> {
  final Map<V, Set<E>> _ownerIndex = {};
  final Map<E, V> _ownedIndex = {};

  Set<E>? owneds(V owner) => _ownerIndex[owner];

  void clear() {
    _ownedIndex.clear();
    _ownerIndex.clear();
  }

  void addRelationship(V owner, E owned) {
    _ownedIndex[owned] = owner;
    _ownerIndex.putIfAbsent(owner, () => {}).add(owned);
  }

  void removeOwner(V owner) {
    final elements = _ownerIndex.remove(owner);
    if (elements != null) {
      // Correction du bug .map() : on utilise une vraie boucle
      for (final element in elements) {
        _ownedIndex.remove(element);
      }
    }
  }

  void removeOwned(E owned) {
    final owner = _ownedIndex.remove(owned);
    if (owner != null) {
      _ownerIndex[owner]?.remove(owned);
      // Optionnel : nettoyer la map si le Set de l'owner est vide
      if (_ownerIndex[owner]?.isEmpty ?? false) {
        _ownerIndex.remove(owner);
      }
    }
  }
}
