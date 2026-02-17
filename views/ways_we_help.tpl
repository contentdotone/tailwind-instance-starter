<section class="bg-slate-50 px-4 py-12 sm:px-6 lg:px-8">
  <div class="mx-auto w-full max-w-6xl">
    <div class="grid gap-10 lg:grid-cols-[1.1fr_0.9fr] lg:items-center">
      <div class="space-y-4">
        <p class="text-xs font-semibold uppercase tracking-[0.24em] text-slate-500">Ways We Help</p>
        <h1 class="text-3xl font-semibold text-slate-900 sm:text-4xl">{{this.title}}</h1>
        <div class="prose max-w-none text-slate-700">
          {{this.content}}
        </div>
      </div>
      <div class="overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-sm">
        <img
          src="{{this.image.getImage()}}"
          alt="{{this.title}}"
          class="h-full w-full object-cover"
        />
      </div>
    </div>
  </div>
</section>
 
<section class="bg-white px-4 py-12 sm:px-6 lg:px-8">
  <div class="mx-auto w-full max-w-6xl">
    <div class="flex flex-col gap-3">
      <p class="text-xs font-semibold uppercase tracking-[0.24em] text-slate-500">Services</p>
      <h2 class="text-2xl font-semibold text-slate-900 sm:text-3xl">Programs that meet urgent needs</h2>
      <p class="max-w-2xl text-sm text-slate-600">Explore core services delivered by local conferences and special works.</p>
    </div>

    <div class="mt-8 grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
      {{each services as service}}
        <article class="flex h-full flex-col overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-sm transition hover:-translate-y-1 hover:shadow-lg">
          <div class="aspect-video w-full bg-slate-100">
            <img class="h-full w-full object-cover" src="{{service.main_image.getImage()}}" alt="{{service.title}}" loading="lazy">
          </div>
          <div class="flex h-full flex-col gap-4 p-6">
            <div class="flex items-center gap-3">
              <div class="flex h-10 w-10 items-center justify-center rounded-full bg-slate-900 text-white">
                <i class="fas fa-{{service.service_icon}}" aria-hidden="true"></i>
              </div>
              <h3 class="text-lg font-semibold text-slate-900">{{service.title}}</h3>
            </div>
            <p class="text-sm leading-relaxed text-slate-600">{{service.description}}</p>
          </div>
        </article>
      {{/each}}
    </div>
  </div>
</section>

{{include /components/impact.html}}
