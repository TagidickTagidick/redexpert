#include <QApplication>

#include <QDebug>

#include <jni.h>
#include <iostream>
#include <QMessageBox>
#include <QDir>
#include <QString>
#include <QStringList>
#include <QProcess>
#include <iostream>
#include <stdlib.h>
// C RunTime Header Files
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <memory.h>
#include <regex>

#ifdef __linux__
#include <dlfcn.h>
#include <unistd.h>

// Create type for pointer to the JNI_CreateJavaVM function
typedef jint (*CreateJvmFuncPtr) (JavaVM**, void**, JavaVMInitArgs*);

CreateJvmFuncPtr createJvm = NULL;
void* jvm_lib;
char* error;
#else
// Windows Header Files:
#include <windows.h>
#include <ShellAPI.h>

typedef JNIIMPORT jint(JNICALL *JNI_createJavaVM)(JavaVM **pvm, JNIEnv **env, void *args);
JNI_createJavaVM createJVM = NULL;
HMODULE hJVM = NULL;
#endif

#define CLEAR(x) memset(&x, 0, sizeof(x))

int executeCmdEx(const char* cmd, std::string &result)
{
    char buffer[128];
    int retCode = -1; // -1 if error ocurs.
    std::string command(cmd);
    command.append(" 2>&1"); // also redirect stderr to stdout

    result = "";
    FILE* pipe;
#ifdef __linux__
    pipe = popen(command.c_str(), "r");
#else
    pipe = _popen(command.c_str(), "r");
#endif
    if (pipe != NULL) {
        try {
            while (!feof(pipe)) {
                if (fgets(buffer, 128, pipe) != NULL)
                    result += buffer;
            }
        }
        catch (...) {
#ifdef __linux__
            retCode = pclose(pipe);
#else
            retCode = _pclose(pipe);
#endif
            throw;
        }
#ifdef __linux__
        retCode = pclose(pipe);
#else
        retCode = _pclose(pipe);
#endif
    }
    return retCode;
}

#ifdef __linux__
inline bool fileExists(const std::string& name) {
    return (access( name.c_str(), F_OK) != -1);
}

// New method returns pointer to the JNI_CreateJavaVM function
CreateJvmFuncPtr findCreateJvm() {

    char* java_env = getenv("JAVA_HOME");
    std::string jvm_path;
    if (java_env == NULL || strcmp(java_env, "") == 0)
    {
        std::string out;
        executeCmdEx("java -XshowSettings:properties -version", out);
        std::string jhome_pat = "java.home = ";
        int jhome_pos = out.find(jhome_pat.c_str()) +  jhome_pat.length();
        int end_pos = out.find("\n", jhome_pos);
        java_env = strdup(out.substr(jhome_pos, end_pos - jhome_pos).c_str());
    }
    jvm_path = java_env;
    std::string out;
    std::string cmd = java_env;
    cmd.append("/bin/java -version");
    executeCmdEx(cmd.c_str(), out);
    int jver_pos = out.find("\"") + 1;
    int first_dot_pos = out.find(".");
    int second_dot_pos = out.find(".", first_dot_pos + 1);
    std::string str_ver = out.substr(jver_pos, second_dot_pos - jver_pos);
    if(jver_pos)
    {
        double version = atof(str_ver.c_str());
        if (version < 1.9)
        {
            std::string tmp_path = jvm_path;
            tmp_path.append("/jre/lib/amd64/server/libjvm.so");
            if (!fileExists(tmp_path))
                jvm_path.append("/lib/amd64/server/libjvm.so");
            else
                jvm_path.append("/jre/lib/amd64/server/libjvm.so");
        }
        else
            jvm_path.append("/lib/server/libjvm.so");
    }
    else
    {
        QMessageBox msgBox;
        msgBox.setInformativeText("Cannot determine the version of java from version string");
        msgBox.setText("Cannot find Java version!");
        msgBox.setWindowTitle("Application error");
        msgBox.setStandardButtons(QMessageBox::Ok);
        msgBox.setIcon(QMessageBox::Critical);
        msgBox.exec();
#ifdef QT_DEBUG
        qDebug() << "Cannot find Java version!\n";
#endif
        exit(EXIT_FAILURE);
    }

    jvm_lib = dlopen(jvm_path.c_str(), RTLD_LAZY); // Get handle to jvm shared library
    error = dlerror(); //Check for errors on dlopen
    if(jvm_lib == NULL || error != NULL)
    {
        QMessageBox msgBox;
        msgBox.setInformativeText("Failed to load JVM!");
        msgBox.setText("Cannot load JVM!");
        msgBox.setWindowTitle("Application error");
        msgBox.setStandardButtons(QMessageBox::Ok);
        msgBox.setIcon(QMessageBox::Critical);
        msgBox.exec();
#ifdef QT_DEBUG
        qDebug() << "Failed to load JVM!\n";
#endif
        exit(EXIT_FAILURE);
    }

    // Load pointer to the function within the shared library
    createJvm = (CreateJvmFuncPtr) dlsym(jvm_lib, "JNI_CreateJavaVM");
    error = dlerror();
    if(error != NULL)
    {
#ifdef QT_DEBUG
        qDebug() << "Success JVM creating\n";
#endif
        printf("Success JVM creating\n");
    }
    return createJvm;
}
#else

