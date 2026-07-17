class OwnerIndex<V, E> {
  Map<V, Set<E>> _ownerIndex = {};
  Map<E, V> _ownedIndex = {};

  Set<E>? owneds(V owner) {
    return _ownerIndex[owner];
  }

  void clear() {
    _ownedIndex = {};
    _ownerIndex = {};
  }

  void addRelationship(V owner, E owned) {
    _ownedIndex[owned] = owner;
    _ownerIndex.putIfAbsent(owner, () => {}).add(owned);
  }

  void removeOwner(V owner) {
    final l = _ownerIndex.remove(owner);
    if (l != null) {
      l.map(_ownedIndex.remove);
    }
  }

  void removeOwned(E owned) {
    final owner = _ownedIndex.remove(owned);
    if (owner != null) {
      _ownerIndex[owner]?.remove(owned);
    }
  }
}
