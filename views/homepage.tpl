<section class="bg-slate-950 px-4 py-16 text-white sm:px-6 lg:px-8">
  <div class="mx-auto grid w-full max-w-6xl gap-10 lg:grid-cols-[1.1fr_0.9fr] lg:items-center">
    <div class="space-y-6">
      <img class="w-[200px] h-auto" src="https://7m2bt8n1.media.zestyio.com/society-of-st-vincent-de-paul-logo-svg-vector.png" alt="svdp" />
      <div class="space-y-3">
        <p class="text-xs font-semibold uppercase tracking-[0.32em] text-slate-400">{{this.lead_in_title}}</p>
        <h1 class="text-3xl font-semibold sm:text-4xl">{{this.h1_title}}</h1>
      </div>
      <div class="space-y-4 text-sm leading-relaxed text-slate-200">
        {{this.lead_in_content}}
      </div>
    </div> 
    <div class="grid gap-4 sm:grid-cols-2">
      <div class="overflow-hidden rounded-2xl bg-white/5 shadow-lg">
        <img 
          src="{{this.lead_in_image_1.getImage()}}"
          alt="Vincentian volunteers serving the community"
          class="h-48 w-full object-cover sm:h-56"
          loading="lazy"
        />  
      </div>
      <div class="overflow-hidden rounded-2xl bg-white/5 shadow-lg sm:row-span-2">
        <img
          src="{{this.lead_in_image_2.getImage()}}"
          alt="Community landmark"
          class="h-full w-full object-cover"
          loading="lazy"
        />
      </div>
      <div class="overflow-hidden rounded-2xl bg-white/5 shadow-lg">
        <img
          src="{{this.lead_in_image_3.getImage()}}"
          alt="Support services in action"
          class="h-48 w-full object-cover sm:h-56"
          loading="lazy"
        />
      </div>
    </div>
  </div>
</section>


{{include /components/threeways.html}}

{{blocks({this.first_block})}}

{{blocks({this.second_block})}}

{{blocks({this.third_block})}}
