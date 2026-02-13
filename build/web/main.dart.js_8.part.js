((a,b)=>{a[b]=a[b]||{}})(self,"$__dart_deferred_initializers__")
$__dart_deferred_initializers__.current=function(a,b,c,$){var B,C,A={pj:function pj(d,e){this.a=d
this.b=e},
aVw(d,e,f,g){return new A.BQ(d,g,e,null,C.ac,f,null,null)},
rU:function rU(d,e){this.a=d
this.b=e},
ug:function ug(d,e){this.a=d
this.b=e},
BQ:function BQ(d,e,f,g,h,i,j,k){var _=this
_.r=d
_.x=e
_.y=f
_.Q=g
_.c=h
_.d=i
_.e=j
_.a=k},
a3p:function a3p(d,e){var _=this
_.fx=_.fr=_.dy=_.dx=_.db=_.cy=_.cx=_.CW=null
_.e=_.d=$
_.fh$=d
_.cd$=e
_.c=_.a=null},
aDt:function aDt(){},
aDu:function aDu(){},
aDv:function aDv(){},
aDw:function aDw(){},
aDx:function aDx(){},
aDy:function aDy(){},
aDz:function aDz(){},
aDA:function aDA(){},
aYO(){var x=new Float64Array(4)
x[3]=1
return new A.op(x)},
op:function op(d){this.a=d}},D
B=c[0]
C=c[2]
A=a.updateHolder(c[13],A)
D=c[22]
A.pj.prototype={
f6(d){return B.rF(this.a,this.b,d)}}
A.rU.prototype={
f6(d){var x=B.jj(this.a,this.b,d)
x.toString
return x}}
A.ug.prototype={
f6(a8){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h,g,f,e,d,a0,a1,a2=new B.f8(new Float64Array(3)),a3=new B.f8(new Float64Array(3)),a4=A.aYO(),a5=A.aYO(),a6=new B.f8(new Float64Array(3)),a7=new B.f8(new Float64Array(3))
this.a.Zu(a2,a4,a6)
this.b.Zu(a3,a5,a7)
x=1-a8
w=a2.ma(x).a5(0,a3.ma(a8))
v=a4.ma(x).a5(0,a5.ma(a8))
u=new Float64Array(4)
t=new A.op(u)
t.c8(v)
t.xF(0)
s=a6.ma(x).a5(0,a7.ma(a8))
x=new Float64Array(16)
v=new B.b7(x)
r=u[0]
q=u[1]
p=u[2]
o=u[3]
n=r+r
m=q+q
l=p+p
k=r*n
j=r*m
i=r*l
h=q*m
g=q*l
f=p*l
e=o*n
d=o*m
a0=o*l
a1=w.a
x[0]=1-(h+f)
x[1]=j+a0
x[2]=i-d
x[3]=0
x[4]=j-a0
x[5]=1-(k+f)
x[6]=g+e
x[7]=0
x[8]=i+d
x[9]=g-e
x[10]=1-(k+h)
x[11]=0
x[12]=a1[0]
x[13]=a1[1]
x[14]=a1[2]
x[15]=1
x=s.a
v.ja(x[0],x[1],x[2],1)
return v}}
A.BQ.prototype={
aw(){return new A.a3p(null,null)}}
A.a3p.prototype={
mP(d){var x,w,v,u=this,t=null,s=u.CW
u.a.toString
x=y.b
u.CW=x.a(d.$3(s,t,new A.aDt()))
s=y.f
u.cx=s.a(d.$3(u.cx,u.a.x,new A.aDu()))
w=y.d
u.cy=w.a(d.$3(u.cy,u.a.y,new A.aDv()))
v=u.db
u.a.toString
u.db=w.a(d.$3(v,t,new A.aDw()))
u.dx=y.e.a(d.$3(u.dx,u.a.Q,new A.aDx()))
v=u.dy
u.a.toString
u.dy=s.a(d.$3(v,t,new A.aDy()))
v=u.fr
u.a.toString
u.fr=y.w.a(d.$3(v,t,new A.aDz()))
v=u.fx
u.a.toString
u.fx=x.a(d.$3(v,t,new A.aDA()))},
J(d){var x,w,v,u,t,s,r,q=this,p=null,o=q.geX(),n=q.CW
n=n==null?p:n.au(0,o.gu(0))
x=q.cx
x=x==null?p:x.au(0,o.gu(0))
w=q.cy
w=w==null?p:w.au(0,o.gu(0))
v=q.db
v=v==null?p:v.au(0,o.gu(0))
u=q.dx
u=u==null?p:u.au(0,o.gu(0))
t=q.dy
t=t==null?p:t.au(0,o.gu(0))
s=q.fr
s=s==null?p:s.au(0,o.gu(0))
r=q.fx
r=r==null?p:r.au(0,o.gu(0))
return B.h6(n,q.a.r,C.C,p,u,w,v,p,t,x,s,r,p)}}
A.op.prototype={
c8(d){var x=d.a,w=this.a,v=x[0]
w.$flags&2&&B.au(w)
w[0]=v
w[1]=x[1]
w[2]=x[2]
w[3]=x[3]},
a4P(d){var x,w,v,u,t,s=d.a,r=s[0],q=s[4],p=s[8],o=0+r+q+p
if(o>0){x=Math.sqrt(o+1)
r=this.a
r.$flags&2&&B.au(r)
r[3]=x*0.5
x=0.5/x
r[0]=(s[5]-s[7])*x
r[1]=(s[6]-s[2])*x
r[2]=(s[1]-s[3])*x}else{if(r<q)w=q<p?2:1
else w=r<p?2:0
v=(w+1)%3
u=(w+2)%3
r=w*3
q=v*3
p=u*3
x=Math.sqrt(s[r+w]-s[q+v]-s[p+u]+1)
t=this.a
t.$flags&2&&B.au(t)
t[w]=x*0.5
x=0.5/x
t[3]=(s[q+u]-s[p+v])*x
t[v]=(s[r+v]+s[q+w])*x
t[u]=(s[r+u]+s[p+w])*x}},
xF(d){var x,w,v,u=Math.sqrt(this.gxs())
if(u===0)return 0
x=1/u
w=this.a
v=w[0]
w.$flags&2&&B.au(w)
w[0]=v*x
w[1]=w[1]*x
w[2]=w[2]*x
w[3]=w[3]*x
return u},
gxs(){var x=this.a,w=x[0],v=x[1],u=x[2],t=x[3]
return w*w+v*v+u*u+t*t},
gB(d){var x=this.a,w=x[0],v=x[1],u=x[2],t=x[3]
return Math.sqrt(w*w+v*v+u*u+t*t)},
ma(d){var x=new Float64Array(4),w=new A.op(x)
w.c8(this)
x[3]=x[3]*d
x[2]=x[2]*d
x[1]=x[1]*d
x[0]=x[0]*d
return w},
ad(a5,a6){var x,w,v,u,t,s,r,q,p,o,n,m,l,k,j,i,h=this.a,g=h[3],f=h[2],e=h[1],d=h[0],a0=a6.gaBZ(),a1=a0[3],a2=a0[2],a3=a0[1],a4=a0[0]
h=C.d.ad(g,a4)
x=C.d.ad(d,a1)
w=C.d.ad(e,a2)
v=C.d.ad(f,a3)
u=C.d.ad(g,a3)
t=C.d.ad(e,a1)
s=C.d.ad(f,a4)
r=C.d.ad(d,a2)
q=C.d.ad(g,a2)
p=C.d.ad(f,a1)
o=C.d.ad(d,a3)
n=C.d.ad(e,a4)
m=C.d.ad(g,a1)
l=C.d.ad(d,a4)
k=C.d.ad(e,a3)
j=C.d.ad(f,a2)
i=new Float64Array(4)
i[0]=h+x+w-v
i[1]=u+t+s-r
i[2]=q+p+o-n
i[3]=m-l-k-j
return new A.op(i)},
j(d,e){var x,w,v
if(e==null)return!1
if(e instanceof A.op){x=this.a
w=x[3]
v=e.a
x=w===v[3]&&x[2]===v[2]&&x[1]===v[1]&&x[0]===v[0]}else x=!1
return x},
gp(d){return B.bp(this.a)},
a5(d,e){var x,w=new Float64Array(4),v=new A.op(w)
v.c8(this)
x=e.a
w[0]=w[0]+x[0]
w[1]=w[1]+x[1]
w[2]=w[2]+x[2]
w[3]=w[3]+x[3]
return v},
a4(d,e){var x,w=new Float64Array(4),v=new A.op(w)
v.c8(this)
x=e.a
w[0]=w[0]-x[0]
w[1]=w[1]-x[1]
w[2]=w[2]-x[2]
w[3]=w[3]-x[3]
return v},
i(d,e){return this.a[e]},
n(d,e,f){var x=this.a
x.$flags&2&&B.au(x)
x[e]=f},
k(d){var x=this.a
return B.l(x[0])+", "+B.l(x[1])+", "+B.l(x[2])+" @ "+B.l(x[3])}}
var z=a.updateTypes(["pj(@)","ke(@)","rU(@)","ug(@)"])
A.aDt.prototype={
$1(d){return new A.pj(y.k.a(d),null)},
$S:z+0}
A.aDu.prototype={
$1(d){return new D.ke(y.m.a(d),null)},
$S:z+1}
A.aDv.prototype={
$1(d){return new B.nE(y.r.a(d),null)},
$S:229}
A.aDw.prototype={
$1(d){return new B.nE(y.r.a(d),null)},
$S:229}
A.aDx.prototype={
$1(d){return new A.rU(y.a.a(d),null)},
$S:z+2}
A.aDy.prototype={
$1(d){return new D.ke(y.m.a(d),null)},
$S:z+1}
A.aDz.prototype={
$1(d){return new A.ug(y.E.a(d),null)},
$S:z+3}
A.aDA.prototype={
$1(d){return new A.pj(y.k.a(d),null)},
$S:z+0};(function inheritance(){var x=a.inheritMany,w=a.inherit
x(B.aP,[A.pj,A.rU,A.ug])
w(A.BQ,B.xH)
w(A.a3p,B.pk)
x(B.dw,[A.aDt,A.aDu,A.aDv,A.aDw,A.aDx,A.aDy,A.aDz,A.aDA])
w(A.op,B.r)})()
B.dY(b.typeUniverse,JSON.parse('{"pj":{"aP":["hR?"],"aN":["hR?"],"aN.T":"hR?","aP.T":"hR?"},"rU":{"aP":["ay"],"aN":["ay"],"aN.T":"ay","aP.T":"ay"},"ug":{"aP":["b7"],"aN":["b7"],"aN.T":"b7","aP.T":"b7"},"BQ":{"V":[],"h":[]},"a3p":{"ak":["BQ"]}}'))
var y=(function rtii(){var x=B.M
return{k:x("hR"),a:x("ay"),r:x("kc"),m:x("d5"),E:x("b7"),b:x("pj?"),e:x("rU?"),d:x("nE?"),f:x("ke?"),w:x("ug?")}})()};
(a=>{a["BIFIcXgjBIGemLtlIcTFAIyb/0Q="]=a.current})($__dart_deferred_initializers__);
//# sourceMappingURL=main.dart.js_8.part.js.map
