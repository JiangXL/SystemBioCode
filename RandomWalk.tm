<TeXmacs|1.99.7>

<style|generic>

<\body>
  <doc-data|<doc-title|Random Walk>|<doc-author|<author-data|<author-name|Yuejian
  Mo>|<\author-affiliation>
    <date|>
  </author-affiliation>>>>

  <\equation*>
    J=-<frac|1|2><frac|N<around*|(|x+\<Delta\>x|)>-N<around*|(|x|)>|A\<tau\>>=-<frac|1|2><frac|<around*|(|C<around*|(|x+\<Delta\>x|)>-C<around*|(|x|)>|)>A\<Delta\>x\<tau\>|A
    \<tau\>>=-<frac|\<Delta\>x<rsup|2>|2\<tau\>><frac|C<around*|(|x+\<Delta\>x|)>-C<around*|(|x|)>|\<Delta\>x>=<frac|1|2>D<frac|C<around*|(|x+\<Delta\>x|)>-C<around*|(|x|)>|\<Delta\>x>
  </equation*>

  \;

  <section|Random Walk in 1-D>

  In one dimensional random walk of <math|N> particles. A particle always
  takes a fixed step size <math|\<Delta\>x> toward the left and right with
  equal probability. The position of the particle <math|i> is denoted by
  <math|x<rsub|i><around*|(|n|)>>, where <math|n> is the number of steps that
  particle <math|i> took. All particles move from <math|x<around*|(|0|)>=0>.\ 

  The position average of <math|N> particles is\ 

  <\equation*>
    \<less\>x<around*|(|n|)>\<gtr\>=<big|sum><rsub|i=1><rsup|N>x<rsub|i><around*|(|n|)>=<big|sum><rsub|i=1><rsup|N><around*|(|x<rsub|i><around*|(|n-1|)>\<pm\>\<Delta\>x<rsub|i>|)>=<big|sum><rsub|i=1><rsup|N><around*|(|x<rsub|i><around*|(|0|)>+
    <big|sum><rsub|j=0><rsup|n-1>\<pm\>\<Delta\>x<rsub|i>|)>=0
  </equation*>

  where, I assume that each particle <math|x<rsub|i>> has own
  <math|\<Delta\>x<rsub|i>>.

  \;

  To descript the spread of <math|N> particles, variance is\ 

  <\equation*>
    Var<around*|(|x<around*|(|n|)>|)>=\<less\>x<rsup|2><around*|(|n|)>\<gtr\>-\<less\>x<around*|(|n|)>\<gtr\><rsup|2>=\<less\>x<rsup|2><around*|(|n|)>\<gtr\>=<frac|1|N><big|sum><rsub|i=1><rsup|N>x<rsub|i><rsup|2><around*|(|n|)>=<frac|1|N><big|sum><rsub|i=1><rsup|N><around*|(|x<rsub|i><around*|(|n-1|)>\<pm\>\<Delta\>x|)><rsup|2>
  </equation*>

  But here, textbook don't continue expand <math|x<rsub|i><around*|(|n-1|)>>
  to <math|x<rsub|i><around*|(|0|)>>, which cause
  <math|Var<around*|(|x<around*|(|n|)>|)>=0>. It must has some rules
  determine that why we can't do <math|Var<around*|(|x<around*|(|n|)>|)>> as
  <math|\<less\>x*<around*|(|n|)>\<gtr\>>. Instead, expand
  <math|Var*<around*|(|x<around*|(|n|)>|)>> to
  <math|Var<around*|(|x<around*|(|0|)>|)>> \ 

  <\equation*>
    Var<around*|(|x<around*|(|n|)>|)>=<frac|1|N><big|sum><rsub|i=1><rsup|N><around*|(|x<rsub|i>*<rsup|2><around*|(|n-1|)><rsup|>\<pm\>2x<rsub|i><around*|(|n-1|)>+\<Delta\>x<rsub|i><rsup|2>|)>=Var<around*|(|x<around*|(|n-1|)>|)>+<frac|1|N><big|sum><rsub|i=1><rsup|N>\<Delta\>x<rsub|i><rsup|2>=<frac|1|N><big|sum><rsub|i=1><rsup|N>n\<Delta\>x<rsub|i><rsup|2>
  </equation*>

  More, if we assume that all particles move same step size in time
  <math|\<tau\>>. During <math|t>, the variance of particles
  <math|x<around*|(|n|)>> is

  <\equation*>
    Var<around*|(|x<around*|(|n|)>|)>=n \<Delta\>x<rsup|2>=t<frac|\<Delta\>x<rsup|2>|\<tau\>>=2
    D t
  </equation*>

  <section|Random Walk under external force>

  Fokker-Planck equation describe the time evolution of the p.d.f of the
  velocity of a particle under drag forces and random forces, as in Brownian
  motion.\ 

  <\equation*>
    <frac|\<partial\>|\<partial\>t>f<around*|(|x,t|)>=-<frac|\<partial\>|\<partial\>x><around*|[|D<rsub|1><around*|(|x,t|)>f<around*|(|x,t|)>|]>+<frac|\<partial\><rsup|2>|\<partial\>x<rsup|2>><around*|[|D<rsub|2><around*|(|x,t|)>f<around*|(|x,t|)>|]>
  </equation*>

  where <math|D<rsub|1><around*|(|x,t|)>> is drag force parameter,
  <math|D<rsub|2><around*|(|x,t|)>> is diffusion parameter.

  <section|Reference>

  <hlink|https://en.wikipedia.org/wiki/Fokker%E2%80%93Planck_equation|https://en.wikipedia.org/wiki/Fokker%E2%80%93Planck_equation>
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|auto-3|<tuple|3|?>>
  </collection>
</references>