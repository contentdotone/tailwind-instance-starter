<section class="bg-white px-4 py-12 sm:px-6 lg:px-8">
  <div class="mx-auto w-full max-w-4xl">
    <div class="space-y-3">
      <p class="text-xs font-semibold uppercase tracking-[0.24em] text-slate-500">Article</p>
      <h1 class="text-3xl font-semibold text-slate-900 sm:text-4xl">{{this.title}}</h1>
    </div>

    <div class="mt-8 overflow-hidden rounded-2xl border border-slate-200 bg-slate-100">
      <img class="h-[320px] w-full object-cover sm:h-[380px]" src="{{this.main_image.getImage()}}" alt="{{this.title}}" loading="lazy">
    </div>

    <div class="prose mt-8 max-w-none text-slate-700">
      {{this.content}}
    </div>
  </div>
</section> 
