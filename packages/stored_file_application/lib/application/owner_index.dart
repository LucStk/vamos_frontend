import 'dart:collection';

class OwnerIndex<V, E> {
  OwnerIndex() : _ownerIndex = {}, _ownedIndex = {};
  OwnerIndex._(this._ownerIndex, this._ownedIndex);

  final Map<V, Set<E>> _ownerIndex;
  final Map<E, V> _ownedIndex;

  /// Copie profonde, pour garder le store immuable.
  OwnerIndex<V, E> copy() => OwnerIndex._(
    {
      for (final e in _ownerIndex.entries) e.key: {...e.value},
    },
    {..._ownedIndex},
  );

  /// Vue en lecture seule ; jamais null (set vide si aucun élément).
  Set<E> owneds(V owner) => UnmodifiableSetView(_ownerIndex[owner] ?? <E>{});

  V? ownerOf(E owned) => _ownedIndex[owned];

  void clear() {
    _ownedIndex.clear();
    _ownerIndex.clear();
  }

  void addRelationship(V owner, E owned) {
    removeOwned(owned); // si l'élément avait un autre owner, on le détache
    _ownedIndex[owned] = owner;
    _ownerIndex.putIfAbsent(owner, () => {}).add(owned);
  }

  /// Range les éléments de [owner] dans l'ordre de [ordered]. Ceux qui n'y
  /// figurent pas gardent leur ordre relatif, à la suite ; les identifiants
  /// qui n'appartiennent pas à [owner] sont ignorés.
  void reorder(V owner, Iterable<E> ordered) {
    final current = _ownerIndex[owner];
    if (current == null) return;
    final next = <E>{
      for (final e in ordered)
        if (current.contains(e)) e,
      ...current,
    };
    _ownerIndex[owner] = next;
  }

  void removeOwner(V owner) {
    final elements = _ownerIndex.remove(owner);
    if (elements != null) {
      for (final element in elements) {
        _ownedIndex.remove(element);
      }
    }
  }

  void removeOwned(E owned) {
    final owner = _ownedIndex.remove(owned);
    if (owner != null) {
      final set = _ownerIndex[owner];
      set?.remove(owned);
      if (set != null && set.isEmpty) _ownerIndex.remove(owner);
    }
  }
}
