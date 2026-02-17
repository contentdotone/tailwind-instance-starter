

<section class="bg-slate-50 px-4 py-12 sm:px-6 lg:px-8">
  <div class="mx-auto w-full max-w-6xl">
    <div class="flex flex-col gap-10 lg:flex-row lg:items-start">
      <div class="flex-1 space-y-8">
       

        <div class="overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-sm">
          <img class="h-72 w-full object-cover sm:h-80" src="{{this.main_image}}" alt="{{this.location_name}}" loading="lazy">
           <div class="space-y-3 p-5 pb-0">
          
            <h1 class="text-3xl font-semibold text-slate-900 sm:text-4xl">{{this.location_name}}</h1>
            <p class="text-base text-slate-600">{{this.subtitle}}</p>
            </div>
          <div class="grid gap-6 p-6 sm:grid-cols-2">
            <div>
              <p class="text-xs font-semibold uppercase tracking-[0.2em] text-slate-500">Address</p>
              <p class="mt-2 text-sm font-medium text-slate-700">{{this.address}}</p>
              <p class="text-sm text-slate-600">{{this.city}}, {{this.state}} {{this.zip_code}}</p>
              <a
                href="https://www.google.com/maps?q={{this.address}}%20{{this.city}}%20{{this.state}}%20{{this.zip_code}}"
                class="mt-2 inline-flex text-xs font-semibold uppercase text-brand transition hover:text-brand-light"
                target="_blank"
                rel="noopener noreferrer"
              >
                Click for Directions
              </a>
            </div>  
            <div>
              <p class="text-xs font-semibold uppercase tracking-[0.2em] text-slate-500">Contact</p>
              <p class="mt-2 text-sm font-medium text-slate-700">{{this.phone}}</p>
              <p class="text-sm text-slate-600">{{this.hours}}</p>
            </div>
          </div>
            <div class="px-5 pb-5">
                <h2 class="text-lg font-semibold text-slate-900">Services offered</h2>
                <div class="mt-4 grid gap-4 sm:grid-cols-2">
                    {{each {this.services_offered} as service}}
                    <div class="flex gap-4 rounded-2xl border border-slate-200 bg-slate-50 p-4">
                        <div class="flex h-12 w-20 items-center justify-center rounded-full bg-slate-600 text-white">
                        <i class="fas fa-{{service.service_icon}} text-lg px-4" aria-hidden="true"></i>
                        </div>
                        <div>
                        <h3 class="text-sm font-semibold text-slate-900">{{service.title}}</h3>
                        <p class="mt-1 text-xs leading-relaxed text-slate-600">{{service.description}}</p>
                        </div> 
                    </div>
                    {{/each}}
                </div>
            </div>
        </div>


        <div class="rounded-2xl border border-slate-200 bg-white p-6 shadow-sm">
          <div class="prose max-w-none text-slate-700">
            {{this.about}}
          </div>
        </div>

        
      </div>

      <aside class="w-full lg:w-[360px] lg:shrink-0">
        <div class="sticky top-6 space-y-4">
          <div class="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm">
            
            <div class="mt-3 overflow-hidden rounded-xl border border-slate-200">
              <iframe
                title="{{this.location_name}} map"
                class="h-72 w-full"
                loading="lazy"
                referrerpolicy="no-referrer-when-downgrade"
                src="https://www.google.com/maps?q={{this.address}}%20{{this.city}}%20{{this.state}}%20{{this.zip_code}}&output=embed"
              ></iframe>
            </div>
             <a 
                href="https://www.google.com/maps?q={{this.address}}%20{{this.city}}%20{{this.state}}%20{{this.zip_code}}"
                class="mt-3 inline-flex w-full items-center justify-center rounded-full bg-brand px-4 py-2 text-xs font-semibold uppercase tracking-[0.2em] text-white shadow-sm transition hover:bg-brand-light"
                target="_blank"
                rel="noopener noreferrer"
              >
                Click for Directions 
              </a>
          </div> 
          <div class="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm">
            <p class="text-xs font-semibold uppercase tracking-[0.2em] text-slate-500">Get in touch</p>
            <p class="mt-3 text-sm text-slate-600">Call or visit us to learn more about programs and support available in your community.</p>
            <p class="mt-3 text-sm font-semibold text-slate-700">{{this.phone}}</p>
          </div>
        </div>
      </aside>
    </div>

    {{include /components/storyhubintegration.html}}
  </div>
</section>