bool fileExists(const std::string& path)
{
    return GetFileAttributesA(path.c_str()) != INVALID_FILE_ATTRIBUTES;
}

bool loadJVMLibrary()
{
    char* java_env;
    size_t len;
    errno_t err = _dupenv_s(&java_env, &len, "JAVA_HOME");
    bool use_jhome = true;
    std::string jvm_path;
    if (java_env == NULL || strcmp(java_env, "") == 0)
    {
        std::string out;
        executeCmdEx("java -XshowSettings:properties -version", out);
        std::regex jhome_regex("java\\.home\\s\\=\\s(([\\w+\\\\\\-:\\.])+)");
        std::smatch match;
        if(std::regex_search(out, match, jhome_regex))
        {
            std::string str = match[1].str();
            java_env = strdup(str.c_str());
            use_jhome = false;
        }
    }
    jvm_path = java_env;
    std::string out;
    std::string cmd = java_env;
    cmd.append("\\bin\\java -version");
    executeCmdEx(cmd.c_str(), out);
    int jver_pos = out.find("\"") + 1;
    int first_dot_pos = out.find(".");
    int second_dot_pos = out.find(".", first_dot_pos + 1);
    std::string str_ver = out.substr(jver_pos, second_dot_pos - jver_pos);
    if(jver_pos)
    {
        double version = atof(str_ver.c_str());
        if (version < 1.9)
        {
            std::string tmp_path = jvm_path;
            tmp_path.append("\\jre\\bin\\server\\jvm.dll");
            if (!fileExists(tmp_path))
                jvm_path.append("\\bin\\server\\jvm.dll");
            else
                jvm_path.append("\\jre\\bin\\server\\jvm.dll");
        }
        else
            jvm_path.append("\\bin\\server\\jvm.dll");
    }
    else
    {
        QMessageBox msgBox;
        msgBox.setInformativeText("Cannot determine the version of java from version string");
        msgBox.setText("Cannot find Java version!");
        msgBox.setWindowTitle("Application error");
        msgBox.setStandardButtons(QMessageBox::Ok);
        msgBox.setIcon(QMessageBox::Critical);
        msgBox.exec();
#ifdef QT_DEBUG
        qDebug() << "Cannot find Java version!\n";
#endif
        exit(EXIT_FAILURE);
    }

    if (java_env == NULL)
    {
        QMessageBox msgBox;
        msgBox.setInformativeText("Please set JAVA_HOME to a Java JDK Install");
        msgBox.setText("Cannot find Java!");
        msgBox.setWindowTitle("Application error");
        msgBox.setStandardButtons(QMessageBox::Ok);
        msgBox.setIcon(QMessageBox::Critical);
        msgBox.exec();
#ifdef QT_DEBUG
        qDebug() << "Cannot find Java!\n";
#endif
        exit(EXIT_FAILURE);
    }

    hJVM = LoadLibraryA(jvm_path.c_str());
    if(!hJVM)
    {
        QMessageBox msgBox;
        msgBox.setInformativeText("Failed to load JVM!");
        msgBox.setText("Cannot load JVM!");
        msgBox.setWindowTitle("Application error");
        msgBox.setStandardButtons(QMessageBox::Ok);
        msgBox.setIcon(QMessageBox::Critical);
        msgBox.exec();
#ifdef QT_DEBUG
        qDebug() << "Failed to load JVM!\n";
#endif
        exit(EXIT_FAILURE);
    }

    createJVM = (JNI_createJavaVM) GetProcAddress(hJVM, "JNI_CreateJavaVM");

    if(createJVM != NULL)
    {
#ifdef QT_DEBUG
        qDebug() << "Success JVM creating\n";
#endif
        printf("Success JVM creating\n");
    }

    free(java_env);
}
#endif

