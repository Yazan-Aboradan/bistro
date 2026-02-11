((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,B={Cb:function Cb(){},Vo:function Vo(d,e){this.a=d
this.b=e},a0X:function a0X(d,e,f,g,h,i,j,k){var _=this
_.a=d
_.b=e
_.c=f
_.d=g
_.e=h
_.f=i
_.r=j
_.w=k},afP:function afP(){},
aUe(d,e,f){return A.adX(new B.aPS(d,f,e,null),y.v)},
aPS:function aPS(d,e,f,g){var _=this
_.a=d
_.b=e
_.c=f
_.d=g}},E,D
J=c[1]
A=c[0]
C=c[2]
B=a.updateHolder(c[19],B)
E=c[25]
D=c[35]
B.Cb.prototype={
DY(d){return this.aA9(d)},
aA9(d){var x=0,w=A.T(y.e),v,u=2,t=[],s,r,q,p,o,n
var $async$DY=A.O(function(e,f){if(e===1){t.push(f)
x=u}for(;;)switch(x){case 0:o=A.c8("https://api-bistro.scanly-app.com/api/users/signup/",0,null)
u=4
q=y.w
q=A.n(["Content-Type","application/json"],q,q)
x=7
return A.U(B.aUe(o,C.as.C1(d.eU(),null),q),$async$DY)
case 7:s=f
if(s.b===201||s.b===200){A.ea("\u2705 User registered successfully!")
q=s
A.ea(A.aU_(A.aTt(q.e)).dh(0,q.w))
v=!0
x=1
break}else{A.ea("\u274c Failed: "+s.b)
q=s
A.ea("Response: "+A.aU_(A.aTt(q.e)).dh(0,q.w))
v=!1
x=1
break}u=2
x=6
break
case 4:u=3
n=t.pop()
r=A.ad(n)
A.ea("\u274c Error during registration: "+A.l(r))
v=!1
x=1
break
x=6
break
case 3:x=2
break
case 6:case 1:return A.R(v,w)
case 2:return A.Q(t.at(-1),w)}})
return A.S($async$DY,w)},
D3(d,e,f){return this.axG(d,e,f)},
axG(d,a0,a1){var x=0,w=A.T(y.B),v,u=2,t=[],s,r,q,p,o,n,m,l,k,j,i,h,g,f,e
var $async$D3=A.O(function(a2,a3){if(a2===1){t.push(a3)
x=u}for(;;)switch(x){case 0:f=A.c8("https://api-bistro.scanly-app.com/api/users/login/",0,null)
u=4
q=y.w
p=A.n(["Content-Type","application/json"],q,q)
x=7
return A.U(B.aUe(f,C.as.C1(A.n(["phone_number",d],q,q),null),p),$async$D3)
case 7:s=a3
q=y.q
if(s.b===200){A.ea("\u2705 Login successful!")
a0.c2(0,$.Oc().gcw(),q).eW(0,null)
q=C.as.mF(0,C.K.dh(0,s.w),null)
p=J.aI(q)
o=p.i(q,"token")
q=p.i(q,"user")
p=J.aI(q)
n=p.i(q,"id")
m=p.i(q,"phone_number")
l=p.i(q,"first_name")
k=p.i(q,"surname")
j=p.i(q,"gender")
i=p.i(q,"country_code")
h=E.aWr(p.i(q,"birthday"))
q=p.i(q,"language")
v=new B.Vo(o,new B.a0X(n,l,k,h,j,m,i,q))
x=1
break}else{q=a0.c2(0,$.Oc().gcw(),q)
p=A.bl(a1,D.y,y.F)
p.toString
q.eW(0,p.ga14())
A.ea("\u274c Login failed: "+s.b)
p=s
A.ea("Response: "+A.aU_(A.aTt(p.e)).dh(0,p.w))
v=null
x=1
break}u=2
x=6
break
case 4:u=3
e=t.pop()
r=A.ad(e)
q=a0.c2(0,$.Oc().gcw(),y.q)
p=A.bl(a1,D.y,y.F)
p.toString
q.eW(0,p.ga13())
A.ea("\u26a0\ufe0f Exception during login: "+A.l(r))
v=null
x=1
break
x=6
break
case 3:x=2
break
case 6:case 1:return A.R(v,w)
case 2:return A.Q(t.at(-1),w)}})
return A.S($async$D3,w)},
El(d,e,f){return this.aBq(d,e,f)},
aBq(d,e,f){var x=0,w=A.T(y.e),v,u=2,t=[],s,r,q,p,o,n,m,l
var $async$El=A.O(function(g,h){if(g===1){t.push(h)
x=u}for(;;)switch(x){case 0:m=A.c8("https://api-bistro.scanly-app.com/api/users/validate-phone/",0,null)
u=4
p=y.w
o=A.n(["Content-Type","application/json"],p,p)
x=7
return A.U(B.aUe(m,C.as.C1(A.n(["phone_number",d],p,p),null),o),$async$El)
case 7:s=h
p=y.q
if(s.b===200){o=$.im()
e.c2(0,o.$1("registerServerSideError").gcw(),p).eW(0,null)
e.c2(0,o.$1("registerUserSideError").gcw(),p).eW(0,null)
r=C.as.mF(0,C.K.dh(0,s.w),null)
if(J.d(J.bA(r,"valid"),!0)){A.ea("\u2705 Phone number is available.")
v=!0
x=1
break}else{A.ea("\u274c Phone number already exists.")
p=e.c2(0,o.$1("registerUserSideError").gcw(),p)
o=A.bl(f,D.y,y.F)
o.toString
p.eW(0,o.ga2a())
v=!1
x=1
break}}else{p=e.c2(0,$.im().$1("registerServerSideError").gcw(),p)
o=A.bl(f,D.y,y.F)
o.toString
p.eW(0,o.gDX())
A.ea("\u274c Validation failed: "+s.b)
v=!1
x=1
break}u=2
x=6
break
case 4:u=3
l=t.pop()
q=A.ad(l)
p=e.c2(0,$.im().$1("registerServerSideError").gcw(),y.q)
o=A.bl(f,D.y,y.F)
o.toString
p.eW(0,o.gDX())
A.ea("\u274c Error during phone number validation: "+A.l(q))
v=!1
x=1
break
x=6
break
case 3:x=2
break
case 6:case 1:return A.R(v,w)
case 2:return A.Q(t.at(-1),w)}})
return A.S($async$El,w)}}
B.Vo.prototype={}
B.a0X.prototype={
eU(){var x=this
return A.n(["id",x.a,"phone_number",x.f,"first_name",x.b,"surname",x.c,"gender",x.e,"country_code",x.r,"birthday",A.aR4("yyyy-MM-dd",null).Cr(x.d),"language",x.w],y.w,y.b)}}
var z=a.updateTypes([])
B.afP.prototype={
$1(d){return null},
$S:654}
B.aPS.prototype={
$1(d){var x=this
return d.vS("POST",x.a,x.b,x.c,x.d)},
$S:214};(function inheritance(){var x=a.inheritMany
x(A.r,[B.Cb,B.Vo,B.a0X])
x(A.dw,[B.afP,B.aPS])})()
var y={F:A.M("eq"),v:A.M("os"),q:A.M("f4<e?>"),w:A.M("e"),e:A.M("z"),b:A.M("@"),B:A.M("Vo?")};(function lazyInitializers(){var x=a.lazyFinal
x($,"bm5","Oc",()=>A.a00(new B.afP(),A.M("e?")))})()};
(a=>{a["uRmBsMSBVlsqZEKLRN0eKQJ4Xf8="]=a.current})($__dart_deferred_initializers__);