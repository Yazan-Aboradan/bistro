((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var J,A,C,B={
b9Q(d,e){var x,w,v,u,t,s,r,q=d.a,p=e.a
if(q==null?p==null:q===p)return!0
if(q!=null)x=p==null
else x=!0
if(x)return!1
x=A.a_(q)
w=new J.cU(q,1,x.h("cU<1>"))
v=A.a_(p)
u=new J.cU(p,1,v.h("cU<1>"))
for(x=x.c,v=v.c;;){if(!w.t()||!u.t())return!0
t=w.d
if(t==null)t=x.a(t)
s=u.d
if(s==null)s=v.a(s)
if(typeof t=="number"&&typeof s=="number"){if(isNaN(t)&&isNaN(s))continue
r=t===0
if(r&&s===0){r=r?1/t<0:t<0
if(r!==(s===0?1/s<0:s<0))return!1
continue}}if(!J.d(t,s))return!1}},
b0H(d,e){var x=e.av()
x.a=d
x.c=e
x.oh()
return x},
b0I(d){var x,w
if(d.ib$!=null){if(d.q0$==null)d.q0$=new A.i2(y.t)
while(x=d.ib$,x!=null){d.ib$=x.gh2(0)
w=x.fX$
w.toString
w.w2(x.$ti.h("f2.E").a(x))
w=d.q0$
w.nF(w.c,x,!1)}}},
kD:function kD(d,e){var _=this
_.a=d
_.ia$=_.hl$=_.fX$=null
_.$ti=e},
anP:function anP(){},
aNu:function aNu(){},
pN:function pN(){},
a6j:function a6j(d,e,f,g,h,i,j,k,l,m,n,o,p){var _=this
_.ib$=d
_.Cf$=e
_.a_e$=f
_.q0$=g
_.tD$=h
_.Kz$=i
_.aCd$=j
_.aCe$=k
_.a8=$
_.af=l
_.a6=null
_.aw=m
_.ah=null
_.ok=n
_.p1=!1
_.c=_.b=_.a=_.ay=null
_.d=$
_.e=o
_.r=_.f=null
_.w=p
_.z=_.y=null
_.Q=!1
_.as=!0
_.at=!1},
acH:function acH(){}}
J=c[1]
A=c[0]
C=c[2]
B=a.updateHolder(c[29],B)
B.kD.prototype={}
B.anP.prototype={
ps(d,e){var x,w,v,u,t,s=this
if(s.ib$==null){x=new B.kD(B.b0H(s,d),y.b)
s.ib$=x
w=s.Cf$
w.nF(w.c,x,!1)}else if(A.v(d)!==A.v(s.ib$.a.gCO())){v=A.v(s.ib$.a.gCO())
B.b0I(s)
throw A.f(A.a2("Type mismatch between hooks:\n- previous hook: "+v.k(0)+"\n- new hook: "+A.v(d).k(0)+"\n"))}else{x=s.ib$.a
if(d!==x.gCO()){u=x.gCO()
if(B.b9Q(u,d)){x=s.ib$.a
x.c=d
x.K8(u)}else{x=s.q0$
if(x==null)x=s.q0$=new A.i2(y.t)
w=s.ib$.a
x.nF(x.c,new B.kD(w,y.b),!1)
w=s.ib$
w.toString
w.a=B.b0H(s,d)}}}t=e.a(s.ib$.a.J(s))
s.ib$=s.ib$.gh2(0)
return t}}
B.pN.prototype={
c_(d){var x=A.b([],y.m),w=this.av()
x=new B.a6j(null,new A.i2(y.t),new A.i2(y.p),null,!1,null,!1,!1,A.t(y.z,y.e),x,w,this,C.a5)
w.c=x
w.a=this
return x}}
B.a6j.prototype={}
B.acH.prototype={
cu(d,e){this.tD$=!1
this.a82(0,e)},
bN(){this.tD$=!1
this.a5Y()},
fd(){var x,w,v=this,u=v.tD$!==!0||v.a_e$.i4(0,new B.aNu())
v.tD$=null
v.a_e$.a2(0)
if(!u){w=v.Kz$
w.toString
return w}w=v.Cf$
v.ib$=w.b===0?null:w.ga3(0)
$.pO=v
try{v.Kz$=v.a5X()}finally{v.tD$=null
B.b0I(v)
$.pO=null
w=v.q0$
if(w!=null&&!w.gab(0)){for(x=w.gY(0);x!=null;x=x.gDM())x.a.l()
v.q0$=null}}w=v.Kz$
w.toString
return w},
aM(d){return this.a69(null,d)},
jF(){var x,w,v,u,t,s,r=null
this.a5Z()
u=this.Cf$
if(!u.gab(0))for(x=u.gY(0);x!=null;x=x.gDM())try{x.a.l()}catch(t){w=A.ad(t)
v=A.aK(t)
u=x
u=A.jn("",r,!0,C.bo,"while disposing "+A.v(u).k(0),r,r,C.aQ,!1,!1,!0,C.fw,r)
s=$.kf
if(s!=null)s.$1(new A.bY(w,v,"hooks library",u,r,!1))}},
en(){var x,w,v,u,t,s,r,q,p=null
for(u=this.Cf$,u=A.aT8(u,u.$ti.c),t=u.$ti.c;u.t();){s=u.c
x=s==null?t.a(s):s
try{x.toString}catch(r){w=A.ad(r)
v=A.aK(r)
s=A.jn("",p,!0,C.bo,"while deactivating "+A.v(x).k(0),p,p,C.aQ,!1,!1,!0,C.fw,p)
q=$.kf
if(q!=null)q.$1(new A.bY(w,v,"hooks library",s,p,!1))}}this.a8_()}}
var z=a.updateTypes(["z(kD<z()>)"])
B.aNu.prototype={
$1(d){return d.a.$0()},
$S:z+0};(function inheritance(){var x=a.mixinHard,w=a.inherit
w(B.kD,A.f2)
w(B.anP,A.r)
w(B.aNu,A.dw)
w(B.pN,A.fF)
w(B.acH,A.x_)
w(B.a6j,B.acH)
x(B.acH,B.anP)})()
A.dY(b.typeUniverse,JSON.parse('{"kD":{"f2":["kD<1>"],"f2.E":"kD<1>"},"pN":{"V":[],"h":[]},"a6j":{"hF":[],"bg":[],"W":[],"a1f":[]}}'))
A.w5(b.typeUniverse,JSON.parse('{"h8":1}'))
var y={m:A.M("p<iP<r?>>"),t:A.M("i2<kD<hv<r?,h8<r?>>>>"),p:A.M("i2<kD<z()>>"),z:A.M("cn<r?>"),e:A.M("iP<r?>"),b:A.M("kD<hv<r?,h8<r?>>>")};(function staticFields(){$.pO=null})()};
(a=>{a["9ejkxLpULTTEwax5muWmEuIaCWg="]=a.current})($__dart_deferred_initializers__);