int main(int argc, char *argv[])
{
    // if linux system is used need to set desktop environment to NONE,
    // otherwise launcher is crashed
    // TODO check it on Centos 7
#ifdef __linux__
    setenv("XDG_CURRENT_DESKTOP", "NONE", 1);
#endif

    QChar separator = ';';
#ifdef __linux__
    separator = ':';
#endif

    QString paths("-Djava.class.path=");

    QApplication a(argc, argv);
    QStringList app_args = a.arguments();
    QDir bin_dir(a.applicationDirPath());
    QString app_exe_path = bin_dir.absoluteFilePath(a.applicationFilePath());
#ifdef QT_DEBUG
    qDebug() << app_exe_path;
#endif
    qint64 app_pid = QCoreApplication::applicationPid();
#ifdef QT_DEBUG
    qDebug() << app_pid;
#endif
    QDir app_dir(a.applicationDirPath() + "/../");
    paths.append(app_dir.absoluteFilePath("RedExpert.jar"));
    paths.append(separator);

#ifdef __linux__
    paths.append(app_dir.absoluteFilePath("createDesktopEntry.sh"));
    paths.append(separator);
    paths.append(app_dir.absoluteFilePath("redexpert.desktop"));
    paths.append(separator);
#endif

    QDir lib_dir(a.applicationDirPath() + "/../lib");
    QStringList jars = lib_dir.entryList(QStringList() << "*.jar" << "*.JAR", QDir::Files);

    foreach(QString filename, jars)
    {
        paths.append(lib_dir.absoluteFilePath(filename));
        paths.append(separator);
    }

    QDir docs_dir(a.applicationDirPath() + "/../docs");
    jars = docs_dir.entryList(QStringList() << "*.jar" << "*.JAR", QDir::Files);

    foreach(QString filename, jars)
    {
        paths.append(docs_dir.absoluteFilePath(filename));
        paths.append(separator);
    }

    paths = paths.left(paths.lastIndexOf(separator));

#ifdef QT_DEBUG
    qDebug() << paths;
#endif

    // JavaVM variables
    JavaVM* jvm(0);
    JNIEnv* env(0);
    JavaVMInitArgs jvm_args;
    CLEAR(jvm_args);
    std::vector<JavaVMOption> options;
    CLEAR(options);

    // add to java class path Red Expert jar
    std::string stdString = paths.toStdString();
    char* class_path = (char*)stdString.c_str();
    JavaVMOption class_opt;
    class_opt.optionString = class_path;
    class_opt.extraInfo = 0;
    options.push_back(class_opt);

    for (int i = 1; i < argc; i++)
    {
        JavaVMOption opt;
        opt.optionString = argv[i];
        opt.extraInfo = 0;
        options.push_back(opt);
    }

    jvm_args.version = JNI_VERSION_1_8;
    jvm_args.options = options.data();
    jvm_args.nOptions = options.size();
    jvm_args.ignoreUnrecognized = JNI_TRUE;

    // try to create java vm
    //New code:
    jint retCrJvm;
#ifdef __linux__
    CreateJvmFuncPtr createJVM = findCreateJvm();
    printf("findCreateJVM() returned 0x%x\n", createJVM);
    retCrJvm = createJVM(&jvm, (void**)&env, &jvm_args);
#else
    loadJVMLibrary();
    retCrJvm = createJVM(&jvm, &env, &jvm_args);
#endif
    //End new code
    if (retCrJvm != JNI_OK)
    {
        QMessageBox msgBox;
        msgBox.setInformativeText("Cannot create JVM!");
        msgBox.setText("Error when start Red Expert");
        msgBox.setWindowTitle("Application error");
        msgBox.setStandardButtons(QMessageBox::Ok);
        msgBox.setIcon(QMessageBox::Critical);
        msgBox.exec();
#ifdef QT_DEBUG
        qDebug() << "Cannot create JVM!\n";
#endif
        exit(EXIT_FAILURE);
    }

    // find class with main method
    jclass class_ = env->FindClass("org/executequery/ExecuteQuery");
    if (class_ == 0)
    {
        QMessageBox msgBox;
        msgBox.setInformativeText("org.executequery.ExecuteQuery class not found!");
        msgBox.setText("Error when start Red Expert");
        msgBox.setWindowTitle("Application error");
        msgBox.setStandardButtons(QMessageBox::Ok);
        msgBox.setIcon(QMessageBox::Critical);
        msgBox.exec();
#ifdef QT_DEBUG
        qDebug() << "Code class not found!\n";
#endif
        exit(EXIT_FAILURE);
    }

    // get main method
    jmethodID method_id = env->GetStaticMethodID(class_, "main", "([Ljava/lang/String;)V");
    if (method_id == 0)
    {
        QMessageBox msgBox;
        msgBox.setInformativeText("Main method not found!");
        msgBox.setText("Error when start Red Expert");
        msgBox.setWindowTitle("Application error");
        msgBox.setStandardButtons(QMessageBox::Ok);
        msgBox.setIcon(QMessageBox::Critical);
        msgBox.exec();
#ifdef QT_DEBUG
        qDebug() << "Main method not found!\n";
#endif
        exit(EXIT_FAILURE);
    }

    jobjectArray ret;
    int i;

    app_args.append("-exe_path=" + app_exe_path);
    app_args.append("-exe_pid=" + QString::number(app_pid));

    ret = (jobjectArray)env->NewObjectArray(app_args.size(),
                                            env->FindClass("java/lang/String"), env->NewStringUTF(""));

    for (i = 0; i < app_args.size(); i++)
    {
        std::string stdString = app_args.at(i).toStdString();
        char* arg = (char*)stdString.c_str();
        env->SetObjectArrayElement(ret, i, env->NewStringUTF(arg));
    }

    // run main
    env->CallStaticVoidMethod(class_, method_id, ret);

    // clean
    jvm->DestroyJavaVM();

    return a.exec();
}