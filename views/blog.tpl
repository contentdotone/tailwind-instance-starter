<section class="bg-slate-50 px-4 py-12 sm:px-6 lg:px-8">
  <div class="mx-auto w-full max-w-6xl">
    <div class="flex flex-col gap-4">
      <p class="text-xs font-semibold uppercase tracking-[0.24em] text-slate-500">Blog</p>
      <h1 class="text-3xl font-semibold text-slate-900 sm:text-4xl">Latest stories & insights</h1>
      <p class="max-w-2xl text-base text-slate-600">Updates, impact stories, and practical guidance from our community.</p>
    </div>

    <div class="mt-10 grid gap-8">
      {{each articles as post limit 1}}
        <article class="group">
          <a href="{{post.getURL()}}" class="grid overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-sm transition hover:-translate-y-1 hover:shadow-lg lg:grid-cols-[1.1fr_1fr]">
            <div class="p-6 sm:p-8">
              <p class="text-xs font-semibold uppercase tracking-[0.24em] text-slate-500">Featured</p>
              <h2 class="mt-3 text-3xl font-semibold text-slate-900">{{post.title}}</h2>
              <p class="mt-4 text-sm leading-relaxed text-slate-600">
                {{post.content.striptags(0,260)}}...
              </p>
              <span class="mt-6 inline-flex items-center text-xs font-semibold uppercase tracking-[0.2em] text-brand">Read more</span>
            </div>
            <div class="min-h-[280px] bg-slate-100">
              <img class="h-full w-full object-cover transition group-hover:scale-[1.02]" src="{{post.main_image.getImage()}}" alt="{{post.title}}" loading="lazy">
            </div>
          </a>
        </article>
      {{/each}}
    </div>

    <div class="mt-8 grid gap-6 sm:grid-cols-3">
      {{each articles as post limit 1,8}}
        <article class="group">
          <a href="{{post.getURL()}}" class="flex h-full flex-col overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-sm transition hover:-translate-y-1 hover:shadow-lg">
            <div class="aspect-video w-full bg-slate-100">
              <img class="h-full w-full object-cover transition group-hover:scale-[1.02]" src="{{post.main_image.getImage()}}" alt="{{post.title}}" loading="lazy">
            </div>
            <div class="flex h-full flex-col p-5">
              <h3 class="text-lg font-semibold text-slate-900">{{post.title}}</h3>
              <p class="mt-3 text-sm leading-relaxed text-slate-600">
                {{post.content.striptags(0,160)}}...
              </p>
              <span class="mt-4 inline-flex items-center text-xs font-semibold uppercase tracking-[0.2em] text-brand">Read more</span>
            </div>
          </a> 
        </article>
      {{/each}}
    </div>
  </div>
</section>
