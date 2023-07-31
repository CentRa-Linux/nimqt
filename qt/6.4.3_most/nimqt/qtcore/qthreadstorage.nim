const headerFile* = "QtCore/qthreadstorage.h"

# Disable 'Warning: type pragmas follow the type name; this form of writing pragmas is deprecated'
{.push warning[Deprecated]: off.}
when (NimMajor, NimMinor, NimPatch) < (1, 9, 0):
    type
        # Classes found in the C++ code
        QThreadStorageData* {.header:headerFile,importcpp:"QThreadStorageData" ,pure.} = object {.inheritable.}
        QThreadStorage*[T] {.header:headerFile,importcpp:"QThreadStorage" ,pure.} = object {.inheritable.}
elif (NimMajor, NimMinor, NimPatch) >= (1, 9, 0):
    type
        # Classes found in the C++ code
        QThreadStorageData* {.header:headerFile,importcpp:"QThreadStorageData" ,pure,inheritable.} = object
        QThreadStorage*[T] {.header:headerFile,importcpp:"QThreadStorage" ,pure,inheritable.} = object
{.push warning[Deprecated]: on.}

# Stuff for class QThreadStorageData

# Public methods for QThreadStorageData
proc get*(this: QThreadStorageData): ptr ptr  {.header:headerFile, importcpp:"#.get(@)".} # Public
proc set*(this: QThreadStorageData, p: ptr): ptr ptr  {.header:headerFile, importcpp:"#.set(@)".} # Public
proc static_QThreadStorageData_finish*(arg_0: ptr ptr) {.header:headerFile, importcpp:"QThreadStorageData::finish(@)".} # Public static
# Stuff for class QThreadStorage

# Public constructors for QThreadStorage
proc newQThreadStorage*[T](): QThreadStorage[T] {. header:headerFile, importcpp:"QThreadStorage(@)", constructor .} #

# Public methods for QThreadStorage
proc hasLocalData*[T](this: QThreadStorage[T]): bool {.header:headerFile, importcpp:"#.hasLocalData(@)".} # Public
proc localData*[T](this: QThreadStorage[T]): T {.header:headerFile, importcpp:"#.localData(@)".} # Public
proc setLocalData*[T](this: QThreadStorage[T], t: T) {.header:headerFile, importcpp:"#.setLocalData(@)".} # Public

