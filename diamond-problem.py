class O(object):
    def foo(self):
        print("O")

class A(O):
    def foo(self):
        super().foo()
        print("A")

class B(O):
    def foo(self):
        super().foo()
        print("B")

class C(A, B):
    def foo(self):
        print("---super().foo()---")
        super().foo() # O B A
        print("---B.foo(self)---")
        B.foo(self) # O B
        print("---A.foo(self)---")
        A.foo(self) # O B A
        print("---print(\"C\")---")
        print("C") # C

print(C.mro())
c = C()
c.foo()
