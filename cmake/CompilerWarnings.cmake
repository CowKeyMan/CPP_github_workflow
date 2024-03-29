# Obtained from: https://github.com/lefticus/cpp_starter_project/blob/master/cmake/CompilerWarnings.cmake
# This file creates a function to enable compiler warnings for both MSVC
# as well as other compilers

function(enable_warnings THIS_TARGET ENCAPSULATION)
  if(MSVC)
    target_compile_options(
      ${THIS_TARGET} ${ENCAPSULATION}
      /W4
      /W4 # Baseline reasonable warnings
      /w14242 # 'identifier': conversion from 'type1' to 'type1', possible loss of data
      /w14254 # 'operator': conversion from 'type1:field_bits' to 'type2:field_bits', possible loss of data
      /w14263 # 'function': member function does not override any base class virtual member function
      /w14265 # 'classname': class has virtual functions, but destructor is not virtual instances of this class may not
              # be destructed correctly
      /w14287 # 'operator': unsigned/negative constant mismatch
      /we4289 # nonstandard extension used: 'variable': loop control variable declared in the for-loop is used outside
              # the for-loop scope
      /w14296 # 'operator': expression is always 'boolean_value'
      /w14311 # 'variable': pointer truncation from 'type1' to 'type2'
      /w14545 # expression before comma evaluates to a function which is missing an argument list
      /w14546 # function call before comma missing argument list
      /w14547 # 'operator': operator before comma has no effect; expected operator with side-effect
      /w14549 # 'operator': operator before comma has no effect; did you intend 'operator'?
      /w14555 # expression has no effect; expected expression with side- effect
      /w14619 # pragma warning: there is no warning number 'number'
      /w14640 # Enable warning on thread un-safe static member initialization
      /w14826 # Conversion from 'type1' to 'type_2' is sign-extended. This may cause unexpected runtime behavior.
      /w14905 # wide string literal cast to 'LPSTR'
      /w14906 # string literal cast to 'LPWSTR'
      /w14928 # illegal copy-initialization; more than one user-defined conversion has been implicitly applied
      /permissive- # standards conformance mode for MSVC compiler.
    )
  else()
    target_compile_options(
      ${THIS_TARGET} ${ENCAPSULATION}
        -Wabi                       # Warn about things that will change when compiling with an ABI-compliant compiler.
        -Wabi-tag                   # Warn if a subobject has an abi_tag attribute that the complete object type does not have.
        -Wabi=2                     # Warn about things that change between the current -fabi-version and the specified version.
        -Waddress                   # Warn about suspicious uses of memory addresses.
        -Waddress-of-packed-member  # Warn when the address of packed member of struct or union is taken.
        -Waggregate-return          # Warn about returning structures, unions or arrays.
        -Waggressive-loop-optimizations # Warn if a loop with constant number of iterations triggers undefined behavior.
        -Waligned-new=all           # Warn even if 'new' uses a class member allocation function.
        # -Wall                       # Enable most warning messages.
        # -Walloc-size-larger-than=   # -Walloc-size-larger-than=<bytes> Warn for calls to allocation functions that attempt to allocate objects larger than the specified number of bytes.
        -Walloc-zero                # -Walloc-zero Warn for calls to allocation functions that specify zero bytes.
        -Walloca                    # Warn on any use of alloca.
        # -Warray-bounds              # Warn if an array is accessed out of bounds.
        # -Warray-bounds=<0,2>        # Warn if an array is accessed out of bounds.
        # -Wattribute-alias           # Warn about type safety and similar errors and mismatches in declarations with alias attributes.  Same as -Wattribute-alias=.
        -Wattribute-alias=2         # Warn about type safety and similar errors and mismatches in declarations with alias attributes.
        -Wattribute-warning         # Warn about uses of __attribute__((warning)) declarations.
        -Wattributes                # Warn about inappropriate attribute usage.
        -Wbool-compare              # Warn about boolean expression compared with an integer value different from true/false.
        -Wbool-operation            # Warn about certain operations on boolean expressions.
        -Wbuiltin-declaration-mismatch # Warn when a built-in function is declared with the wrong signature.
        -Wbuiltin-macro-redefined   # Warn when a built-in preprocessor macro is undefined or redefined.
        -Wc++11-compat              # Warn about C++ constructs whose meaning differs between ISO C++ 1998 and ISO C++ 2011.
        -Wc++14-compat              # Warn about C++ constructs whose meaning differs between ISO C++ 2011 and ISO C++ 2014.
        -Wc++17-compat              # Warn about C++ constructs whose meaning differs between ISO C++ 2014 and ISO C++ 2017.
        -Wcannot-profile            # Warn when profiling instrumentation was requested, but could not be applied to a certain function.
        # -Wcast-align              # Warn about pointer casts which increase alignment.
        -Wcast-align=strict         # Warn about pointer casts which increase alignment.
        -Wcast-function-type        # Warn about casts between incompatible function types.
        -Wcast-qual                 # Warn about casts which discard qualifiers.
        -Wcatch-value               # Warn about catch handlers of non-reference type.  Same as -Wcatch-value=.
        # -Wcatch-value=<0,3>         # Warn about catch handlers of non-reference type.
        -Wchar-subscripts           # Warn about subscripts whose type is "char".
        -Wclass-conversion          # Warn when a conversion function will never be called due to the type it converts to.
        -Wclass-memaccess           # Warn for unsafe raw memory writes to objects of class types.
        -Wclobbered                 # Warn about variables that might be changed by "longjmp" or "vfork".
        -Wcomment                   # Warn about possibly nested block comments, and C++ comments spanning more than one physical line.
        -Wcomments                  # Synonym for -Wcomment.  Same as -Wcomment.
        -Wconditionally-supported   # Warn for conditionally-supported constructs.
        -Wconversion                # Warn for implicit type conversions that may change a value.
        -Wconversion-null           # Warn for converting NULL from/to a non-pointer type.
        -Wcoverage-mismatch         # Warn in case profiles in -fprofile-use do not match.
        -Wcpp                       # Warn when a #warning directive is encountered.
        -Wctor-dtor-privacy         # Warn when all constructors and destructors are private.
        -Wdangling-else             # Warn about dangling else.
        -Wdate-time                 # Warn about __TIME__, __DATE__ and __TIMESTAMP__ usage.
        -Wdelete-incomplete         # Warn when deleting a pointer to incomplete type.
        -Wdelete-non-virtual-dtor   # Warn about deleting polymorphic objects with non-virtual destructors.
        -Wdeprecated                # Warn if a deprecated compiler feature, class, method, or field is used.
        -Wdeprecated-copy           # Mark implicitly-declared copy operations as deprecated if the class has a user-provided copy operation.
        -Wdeprecated-copy-dtor      # Mark implicitly-declared copy operations as deprecated if the class has a user-provided copy operation or destructor.
        -Wdeprecated-declarations   # Warn about uses of __attribute__((deprecated)) declarations.
        -Wdisabled-optimization     # Warn when an optimization pass is disabled.
        -Wdiv-by-zero               # Warn about compile-time integer division by zero.
        -Wdouble-promotion          # Warn about implicit conversions from "float" to "double".
        -Wduplicated-branches       # Warn about duplicated branches in if-else statements.
        -Wduplicated-cond           # Warn about duplicated conditions in an if-else-if chain.
        -Weffc++                    # Warn about violations of Effective C++ style rules.
        -Wempty-body                # Warn about an empty body in an if or else statement.
        -Wendif-labels              # Warn about stray tokens after #else and #endif.
        -Wenum-compare              # Warn about comparison of different enum types.
        -Wexpansion-to-defined      # Warn if "defined" is used outside #if.
        # -Wextra                     # Print extra (possibly unwanted) warnings.
        -Wextra-semi                # Warn about semicolon after in-class function definition.
        -Wfloat-conversion          # Warn for implicit type conversions that cause loss of floating point precision.
        -Wfloat-equal               # Warn if testing floating point numbers for equality.
        -Wformat                    # Warn about printf/scanf/strftime/strfmon format string anomalies.  Same as -Wformat=.
        -Wformat-contains-nul       # Warn about format strings that contain NUL bytes.
        -Wformat-extra-args         # Warn if passing too many arguments to a function for its format string.
        -Wformat-nonliteral         # Warn about format strings that are not literals.
        # -Wformat-overflow<0,2>      # Warn about function calls with format strings that write past the end of the destination region.  Same as -Wformat-overflow=1.  Same as -Wformat-overflow=.
        -Wformat-overflow=2         # Warn about function calls with format strings that write past the end of the destination region.
        -Wformat-security           # Warn about possible security problems with format functions.
        -Wformat-signedness         # Warn about sign differences with format functions.
        # -Wformat-truncation         # Warn about calls to snprintf and similar functions that truncate output. Same as -Wformat-truncation=1.  Same as -Wformat-truncation=.
        -Wformat-truncation=2   # Warn about calls to snprintf and similar functions that truncate output.
        -Wformat-y2k                # Warn about strftime formats yielding 2-digit years.
        -Wformat-zero-length        # Warn about zero-length formats.
        -Wformat=2                  # Warn about printf/scanf/strftime/strfmon format string anomalies.
        -Wframe-address             # Warn when __builtin_frame_address or __builtin_return_address is used unsafely.
        # -Wframe-larger-than=<byte-size> # Warn if a function's stack frame requires in excess of <byte-size>.
        -Wfree-nonheap-object       # Warn when attempting to free a non-heap object.
        -Whsa                       # Warn when a function cannot be expanded to HSAIL.
        -Wif-not-aligned            # Warn when the field in a struct is not aligned.
        -Wignored-attributes        # Warn whenever attributes are ignored.
        -Wignored-qualifiers        # Warn whenever type qualifiers are ignored.
        -Wimplicit-fallthrough=5    # Warn when a switch case falls through.
        -Winherited-variadic-ctor   # Warn about C++11 inheriting constructors when the base has a variadic constructor.
        -Winit-list-lifetime        # Warn about uses of std::initializer_list that can result in dangling pointers.
        -Winit-self                 # Warn about variables which are initialized to themselves.
        -Winline                    # Warn when an inlined function cannot be inlined.
        -Wint-in-bool-context       # Warn for suspicious integer expressions in boolean context.
        -Wint-to-pointer-cast       # Warn when there is a cast to a pointer from an integer of a different size.
        -Winvalid-memory-model      # Warn when an atomic memory model parameter is known to be outside the valid range.
        -Winvalid-offsetof          # Warn about invalid uses of the "offsetof" macro.
        -Winvalid-pch               # Warn about PCH files that are found but not used.
        -Wlarger-than=1048576       # Warn if an object's size exceeds <byte-size>. (1048576 = 1MB)
        -Wliteral-suffix            # Warn when a string or character literal is followed by a ud-suffix which does not begin with an underscore.
        -Wlogical-not-parentheses   # Warn when logical not is used on the left hand side operand of a comparison.
        -Wlogical-op                # Warn when a logical operator is suspiciously always evaluating to true or false.
        -Wlong-long                 # Do not warn about using "long long" when -pedantic.
        -Wlto-type-mismatch         # During link time optimization warn about mismatched types of global declarations.
        -Wmain                      # Warn about suspicious declarations of "main".
        -Wmaybe-uninitialized       # Warn about maybe uninitialized automatic variables.
        -Wmemset-elt-size           # Warn about suspicious calls to memset where the third argument contains the number of elements not multiplied by the element size.
        -Wmemset-transposed-args    # Warn about suspicious calls to memset where the third argument is constant literal zero and the second is not.
        -Wmisleading-indentation    # Warn when the indentation of the code does not reflect the block structure.
        -Wmissing-attributes        # Warn about declarations of entities that may be missing attributes that related entities have been declared with.
        -Wmissing-braces            # Warn about possibly missing braces around initializers.
        -Wmissing-declarations      # Warn about global functions without previous declarations.
        -Wmissing-field-initializers # Warn about missing fields in struct initializers.
        -Wmissing-include-dirs      # Warn about user-specified include directories that do not exist.
        -Wmissing-profile           # Warn in case profiles in -fprofile-use do not exist.
        -Wmultichar                 # Warn about use of multi-character character constants.
        -Wmultiple-inheritance      # Warn on direct multiple inheritance.
        -Wmultistatement-macros     # Warn about unsafe macros expanding to multiple statements used as a body of a clause such as if, else, while, switch, or for.
        # -Wnamespaces                # Warn on namespace definition.
        -Wnarrowing                 # Warn about narrowing conversions within { } that are ill-formed in C++11.
        # -Wno-alloc-size-larger-than # -Wno-alloc-size-larger-than Disable Walloc-size-larger-than= warning.  Equivalent to Walloc-size-larger-than=<SIZE_MAX> or larger.  Same as -Walloc-size-larger-than=.
        # -Wno-alloca-larger-than     # -Wno-alloca-larger-than Disable Walloca-larger-than= warning.  Equivalent to Walloca-larger-than=<SIZE_MAX> or larger.  Same as -Walloca-larger-than=.
        # -Wno-vla-larger-than        # -Wno-vla-larger-than Disable Wvla-larger-than= warning.  Equivalent to Wvla-larger-than=<SIZE_MAX> or larger.  Same as -Wvla-larger-than=.
        -Wnoexcept                  # Warn when a noexcept expression evaluates to false even though the expression can't actually throw.
        -Wnoexcept-type             # Warn if C++17 noexcept function type will change the mangled name of a symbol.
        -Wnon-template-friend       # Warn when non-templatized friend functions are declared within a template.
        -Wnon-virtual-dtor          # Warn about non-virtual destructors.
        -Wnonnull                   # Warn about NULL being passed to argument slots marked as requiring non-NULL.
        -Wnonnull-compare           # Warn if comparing pointer parameter with nonnull attribute with NULL.
        -Wnormalized                # Warn about non-normalized Unicode strings.
        -Wnull-dereference          # Warn if dereferencing a NULL pointer may lead to erroneous or undefined behavior.
        -Wodr                       # Warn about some C++ One Definition Rule violations during link time optimization.
        -Wold-style-cast            # Warn if a C-style cast is used in a program.
        -Wopenmp-simd               # Warn if a simd directive is overridden by the vectorizer cost model.
        -Woverflow                  # Warn about overflow in arithmetic expressions.
        -Woverlength-strings        # Warn if a string is longer than the maximum portable length specified by the standard.
        -Woverloaded-virtual        # Warn about overloaded virtual function names.
        -Wpacked                    # Warn when the packed attribute has no effect on struct layout.
        -Wpacked-bitfield-compat    # Warn about packed bit-fields whose offset changed in GCC 4.4.
        -Wpacked-not-aligned        # Warn when fields in a struct with the packed attribute are misaligned.
        -Wpadded                    # Warn when padding is required to align structure members.
        -Wparentheses               # Warn about possibly missing parentheses.
        -Wpedantic                  # Issue warnings needed for strict compliance to the standard.
        -Wpessimizing-move          # Warn about calling std::move on a local object in a return statement preventing copy elision.
        # -Wplacement-new             # Warn for placement new expressions with undefined behavior.  Same as -Wplacement-new=.
        -Wplacement-new=2       # Warn for placement new expressions with undefined behavior.
        -Wpmf-conversions           # Warn when converting the type of pointers to member functions.
        -Wpointer-arith             # Warn about function pointer arithmetic.
        -Wpointer-compare           # Warn when a pointer is compared with a zero character constant.
        -Wpragmas                   # Warn about misuses of pragmas.
        -Wprio-ctor-dtor            # Warn if constructor or destructors with priorities from 0 to 100 are used.
        -Wpsabi                     # This option lacks documentation.
        -Wredundant-decls           # Warn about multiple declarations of the same object.
        -Wredundant-move            # Warn about redundant calls to std::move.
        -Wregister                  # Warn about uses of register storage specifier.
        -Wreorder                   # Warn when the compiler reorders code.
        -Wrestrict                  # Warn when an argument passed to a restrict-qualified parameter aliases with another argument.
        -Wreturn-local-addr         # Warn about returning a pointer/reference to a local or temporary variable.
        -Wreturn-type               # Warn whenever a function's return type defaults to "int" (C), or about inconsistent return types (C++).
        -Wscalar-storage-order      # Warn on suspicious constructs involving reverse scalar storage order.
        -Wsequence-point            # Warn about possible violations of sequence point rules.
        -Wshadow                    # Warn when one variable shadows another.  Same as -Wshadow=global.
        -Wshadow=compatible-local   # Warn when one local variable shadows another local variable or parameter of compatible type.
        -Wshadow=global             # Warn when one variable shadows another (globally).  Same as -Wshadow.
        -Wshadow=local              # Warn when one local variable shadows another local variable or parameter.
        -Wshift-count-negative      # Warn if shift count is negative.
        -Wshift-count-overflow      # Warn if shift count >= width of type.
        -Wshift-negative-value      # Warn if left shifting a negative value.
        # -Wshift-overflow          # Warn if left shift of a signed value overflows.  Same as -Wshift-overflow=.
        -Wshift-overflow=2          # Warn if left shift of a signed value overflows.
        -Wsign-compare              # Warn about signed-unsigned comparisons.
        -Wsign-conversion           # Warn for implicit type conversions between signed and unsigned integers.
        -Wsign-promo                # Warn when overload promotes from unsigned to signed.
        -Wsized-deallocation        # Warn about missing sized deallocation functions.
        -Wsizeof-array-argument     # Warn when sizeof is applied on a parameter declared as an array.
        -Wsizeof-pointer-div        # Warn about suspicious divisions of two sizeof expressions that don't work correctly with pointers.
        -Wsizeof-pointer-memaccess  # Warn about suspicious length parameters to certain string functions if the argument uses sizeof.
        -Wstack-protector           # Warn when not issuing stack smashing protection for some reason.
        # -Wstack-usage=<byte-size>   # Warn if stack usage might exceed <byte-size>.
        # -Wstrict-aliasing           # Warn about code which might break strict aliasing rules.
        -Wstrict-aliasing=3         # Warn about code which might break strict aliasing rules.
        -Wstrict-null-sentinel      # Warn about uncasted NULL used as sentinel.
        # -Wstrict-overflow           # Warn about optimizations that assume that signed overflow is undefined.
        -Wstrict-overflow=5     # Warn about optimizations that assume that signed overflow is undefined.
        # -Wstringop-overflow         # Warn about buffer overflow in string manipulation functions like memcpy and strcpy.  Same as -Wstringop-overflow=.
        -Wstringop-overflow=4   # Under the control of Object Size type, warn about buffer overflow in string manipulation functions like memcpy and strcpy.
        -Wstringop-truncation       # Warn about truncation in string manipulation functions like strncat and strncpy.
        -Wsubobject-linkage         # Warn if a class type has a base or a field whose type uses the anonymous namespace or depends on a type with no linkage.
        # -Wsuggest-attribute=cold    # Warn about functions which might be candidates for __attribute__((cold)).
        # -Wsuggest-attribute=const   # Warn about functions which might be candidates for __attribute__((const)).
        # -Wsuggest-attribute=format  # Warn about functions which might be candidates for format attributes.
        # -Wsuggest-attribute=malloc  # Warn about functions which might be candidates for __attribute__((malloc)).
        # -Wsuggest-attribute=noreturn # Warn about functions which might be candidates for __attribute__((noreturn)).
        # -Wsuggest-attribute=pure    # Warn about functions which might be candidates for __attribute__((pure)).
        -Wsuggest-final-methods     # Warn about C++ virtual methods where adding final keyword would improve code quality.
        -Wsuggest-final-types       # Warn about C++ polymorphic types where adding final keyword would improve code quality.
        -Wsuggest-override          # Suggest that the override keyword be used when the declaration of a virtual function overrides another.
        -Wswitch                    # Warn about enumerated switches, with no default, missing a case.
        -Wswitch-bool               # Warn about switches with boolean controlling expression.
        -Wswitch-default            # Warn about enumerated switches missing a "default:" statement.
        -Wswitch-enum               # Warn about all enumerated switches missing a specific case.
        -Wswitch-unreachable        # Warn about statements between switch's controlling expression and the first case.
        -Wsync-nand                 # Warn when __sync_fetch_and_nand and __sync_nand_and_fetch built-in functions are used.
        -Wno-system-headers          # Do not suppress warnings from system headers.
        -Wtautological-compare      # Warn if a comparison always evaluates to true or false.
        -Wtemplates                 # Warn on primary template declaration.
        -Wterminate                 # Warn if a throw expression will always result in a call to terminate().
        -Wtrampolines               # Warn whenever a trampoline is generated.
        -Wtrigraphs                 # Warn if trigraphs are encountered that might affect the meaning of the program.
        -Wtype-limits               # Warn if a comparison is always true or always false due to the limited range of the data type.
        -Wundef                     # Warn if an undefined macro is used in an #if directive.
        -Wuninitialized             # Warn about uninitialized automatic variables.
        -Wunknown-pragmas           # Warn about unrecognized pragmas.
        -Wunreachable-code          # Does nothing. Preserved for backward compatibility.
        -Wunsafe-loop-optimizations # Does nothing. Preserved for backward compatibility.
        -Wunused                    # Enable all -Wunused- warnings.
        -Wunused-but-set-parameter  # Warn when a function parameter is only set, otherwise unused.
        -Wunused-but-set-variable   # Warn when a variable is only set, otherwise unused.
        # -Wunused-const-variable     # Warn when a const variable is unused.  Same as -Wunused-const-variable=.
        -Wunused-const-variable=2   # Warn when a const variable is unused.
        -Wunused-function           # Warn when a function is unused.
        -Wunused-label              # Warn when a label is unused.
        -Wunused-local-typedefs     # Warn when typedefs locally defined in a function are not used.
        # -Wunused-macros             # Warn about macros defined in the main file that are not used.
        -Wunused-parameter          # Warn when a function parameter is unused.
        -Wunused-result             # Warn if a caller of a function, marked with attribute warn_unused_result, does not use its return value.
        -Wunused-value              # Warn when an expression value is unused.
        -Wunused-variable           # Warn when a variable is unused.
        -Wuseless-cast              # Warn about useless casts.
        -Wvarargs                   # Warn about questionable usage of the macros used to retrieve variable arguments.
        -Wvariadic-macros           # Warn about using variadic macros.
        -Wvector-operation-performance # Warn when a vector operation is compiled outside the SIMD.
        -Wvirtual-inheritance       # Warn on direct virtual inheritance.
        -Wvirtual-move-assign       # Warn if a virtual base has a non-trivial move assignment operator.
        -Wvla                       # Warn if a variable length array is used.
        # -Wvla-larger-than=<number>  # Warn on unbounded uses of variable-length arrays, and on bounded uses of variable-length arrays whose bound can be larger than <number> bytes. <number> bytes.
        -Wvolatile-register-var     # Warn when a register variable is declared volatile.
        -Wwrite-strings             # In C++, nonzero means warn about deprecated conversion from string literals to 'char *'.  In C, similar warning, except that the conversion is of course not deprecated # by the ISO C standard.
        -Wzero-as-null-pointer-constant # Warn when a literal '0' is used as null pointer.
    )
  endif()
endfunction()
