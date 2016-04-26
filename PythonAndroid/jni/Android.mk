LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= \
    locale/locale.cpp
LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/locale/
LOCAL_MODULE:= locale
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
	Modules/_bisectmodule.c  \
	Modules/_codecsmodule.c  \
	Modules/_collectionsmodule.c  \
	Modules/_csv.c  \
	Modules/_datetimemodule.c  \
	Modules/_elementtree.c  \
	Modules/_functoolsmodule.c  \
	Modules/_heapqmodule.c  \
	Modules/_io/_iomodule.c  \
	Modules/_localemodule.c  \
	Modules/_math.c  \
	Modules/_operator.c  \
	Modules/_posixsubprocess.c  \
	Modules/_randommodule.c  \
	Modules/_sre.c  \
	Modules/_stat.c  \
	Modules/_struct.c  \
	Modules/_threadmodule.c  \
	Modules/_tracemalloc.c  \
	Python/_warnings.c  \
	Modules/_weakref.c  \
	Objects/abstract.c  \
	Parser/acceler.c  \
	Objects/accu.c  \
	Modules/arraymodule.c  \
	Python/asdl.c  \
	Python/ast.c  \
	Modules/atexitmodule.c  \
	Modules/binascii.c  \
	Parser/bitset.c  \
	Python/bltinmodule.c  \
	Objects/boolobject.c  \
	Modules/_io/bufferedio.c  \
	Objects/bytearrayobject.c  \
	Objects/bytes_methods.c  \
	Modules/_io/bytesio.c  \
	Objects/bytesobject.c  \
	Objects/capsule.c  \
	Objects/cellobject.c  \
	Python/ceval.c  \
	Objects/classobject.c  \
	Modules/cmathmodule.c  \
	Python/codecs.c  \
	Objects/codeobject.c  \
	Python/compile.c  \
	Objects/complexobject.c  \
	Modules/config.c  \
	Objects/descrobject.c  \
	Objects/dictobject.c  \
	Python/dtoa.c  \
	Python/dynamic_annotations.c  \
	Python/dynload_shlib.c  \
	Objects/enumobject.c  \
	Modules/errnomodule.c  \
	Python/errors.c  \
	Objects/exceptions.c  \
	Modules/faulthandler.c  \
	Modules/fcntlmodule.c  \
	Modules/_io/fileio.c  \
	Objects/fileobject.c  \
	Python/fileutils.c  \
	Parser/firstsets.c  \
	Objects/floatobject.c  \
	Python/formatter_unicode.c  \
	Objects/frameobject.c  \
	Python/frozen.c  \
	Python/frozenmain.c  \
	Objects/funcobject.c  \
	Python/future.c  \
	Modules/gcmodule.c  \
	Objects/genobject.c  \
	Python/getargs.c  \
	Modules/getbuildinfo.c  \
	Python/getcompiler.c  \
	Python/getcopyright.c  \
	Python/getopt.c  \
	Modules/getpath.c  \
	Python/getplatform.c  \
	Python/getversion.c  \
	Python/graminit.c  \
	Parser/grammar.c  \
	Parser/grammar1.c  \
	Modules/hashtable.c  \
	Python/import.c  \
	Python/importdl.c  \
	Modules/_io/iobase.c  \
	Objects/iterobject.c  \
	Modules/itertoolsmodule.c  \
	Parser/listnode.c  \
	Objects/listobject.c  \
	Objects/longobject.c  \
	Modules/main.c  \
	Python/marshal.c  \
	Modules/mathmodule.c  \
	Modules/md5module.c  \
	Objects/memoryobject.c  \
	Parser/metagrammar.c  \
	Objects/methodobject.c  \
	Modules/mmapmodule.c  \
	Python/modsupport.c  \
	Objects/moduleobject.c  \
	Parser/myreadline.c  \
	Python/mysnprintf.c  \
	Python/mystrtoul.c  \
	Objects/namespaceobject.c  \
	Parser/node.c  \
	Objects/object.c  \
	Objects/obmalloc.c  \
	Objects/odictobject.c  \
	Parser/parser.c  \
	Modules/parsermodule.c  \
	Parser/parsetok.c  \
	Python/peephole.c  \
	Parser/pgen.c  \
	Modules/posixmodule.c  \
	Modules/pwdmodule.c  \
	Python/pyarena.c  \
	Python/pyctype.c  \
	Modules/pyexpat.c  \
	Python/pyfpe.c  \
	Python/pyhash.c  \
	Python/pylifecycle.c  \
	Python/pymath.c  \
	Python/pystate.c  \
	Python/pystrcmp.c  \
	Python/pystrhex.c  \
	Python/pystrtod.c  \
	Python/Python-ast.c  \
	Python/pythonrun.c  \
	Python/pytime.c  \
	Python/random.c  \
	Objects/rangeobject.c  \
	Modules/selectmodule.c  \
	Objects/setobject.c  \
	Modules/sha1module.c  \
	Modules/sha256module.c  \
	Modules/sha512module.c  \
	Modules/signalmodule.c  \
	Objects/sliceobject.c  \
	Modules/_io/stringio.c  \
	Python/structmember.c  \
	Objects/structseq.c  \
	Python/symtable.c  \
	Modules/symtablemodule.c  \
	Modules/syslogmodule.c  \
	Python/sysmodule.c  \
	Modules/_io/textio.c  \
	Python/thread.c  \
	Modules/timemodule.c  \
	Parser/tokenizer.c  \
	Python/traceback.c  \
	Objects/tupleobject.c  \
	Objects/typeobject.c  \
	Objects/unicodectype.c  \
	Objects/unicodeobject.c  \
	Objects/weakrefobject.c  \
	Modules/expat/xmlparse.c  \
	Modules/expat/xmlrole.c  \
	Modules/expat/xmltok.c  \
	Modules/xxsubtype.c  \
	Modules/zipimport.c  \
	Modules/zlibmodule.c  \

LOCAL_CFLAGS += -DHAVE_CONFIG_H \
	-DHAVE_EXPAT_CONFIG_H \
	-DUSE_PYEXPAT_CAPI \
	-DPy_BUILD_CORE \
	-DSOABI='"cpython-35m-arm-linux-gnueabi"' \
	-DVERSION='"3.5"' \
	-DVPATH='""' \

	#-DPYTHONPATH='"/sdcard/python3.5.zip"' \
	#-DPREFIX='"/usr/local"' \
	#-DEXEC_PREFIX='"/usr/local"' \

LOCAL_LDLIBS := -lz -lm -ldl -llog
LOCAL_SHARED_LIBRARIES := locale

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/ \
	$(LOCAL_PATH)/Include/ \
	$(LOCAL_PATH)/Modules/expat \
	$(LOCAL_PATH)/Python

LOCAL_MODULE:= libpython3.5
include $(BUILD_SHARED_LIBRARY)
#include $(BUILD_STATIC_LIBRARY)

##################################
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    main.c
LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/ \
	$(LOCAL_PATH)/Include \

LOCAL_LDLIBS := -lz -llog
LOCAL_SHARED_LIBRARIES := libpython3.5
LOCAL_MODULE := main
include $(BUILD_SHARED_LIBRARY)

