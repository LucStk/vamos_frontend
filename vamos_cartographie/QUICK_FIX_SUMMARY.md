# 🚀 Quick Fix Summary - Import Errors

## 📊 Status Overview
- **Total error files:** 8
- **Total distinct errors:** 60+
- **Main issue:** Re-export chain broken in `topology_engine` package

---

## ⚡ Priority Fixes (in order)

### 🔴 PRIORITY 1: Fix topology_engine exports (5 files affected)

**Files to check:**
```
lib/packages/topology_engine/domain/domain.dart
lib/packages/topology_engine/topology.dart
```

**What's missing:** Classes `Vertex`, `Segment`, `SegmentDraft`, `MobilityType` are not being properly exported

**Affected files:**
- `lib/backend/core/fake_graphql_store.dart` 
- `lib/backend/mapping/gql_mappers.dart`
- `lib/backend/core/fake_seeds.dart`
- `lib/backend/resolvers/topology_resolver.dart`
- `lib/backend/resolvers/waypoint_resolver.dart`

**Quick check:**
```bash
grep -n "export.*vertex" lib/packages/topology_engine/domain/domain.dart
grep -n "export.*segment" lib/packages/topology_engine/domain/domain.dart
```

---

### 🟡 PRIORITY 2: Add missing imports (2 files)

#### File 1: `lib/features/trips/application/command_handlers/trip_handler.dart`
**Add at top:**
```dart
import 'package:topology_engine/application/pipeline/graph_executor.dart';
```

#### File 2: `lib/features/waypoints/command_handlers/waypoint_handler.dart`
**Add at top:**
```dart
import 'package:topology_engine/runtime/store/graph_store.dart';
import 'package:topology_engine/application/pipeline/graph_executor.dart';
```

---

### 🟠 PRIORITY 3: Fix import path (1 file)

**File:** `lib/features/map/presentation/screens/map_screen.dart`
**Line:** 8

**Current:**
```dart
import 'package:vamos_cartographie/features/map/application/events/ui/ui_events.dart';
```

**Suggested fix:**
```bash
# Run package resolution reset
flutter clean
flutter pub get
flutter analyze
```

---

### 🔵 PRIORITY 4: Verify MobilityType mapper (1 file)

**File:** `lib/packages/topology_engine/data/mappers/mobility_type_mapper.dart`

**Check:** Does `GMobilityType` have `toDomain()` method?

**Affected locations:**
- `lib/backend/resolvers/topology_resolver.dart` line 163, 199

---

## 📝 Files to Modify

### 1️⃣ `lib/features/trips/application/command_handlers/trip_handler.dart`
```diff
  import 'package:vamos_cartographie/features/trips/data/providers/trips_providers.dart';
  import 'package:vamos_cartographie/features/trips/domain/trip.dart';
  import 'package:topology_engine/application/pipeline/graph_executor.dart';
+ import 'package:topology_engine/application/pipeline/graph_executor.dart';
  import 'package:riverpod_annotation/riverpod_annotation.dart';
  import 'package:topology_engine/infrastructure/providers/topology_providers.dart';
```

### 2️⃣ `lib/features/waypoints/command_handlers/waypoint_handler.dart`
```diff
  import 'package:latlong2/latlong.dart';
  import 'package:riverpod_annotation/riverpod_annotation.dart';
  import 'package:vamos_cartographie/core/type/id.dart';
  
  import 'package:vamos_cartographie/features/features.dart';
+ import 'package:topology_engine/runtime/store/graph_store.dart';
+ import 'package:topology_engine/application/pipeline/graph_executor.dart';
  import 'package:topology_engine/runtime/store/graph_store.dart';
  import 'package:topology_engine/application/pipeline/graph_executor.dart';
  import 'package:vamos_cartographie/features/waypoints/data/providers/waypoints_providers.dart';
```

---

## 🔍 Import Location Reference

| Class | File Location | Import Path |
|-------|---------------|----|
| `Vertex` | `lib/packages/topology_engine/domain/entities/vertex.dart` | `package:topology_engine/domain/domain.dart` |
| `Segment` | `lib/packages/topology_engine/domain/entities/segment.dart` | `package:topology_engine/domain/domain.dart` |
| `SegmentDraft` | `lib/packages/topology_engine/domain/entities/segment.dart` | `package:topology_engine/domain/domain.dart` |
| `MobilityType` | `lib/packages/topology_engine/domain/types/mobility_types.dart` | `package:topology_engine/domain/domain.dart` |
| `OptimisticExecutor` | `lib/packages/topology_engine/application/pipeline/graph_executor.dart` | `import 'package:topology_engine/application/pipeline/graph_executor.dart'` |
| `GraphStore` | `lib/packages/topology_engine/runtime/store/graph_store.dart` | `import 'package:topology_engine/runtime/store/graph_store.dart'` |
| `tripGraphProvider` | `lib/packages/topology_engine/infrastructure/providers/topology_providers.dart` | `import 'package:topology_engine/infrastructure/providers/topology_providers.dart'` |
| `optimisticExecutorProvider` | `lib/packages/topology_engine/infrastructure/providers/topology_providers.dart` | `import 'package:topology_engine/infrastructure/providers/topology_providers.dart'` |
| `MapTapped` | `lib/features/map/application/events/ui/ui_events.dart` | `import 'package:vamos_cartographie/features/map/application/events/ui/ui_events.dart'` |

---

## ✅ Verification Checklist

After making changes, run:

```bash
# 1. Clean everything
flutter clean

# 2. Get fresh packages
flutter pub get

# 3. Run analysis
flutter analyze

# 4. Build to verify
flutter build linux --debug
```

---

## 📚 Related Documentation
- Full analysis: `IMPORT_ERRORS_ANALYSIS.md`
- Structured data: `IMPORT_ERRORS.json`

---

## 🎯 Next Steps

1. ✅ **Check topology_engine barrel files first** - this fixes 5 files at once
2. ✅ **Add missing imports to handler files** - straightforward additions
3. ✅ **Debug map_screen.dart import** - may need package resolution reset
4. ✅ **Verify mapper method** - ensure toDomain() exists

---

**Last Updated:** 2024-06-19
**Project:** vamos_cartographie
