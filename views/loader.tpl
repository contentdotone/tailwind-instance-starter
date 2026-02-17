<script src="https://cdn.tailwindcss.com"></script>
<script>
  tailwind.config = {
    theme: {
      extend: {
        colors: {
          brand: "#006BA8",
          "brand-light": "#3E99CE",
          "brand-bright": "#19ABFF",
          plum: "#A86CA7",
          blush: "#EBD6E0",
          royal: "#5A2A85",
          forest: "#365C4C",
          sun: "#FFD966",
          sage: "#6B9E7E",
        },
      },
    }, 
  };
</script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
 
<!-- Optional: Preload fonts/icons you use -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Staatliches&family=Source+Sans+3:wght@300;400;500;600;700&display=swap" rel="stylesheet">

{{include /components/header.html}}
 
{{include /components/generic_breadcrumb.html}}

{{current_view}}

{{include /components/footer.html}}