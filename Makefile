default: lib
static: lib
dynamic: lib
	$(AR) -x libmpfun90.a
	$(CXX) $(LDFLAGS) -shared -Wl,--as-needed -Wl,-soname,mpfun90.so *.o -o libmpfun90.so


lib: libmpfun90.a


FC = gfortran
FFLAGS := -fPIC $(FFLAGS)


MPFUN = mpfun90.o mpmod90.o mpmodm90.o mpmodx90.o

libmpfun90.a: libmpfun90.a($(MPFUN))

.SUFFIXES: .f90

.f90.a:
	$(FC) $(FFLAGS) -c $<
	$(AR) $(ARFLAGS) $@ $*.o

clean:
	rm -f *.a *.so *.o *.mod
