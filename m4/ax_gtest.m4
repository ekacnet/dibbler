AC_DEFUN([AX_ISC_GTEST], [

enable_gtest="no"
GTEST_INCLUDES=

AC_ARG_WITH([gtest-source],
            [AS_HELP_STRING([--with-gtest-source=PATH],
                            [location of the Googletest source])],
            [enable_gtest="yes" ; GTEST_SOURCE="$withval"])

AC_ARG_WITH([gtest],
            [AS_HELP_STRING([--with-gtest=PATH],
                            [specify a path to gtest header files (PATH/include) and library (PATH/lib)])],
        [gtest_path="$withval"; enable_gtest="yes"], [gtest_path="no"])

AC_ARG_WITH([lcov],
            [AS_HELP_STRING([--with-lcov=PROGRAM],
                            [enable gtest and coverage target using the specified lcov])],
                            [lcov="$withval"],
                            [lcov="no"])

USE_LCOV="no"
if test "$lcov" != "no"; then
        # force gtest if not set
        if test "$enable_gtest" = "no"; then
#               AC_MSG_ERROR("lcov needs gtest for test coverage report")
                AC_MSG_NOTICE([gtest support is now enabled, because used by coverage tests])
                enable_gtest="yes"
        fi
        if test "$lcov" != "yes"; then
                LCOV=$lcov
        else
                AC_PATH_PROG([LCOV], [lcov])
        fi
        if test -x "${LCOV}"; then
                USE_LCOV="yes"
        else
                AC_MSG_ERROR([Cannot find lcov.])
        fi
        # is genhtml always in the same directory?
        GENHTML=`echo "$LCOV" | ${SED} s/lcov$/genhtml/`
        if test ! -x $GENHTML; then
                AC_MSG_ERROR([genhtml not found, needed for lcov])
        fi
        # GCC specific?
        CXXFLAGS="$CXXFLAGS -fprofile-arcs -ftest-coverage"
        LIBS=" $LIBS -lgcov"
        AC_SUBST(CPPFLAGS)
        AC_SUBST(LIBS)
        AC_SUBST(LCOV)
        AC_SUBST(GENHTML)
fi
AC_SUBST(USE_LCOV)

#
# Check availability of gtest, which will be used for unit tests.
#
GTEST_LDFLAGS=
GTEST_LDADD=
DISTCHECK_GTEST_CONFIGURE_FLAG=
GTEST_VERSION="unknown"

if test "x$enable_gtest" = "xyes" ; then

    DISTCHECK_GTEST_CONFIGURE_FLAG="--with-gtest=$gtest_path"

    if test -n "$with_gtest_source" ; then

        if test "x$GTEST_SOURCE" = "xyes" ; then

            AC_MSG_CHECKING([for gtest source])
            # If not specified, try some common paths.
            GTEST_SOURCE=
            for d in /usr/src/gtest /usr/local /usr/pkg /opt /opt/local ; do
                if test -f $d/src/gtest-all.cc -a $d/src/gtest_main.cc; then
                    GTEST_SOURCE=$d
                    AC_MSG_RESULT([$GTEST_SOURCE])
                    break
                fi
            done
            if test -z $GTEST_SOURCE ; then
                AC_MSG_ERROR([no gtest source but it was selected])
            fi
        else
            if test ! -d $GTEST_SOURCE/src -a -d $GTEST_SOURCE/googletest; then
                GTEST_SOURCE=$GTEST_SOURCE/googletest
            fi
            AC_CHECK_FILES([$GTEST_SOURCE/src/gtest-all.cc]
                [$GTEST_SOURCE/src/gtest_main.cc],
                [have_gtest_source=yes],
                [AC_MSG_ERROR([no gtest source at $GTEST_SOURCE])])
        fi
        have_gtest_source=yes

        GTEST_LDADD="\$(top_builddir)/ext/gtest/libgtest.a"
        DISTCHECK_GTEST_CONFIGURE_FLAG="--with-gtest-source=$GTEST_SOURCE"
        GTEST_INCLUDES="-I$GTEST_SOURCE -I$GTEST_SOURCE/include"
        GTEST_VERSION="`basename $GTEST_SOURCE`"

# Versions starting from 1.8.0 are put in the googletest directory. If the basename
# returns googletest string, we need to cut it off and try baseline again.
        if test "$GTEST_VERSION" == "googletest"; then
            GTEST_VERSION=${GTEST_SOURCE%"/googletest"}
            GTEST_VERSION=`basename $GTEST_VERSION`
        fi
        GTEST_VERSION="${GTEST_VERSION#googletest-release-}"
        GTEST_VERSION="${GTEST_VERSION#gtest-}"
    fi

    if test "$gtest_path" != "no" ; then
        if test "$gtest_path" != "yes"; then
            GTEST_PATHS=$gtest_path
            if test -x "${gtest_path}/bin/gtest-config" ; then
                GTEST_CONFIG="${gtest_path}/bin/gtest-config"
            fi
        else
            AC_PATH_PROG([GTEST_CONFIG], [gtest-config])
        fi
        if test -x "${GTEST_CONFIG}" ; then :
            # using cppflags instead of cxxflags
            GTEST_INCLUDES=`${GTEST_CONFIG} --cppflags`
            GTEST_LDFLAGS=`${GTEST_CONFIG} --ldflags`
            GTEST_LDADD=`${GTEST_CONFIG} --libs`
            GTEST_VERSION=`${GTEST_CONFIG} --version`
            GTEST_FOUND="true"
        else
            AC_MSG_WARN([Unable to locate Google Test gtest-config.])
            if test -z "${GTEST_PATHS}" ; then
                GTEST_PATHS="/usr /usr/local"
            fi
            GTEST_FOUND="false"
        fi
        if test "${GTEST_FOUND}" != "true"; then
            GTEST_FOUND="false"
            for dir in $GTEST_PATHS; do
                # add uname
                if test -f "$dir/include/gtest/gtest.h"; then
                    libdir="$dir/lib"
                    for d in $libdir $libdir/$build_cpu-linux-gnu; do
                      if test -e $d/libgtest.a ; then
                        libdir=$d
                        break
                      fi
                    done
                    if ! test -f "$libdir/libgtest.a"; then
                        AC_MSG_WARN([Found Google Test include but not the library in $dir.])
                        continue
                    fi
                    GTEST_INCLUDES="-I$dir/include"
                    GTEST_LDFLAGS="-L$dir/lib"
                    GTEST_LDADD="-lgtest"
                    GTEST_FOUND="true"
                    break
                fi
            done
        fi
        if test "${GTEST_FOUND}" != "true"; then
            AC_MSG_ERROR([Cannot find gtest in: $GTEST_PATHS])
        fi

    fi
fi
AM_CONDITIONAL(HAVE_GTEST, test $enable_gtest != "no")
AM_CONDITIONAL(HAVE_GTEST_SOURCE, test "X$have_gtest_source" = "Xyes")
AC_SUBST(DISTCHECK_GTEST_CONFIGURE_FLAG)
AC_SUBST(GTEST_INCLUDES)
AC_SUBST(GTEST_LDFLAGS)
AC_SUBST(GTEST_LDADD)
AC_SUBST(GTEST_SOURCE)

])dnl AX_ISC_GTEST
