#include "main.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Python.h"
#include <android/log.h>

JNIEXPORT jint JNICALL Java_com_example_pythontest_MainActivity_add
  (JNIEnv *env, jclass js, jint arg0, jint arg1)
{
    //set path and home,pay attention --> python3.5.zip
	putenv("PYTHONPATH=/data/data/com.example.pythontest/files/python3.5.zip");
	//putenv("PYTHONHOME=/data/data/com.example.pythontest/files");


    Py_Initialize();
    if ( !Py_IsInitialized()){
    	__android_log_print(ANDROID_LOG_INFO, "JNIEnv","Py_Initialize failed!!\n"); 
        return -1;
    }

    __android_log_print(ANDROID_LOG_INFO, "JNIEnv","Py_Initialize successfully!!\n");

    //add current path to search pythonforandroid.py file
    PyRun_SimpleString("import sys");
    PyRun_SimpleString("sys.path.append('/data/data/com.example.pythontest/files')"); //this mean pythonforandroid.py under /data/data/com.example.pythontest/files
    // PyRun_SimpleString("print('hello')"); //this mean pythonforandroid.py under /data/data/com.example.pythontest/files

    PyObject *pModule;
    PyObject *pFunction;
    PyObject *ytFunction;
    PyObject *pArgs;
    PyObject *ytArgs;
    PyObject *pRetValue;
    PyObject *ytRetValue;
    // PyObject *streamLink;

    //import module which name pythonforandroid under /data/data/com.example.pythontest/files
    pModule = PyImport_ImportModule("pythonforandroid");
    if(!pModule){
    	__android_log_print(ANDROID_LOG_INFO, "JNIEnv","import python module failed!!\n"); 
        return -1;
    }

    //invoke python function add_func
    pFunction = PyObject_GetAttrString(pModule, "add_func");
    if(!pFunction){ 
    	__android_log_print(ANDROID_LOG_INFO, "JNIEnv","get python function failed!!!\n"); 
    	return -1;    
    }
    pArgs = PyTuple_New(2);
    PyTuple_SetItem(pArgs, 0, Py_BuildValue("i", arg0));
    PyTuple_SetItem(pArgs, 1, Py_BuildValue("i", arg1));
    pRetValue = PyObject_CallObject(pFunction, pArgs);

    __android_log_print(ANDROID_LOG_INFO, "JNIEnv","pRetValue %ld",PyLong_AsLong(pRetValue)); 

    ytFunction = PyObject_GetAttrString(pModule, "get_stream");

    if(!ytFunction){ 
        __android_log_print(ANDROID_LOG_INFO, "JNIEnv","get yt function failed!!!\n"); 
        return -1;    
    }
    ytArgs = PyTuple_New(1);
    PyTuple_SetItem(ytArgs, 0, Py_BuildValue("s", arg0));
    ytRetValue = PyObject_CallObject(ytFunction, ytArgs);
    // streamLink = PyDict_GetItemString(ytRetValue, "stream");
    __android_log_print(ANDROID_LOG_INFO, "JNIEnv","pRetValue %s", PyUnicode_AsUTF8(ytRetValue)); 

    Py_DECREF(pModule);
    Py_DECREF(pFunction);
    Py_DECREF(ytFunction);
    Py_DECREF(pArgs);
    Py_DECREF(ytArgs);
    Py_DECREF(pRetValue);
    Py_DECREF(ytRetValue);
    Py_Finalize();
    
    return PyLong_AsLong(pRetValue);
}